import "reflect-metadata";

export const TYPE = {
  // Repositories / Gateways
  UserRepository: Symbol.for("UserRepository"),
  GroupRepository: Symbol.for("GroupRepository"),
  HealthCheckRepository: Symbol.for("HealthCheckRepository"),
  // Services
  UserService: Symbol.for("UserService"),
  GroupService: Symbol.for("GroupService"),
};
