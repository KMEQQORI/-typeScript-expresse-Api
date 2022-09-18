import winston from "winston";
import { Format, TransformableInfo } from "logform";
import { config } from "./config";

const { combine, timestamp, printf } = winston.format;

function format(): Format {
  const formatMessage = function (info: TransformableInfo): string {
    return `${info.timestamp} [${info.level}] ${info.message}`;
  };
  const formatError = function (info: TransformableInfo): string {
    return `${info.timestamp} [${info.level}]\n${info.stack}`;
  };

  const format = function (info: TransformableInfo): string {
    return info instanceof Error ? formatError(info) : formatMessage(info);
  };

  return combine(printf(format));
}

export const logger = winston.createLogger({
  level: config.logLevel,
  format: combine(timestamp(), format()),
  transports: [
    new winston.transports.Console({
      level: config.logLevel,
    }),
  ],
  exitOnError: false,
});

logger.stream = {
  // @ts-ignore
  write(message: string): void {
    logger.debug(message);
  },
};

function printConfig(): void {
  logger.debug("NODE_ENV: " + config.environment);
  logger.debug("PORT: " + config.port);
  logger.debug("LOG_LEVEL: " + config.logLevel);
  logger.debug("BACK_URL: " + config.backUrl);
  logger.debug("KEYCLOAK_PUBLIC_KEY: " + config.keycloakPublicKey);

  logger.debug("DB_NAME: " + config.dbName);
  logger.debug("DB_PORT: " + config.dbPort);
  logger.debug("DB_PASSWORD: " + config.dbPassword);
  logger.debug("DB_SCHEMA: " + config.dbSchema);
  logger.debug("DB_DIALECT: " + config.dbDialect);
  logger.debug("DB_USERNAME: " + config.dbUsername);
  logger.debug("DB_PASSWORD: " + config.dbPassword);
  logger.debug("DB_HOST: " + config.dbHost);

  logger.debug("CREATE_POSTGRES: " + config.createPostgres);
}

printConfig();
