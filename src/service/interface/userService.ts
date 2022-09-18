import { UserNemmo } from "../../type/dto/UserNemmo";

export interface UserService {
  findAll(): Promise<UserNemmo[]>;
}
