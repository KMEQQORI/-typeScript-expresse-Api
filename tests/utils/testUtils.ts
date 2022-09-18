import supertest from "supertest";
import { createExpressApp } from "../../src/app";
import * as path from "path";

export function createExpressAppForTests(): supertest.SuperTest<
  supertest.Test
> {
  const app = createExpressApp();
  return supertest(app);
}

export const testResourcesPath = path.resolve(
  path.dirname(__dirname),
  "resources"
);

export async function sleep(ms: number): Promise<void> {
  await new Promise((resolve) => setTimeout(resolve, ms));
}
