import { Role } from "./role";
import { User } from "./user";

export interface Group {
  id: string;
  name: string;
  parentGroup: string;
  realmId: string;
  roles: Role[];
  users: User[];
}
