import * as dotenv from "dotenv";
import path from "path";

dotenv.config();

const socketTimeoutMs = process.env.SOCKET_TIMEOUT_MS
  ? parseInt(process.env.SOCKET_TIMEOUT_MS)
  : 0;

export const config = {
  environment: process.env.NODE_ENV || "",
  port: process.env.PORT || 9000,
  logLevel: process.env.LOG_LEVEL || "debug",
  backUrl: process.env.BACK_URL,
  keycloakPublicKey: process.env.KEYCLOAK_PUBLIC_KEY,
  socketTimeoutMs,

  dbName: process.env.DB_NAME || "",
  dbPort: process.env.DB_PORT || "",
  dbSchema: process.env.DB_SCHEMA || "",
  dbDialect: process.env.DB_DIALECT || "",
  dbUsername: process.env.DB_USERNAME || "",
  dbPassword: process.env.DB_PASSWORD || "",
  dbHost: process.env.DB_HOST || "",

  createPostgres: process.env.CREATE_POSTGRES === "true" || false,
};

const rootPath = path.dirname(__dirname);
const resourcesPath = path.resolve(rootPath, "resources");
export const appPath = {
  resourcesPath,
};
