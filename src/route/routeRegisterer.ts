import { Express } from "express-serve-static-core";
import * as express from "express";
import { registerUserRoutes } from "./routes/userRoute";
import { registerGroupRoutes } from "./routes/groupRoute";

export function registerRoutes(app: Express): void {
  const router = express.Router();
  app.use("/api", router);

  registerUserRoutes(router);
  registerGroupRoutes(router);
}
