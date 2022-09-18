import { UserRepository } from "../interface/userRepository";
import { User as UserDb } from "../model/User";
import { injectable } from "inversify";

import { Group } from "../model/Group";
import { User } from "../../type/entity/user";
import { UserAttribute } from "../model/UserAttribute";
import { Role } from "../model/Role";
import { buildUsers } from "./utils/mappingRepositoryUtils";

@injectable()
export class UserSequelizeRepository implements UserRepository {
  async findAll(): Promise<User[]> {
    const users = await UserDb.findAll({
      raw: false,
      include: [UserAttribute, Role, { model: Group, include: [Role] }],
      where: {
        enabled: true,
        realmId: "nemmo",
      },
    });
    return buildUsers(users);
  }
}
