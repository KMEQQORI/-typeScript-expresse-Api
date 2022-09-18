import { AttributesNemmo } from "./AttributesNemmo";
import { UserGroupNemmo } from "./UserGroupNemmo";

export interface UserNemmo {
  id: string;
  email: string;
  firstName: string;
  lastName: string;
  username: string;
  attributes: AttributesNemmo[];
  roles: string[];
  groups: UserGroupNemmo[];
}
