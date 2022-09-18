import { Container } from "inversify";
import { TYPE } from "./inversify.type";
import { UserController } from "./controller/userController";
import { UserService } from "./service/interface/userService";
import { UserConcreteService } from "./service/implementation/userConcreteService";
import { UserRepository } from "./entity/interface/userRepository";
import { UserSequelizeRepository } from "./entity/implementation/userSequelizeRepository";
import { HealthCheckSequelizeRepository } from "./entity/implementation/healthCheckSequelizeRepository";
import { HealthCheckRepository } from "./entity/interface/healthCheckRepository";
import { GroupService } from "./service/interface/groupService";
import { GroupController } from "./controller/groupController";
import { GroupConcreteService } from "./service/implementation/groupConcreteService";
import { GroupRepository } from "./entity/interface/groupRepository";
import { GroupSequelizeRepository } from "./entity/implementation/groupSequelizeRepository";

export const iocContainer = new Container();

export function bindInversionControl(): void {
  // Healthz
  iocContainer
    .bind<HealthCheckRepository>(TYPE.HealthCheckRepository)
    .to(HealthCheckSequelizeRepository)
    .inSingletonScope();

  // Controllers
  iocContainer.bind<UserController>(UserController).toSelf();
  iocContainer.bind<GroupController>(GroupController).toSelf();

  // Services
  iocContainer
    .bind<UserService>(TYPE.UserService)
    .to(UserConcreteService)
    .inSingletonScope();

  iocContainer
    .bind<GroupService>(TYPE.GroupService)
    .to(GroupConcreteService)
    .inSingletonScope();

  // Repositories
  iocContainer
    .bind<UserRepository>(TYPE.UserRepository)
    .to(UserSequelizeRepository)
    .inSingletonScope();

  iocContainer
    .bind<GroupRepository>(TYPE.GroupRepository)
    .to(GroupSequelizeRepository)
    .inSingletonScope();
}
