import {
  IsUUID,
  Table,
  Model,
  PrimaryKey,
  Column,
  BelongsToMany,
} from "sequelize-typescript";
import uuid from "uuid";
import { UserGroupMembership } from "./UserGroupMembership";
import { User } from "./User";
import { Role } from "./Role";
import { GroupRoleMapping } from "./GroupRoleMapping";

@Table({
  tableName: "keycloak_group",
  timestamps: false,
})
export class Group extends Model<Group> {
  @IsUUID(4)
  @PrimaryKey
  @Column({ primaryKey: true, defaultValue: uuid })
  id!: string;

  @Column
  name!: string;

  @Column
  parentGroup!: string;

  @Column
  realmId!: string;

  @BelongsToMany(() => User, () => UserGroupMembership)
  users!: User[];

  @BelongsToMany(() => Role, () => GroupRoleMapping)
  roles!: Role[];
}
