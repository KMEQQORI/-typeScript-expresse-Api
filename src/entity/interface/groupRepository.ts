import { Group } from "../../type/entity/group";

export interface GroupRepository {
  findAll(): Promise<Group[]>;
}
