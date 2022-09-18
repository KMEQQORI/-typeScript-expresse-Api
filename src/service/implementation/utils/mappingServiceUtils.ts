import { User } from "../../../type/entity/user";
import { UserNemmo } from "../../../type/dto/UserNemmo";
import { GroupNemmo } from "../../../type/dto/GroupNemmo";
import { Group } from "../../../type/entity/group";

export function buildNemmoUser(user: User): UserNemmo {
  const attributes = user.userAttributes
    ? user.userAttributes.map((attribute) => {
        return {
          name: attribute.name,
          value: attribute.value,
        };
      })
    : [];
  const roles = user.roles ? user.roles.map((role) => role.name) : [];
  const groups = user.groups
    ? user.groups.map((group) => {
        return {
          id: group.id,
          name: group.name,
        };
      })
    : [];
  // heritage des roles des groupe
  if (user.groups) {
    user.groups.forEach((group) =>
      group.roles ? group.roles.forEach((role) => roles.push(role.name)) : []
    );
  }

  return {
    id: user.id,
    email: user.email,
    firstName: user.firstName,
    lastName: user.lastName,
    username: user.username,
    attributes,
    roles,
    groups,
  };
}

export function buildNemmoUsers(users: User[]): UserNemmo[] {
  return users.map((user) => buildNemmoUser(user));
}

export function buildNemmoGroup(group: Group): GroupNemmo {
  const roles = group.roles ? group.roles.map((role) => role.name) : [];
  return {
    id: group.id,
    name: group.name,
    parentGroup: group.parentGroup,
    roles,
  };
}

export function buildNemmoGroups(groups: Group[]): GroupNemmo[] {
  return groups.map((group) => buildNemmoGroup(group));
}
