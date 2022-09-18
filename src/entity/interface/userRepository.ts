import { User } from "../../type/entity/user";

export interface UserRepository {
  findAll(): Promise<User[]>;
}
