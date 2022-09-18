import { User } from "./user";
import { Group } from "./group";

export interface Role {
  id: string;
  clientRealmConstraint: string;
  clientRole: boolean;
  description: string;
  name: string;
  realmId: string;
  users: User[];
  groups: Group[];
}
