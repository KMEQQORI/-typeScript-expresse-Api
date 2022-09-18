import { config } from "./config";
import { createExpressApp } from "./app";
import { logger } from "./logger";

const app = createExpressApp();

const server = app.listen(config.port, () => {
  logger.info(`Server started on port ${config.port}`);
});

// Nodejs 12.x has a 2-minute default timeout on its socket connections
// https://nodejs.org/docs/latest-v12.x/api/http.html#http_server_timeout
server.timeout = config.socketTimeoutMs;
