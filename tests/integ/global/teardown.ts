import Docker from "dockerode";
import { logger } from "../../../src/logger";
import { POSTGRES_CONTAINER_NAME } from "./setup";
import { config } from "../../../src/config";

const docker = new Docker();

export default async function teardown(): Promise<void> {
  if (config.createPostgres) {
    const container = docker.getContainer(POSTGRES_CONTAINER_NAME);
    logger.info(`Stopping container with id=${container.id}`);
    await container.remove({ force: true });
    logger.info("Container stopped");
  }
}
