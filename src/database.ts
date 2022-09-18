import * as path from "path";
import { Sequelize } from "sequelize-typescript";
import { Dialect } from "sequelize/types";
import { config } from "./config";

export function initializeSequelize(): Sequelize {
  return initPostgresSequelize();
}

function initPostgresSequelize(): Sequelize {
  return new Sequelize(config.dbName, config.dbUsername, config.dbPassword, {
    dialect: config.dbDialect as Dialect,
    modelPaths: [path.join(__dirname, "./entity/model")],
    host: config.dbHost,
    port: parseInt(config.dbPort),
    define: {
      schema: config.dbSchema,
      underscored: true,
    },
    query: {
      raw: true,
    },
    logging: false,
  });
}

export const sequelize = initializeSequelize();
