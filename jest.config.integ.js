module.exports = {
  name: "integ",
  preset: "ts-jest",
  testEnvironment: "node",
  globals: {
    "ts-jest": {
      tsconfig: "tsconfig.test.json",
    },
  },
  setupFilesAfterEnv: ["./jest.setup.js"],
  globalSetup: "./tests/integ/global/setup.ts",
  globalTeardown: "./tests/integ/global/teardown.ts",
  reporters: ["default", ["jest-junit", { outputName: "integ-junit.xml" }]],
};
