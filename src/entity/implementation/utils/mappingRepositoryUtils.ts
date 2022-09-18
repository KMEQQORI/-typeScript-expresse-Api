import { User as UserDb } from "../../model/User";
import { User } from "../../../type/entity/user";
import { Group as GroupDb } from "../../model/Group";
import { Group } from "../../../type/entity/group";
import { Role as RoleDb } from "../../model/Role";
import { Role } from "../../../type/entity/role";
import { UserAttribute } from "../../model/UserAttribute";

export function buildFlatGroup(group: GroupDb): Group {
  return {
    id: group.id,
    name: group.name,
    parentGroup: group.parentGroup,
    realmId: group.realmId,
    roles: [],
    users: [],
  };
}

export function buildFlatGroups(groups: GroupDb[]): Group[] {
  return groups.map((group) => buildFlatGroup(group));
}

export function buildFlatRole(role: RoleDb): Role {
  return {
    id: role.id,
    clientRealmConstraint: role.clientRealmConstraint,
    clientRole: role.clientRole,
    description: role.description,
    name: role.name,
    realmId: role.realmId,
    users: [],
    groups: [],
  };
}

export function buildFlatRols(roles: RoleDb[]): Role[] {
  return roles.map((role) => buildFlatRole(role));
}

export function buildFlatUser(user: UserDb): User {
  return {
    id: user.id,
    email: user.email,
    emailConstraint: user.emailConstraint,
    emailVerified: user.emailVerified,
    enabled: user.enabled,
    federationLink: user.federationLink,
    firstName: user.firstName,
    lastName: user.lastName,
    realmId: user.realmId,
    username: user.username,
    createdTimestamp: user.createdTimestamp,
    serviceAccountClientLink: user.serviceAccountClientLink,
    notBefore: user.notBefore,
    userAttributes: [],
    roles: [],
    groups: [],
  };
}

export function buildFlatUsers(users: UserDb[]): User[] {
  return users.map((user) => buildFlatUser(user));
}

export function buildUser(user: UserDb): User {
  return {
    ...buildFlatUser(user),
    userAttributes: user.userAttributes as UserAttribute[],
    roles: buildFlatRols(user.roles),
    groups: buildFlatGroups(user.groups),
  };
}

export function buildUsers(users: UserDb[]): User[] {
  return users.map((user) => buildUser(user));
}

export function buildGroup(group: GroupDb): Group {
  return {
    ...buildFlatGroup(group),
    roles: buildFlatRols(group.roles),
    users: buildFlatUsers(group.users),
  };
}

export function buildGroups(groups: GroupDb[]): Group[] {
  return groups.map((group) => buildGroup(group));
}
