import { logger } from "../../../src/logger";
import { sleep, testResourcesPath } from "../../utils/testUtils";
import { Client } from "pg";
import path from "path";
import fs from "fs";
import { config } from "../../../src/config";
import Docker from "dockerode";
import * as Dockerode from "dockerode";

const POSTGRES_IMAGE = "postgres:11.4-alpine";
export const POSTGRES_CONTAINER_NAME = "postgres-test";

const docker = new Docker();

async function pullPostgres(): Promise<void> {
  logger.info(`Pulling image ${POSTGRES_IMAGE}`);
  await docker.pull(POSTGRES_IMAGE);
  logger.info("Image pulled");
}

async function createPostgres(): Promise<Dockerode.Container> {
  const postgresContainer = await docker
    .createContainer({
      Image: POSTGRES_IMAGE,
      name: POSTGRES_CONTAINER_NAME,
      HostConfig: {
        PortBindings: {
          "5432/tcp": [{ HostPort: config.dbPort }],
        },
      },
      Env: [
        `POSTGRES_DB=${config.dbName}`,
        `POSTGRES_USER=${config.dbUsername}`,
        `POSTGRES_PASSWORD=${config.dbPassword}`,
      ],
    })
    .catch((error) => {
      logger.error(error);
      return Promise.reject(error);
    });
  logger.info("Postgres container created");
  return postgresContainer;
}

async function startPostgres(
  postgresContainer: Dockerode.Container
): Promise<void> {
  await postgresContainer.start();
  logger.info("Postgres container started");

  // FIXME workaround: waits for postgres to be ready
  await sleep(3000);
  logger.info("Postgres container ready");
}

async function createConnectedPostgresClient(): Promise<Client> {
  const client = new Client({
    host: config.dbHost,
    database: config.dbName,
    port: parseInt(config.dbPort),
    user: config.dbUsername,
    password: config.dbPassword,
  });
  logger.info("Connection to postgres in progress...");
  await client
    .connect()
    .then(() => logger.info("Connected to postgres"))
    .catch((error) => logger.error(error));

  return client;
}

async function runDumpKeycloak(client: Client): Promise<void> {
  const sqlDump = path.resolve(testResourcesPath, "keycloak.sql");
  const sqlDumpContent = fs.readFileSync(sqlDump, "utf8");

  logger.info("Starting to run keycloak dump");
  await client.query(sqlDumpContent).catch((error) => logger.error(error));
  await client.end();
  logger.info("Keycloak dump done");
}

export default async function setup(): Promise<void> {
  if (config.createPostgres) {
    await pullPostgres();

    const postgresContainer = await createPostgres();
    await startPostgres(postgresContainer);
  }

  const client = await createConnectedPostgresClient();
  await runDumpKeycloak(client);
}
