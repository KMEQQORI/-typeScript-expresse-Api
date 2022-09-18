module.exports = {
  name: "unit",
  preset: "ts-jest",
  testEnvironment: "node",
  globals: {
    "ts-jest": {
      tsconfig: "tsconfig.test.json",
    },
  },
  reporters: ["default", ["jest-junit", { outputName: "unit-junit.xml" }]],
};
