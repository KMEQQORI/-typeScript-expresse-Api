import { Attribute } from "./attribute";
import { Role } from "./role";
import { Group } from "./group";

export interface User {
  id: string;
  email: string;
  emailConstraint: string;
  emailVerified: boolean;
  enabled: boolean;
  federationLink: string;
  firstName: string;
  lastName: string;
  realmId: string;
  username: string;
  createdTimestamp: number;
  serviceAccountClientLink: string;
  notBefore: number;
  userAttributes: Attribute[];
  roles: Role[];
  groups: Group[];
}
