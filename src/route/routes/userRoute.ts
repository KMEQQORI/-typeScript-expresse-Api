import { Router } from "express-serve-static-core";
import { UserController } from "../../controller/userController";
import { iocContainer } from "../../inversify.config";

const userBaseRoute = "/users";

export function registerUserRoutes(router: Router): void {
  const userController = iocContainer.get<UserController>(UserController);

  router.get(userBaseRoute, userController.findAll);
}
