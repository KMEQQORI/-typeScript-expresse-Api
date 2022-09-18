import { appPath, config } from "./config";
import express, { Express, NextFunction, Request, Response } from "express";
import cors from "cors";
import path from "path";
import swaggerUi from "swagger-ui-express";
import YAML from "yamljs";
import morgan from "morgan";
import { logger } from "./logger";
import { healthCheckDb } from "./healthCheck";
import { bindInversionControl } from "./inversify.config";
import { registerRoutes } from "./route/routeRegisterer";
import { registerErrorHandler } from "./controller/errorHandler";
import { initializeSequelize } from "./database";

export function createExpressApp(): Express {
  const app: Express = express();

  initializeSequelize();
  bindInversionControl();

  expressConfigMiddleware(app);
  registerHealthCheck(app);
  registerSwagger(app);
  registerEndpointsLogger(app);
  registerRoutes(app);
  registerErrorHandler(app);

  return app;
}

export function expressConfigMiddleware(app: Express): void {
  app.use(express.json({ limit: "50mb" }));
  app.use(express.urlencoded({ limit: "50mb", extended: true }));
  app.use(cors());

  app.use((req: Request, res: Response, next: NextFunction): void => {
    res.header("Access-Control-Allow-Origin", config.backUrl);
    next();
  });
  app.disable("x-powered-by");
}

export function registerSwagger(app: Express): void {
  app.use(
    "/swagger",
    swaggerUi.serve,
    swaggerUi.setup(
      YAML.load(path.resolve(appPath.resourcesPath, "swagger.yaml")),
      {
        customCss: ".swagger-ui .topbar { display: none }",
      }
    )
  );
}

export function registerEndpointsLogger(app: Express): void {
  app.use(
    // @ts-ignore
    morgan(":method :url :status - :response-time ms", {
      stream: logger.stream,
    })
  );
}

export function registerHealthCheck(app: Express): void {
  app.use("/api/healthz", async (req: Request, res: Response) => {
    const isPostgresUp = await healthCheckDb();

    res.send({
      api: "UP",
      database: isPostgresUp ? "UP" : "DOWN",
    });
  });
}
