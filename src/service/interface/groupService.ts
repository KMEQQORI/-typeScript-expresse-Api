import { GroupNemmo } from "../../type/dto/GroupNemmo";

export interface GroupService {
  findAll(): Promise<GroupNemmo[]>;
}
