import { Router } from "express-serve-static-core";
import { GroupController } from "../../controller/groupController";
import { iocContainer } from "../../inversify.config";

const groupBaseRoute = "/groups";

export function registerGroupRoutes(router: Router): void {
  const groupController = iocContainer.get<GroupController>(GroupController);

  router.get(groupBaseRoute, groupController.findAll);
}
