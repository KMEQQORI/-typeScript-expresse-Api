import { injectable } from "inversify";
import { Role } from "../model/Role";
import { Group as GroupDb } from "../model/Group";
import { GroupRepository } from "../interface/groupRepository";
import { buildGroups } from "./utils/mappingRepositoryUtils";
import { Group } from "../../type/entity/group";
import { User } from "../model/User";

@injectable()
export class GroupSequelizeRepository implements GroupRepository {
  async findAll(): Promise<Group[]> {
    const groups = await GroupDb.findAll({
      raw: false,
      include: [Role, User],
    });
    return buildGroups(groups);
  }
}
