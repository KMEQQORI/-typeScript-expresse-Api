import {
  IsUUID,
  Table,
  Model,
  PrimaryKey,
  Column,
  BelongsToMany,
} from "sequelize-typescript";
import uuid from "uuid";
import { User } from "./User";
import { UserRole } from "./UserRole";
import { GroupRoleMapping } from "./GroupRoleMapping";
import { Group } from "./Group";

@Table({
  tableName: "keycloak_role",
  timestamps: false,
})
export class Role extends Model<Role> {
  @IsUUID(4)
  @PrimaryKey
  @Column({ primaryKey: true, defaultValue: uuid })
  id!: string;

  @Column
  clientRealmConstraint!: string;

  @Column
  clientRole!: boolean;

  @Column
  description!: string;

  @Column
  name!: string;

  @Column
  realmId!: string;

  @Column
  client!: string;

  @Column
  realm!: string;

  @BelongsToMany(() => User, () => UserRole)
  users!: User[];

  @BelongsToMany(() => Group, () => GroupRoleMapping)
  groups!: Group[];
}
