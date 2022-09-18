import {
  IsUUID,
  Table,
  Model,
  PrimaryKey,
  Column,
  HasMany,
  BelongsToMany,
} from "sequelize-typescript";
import uuid from "uuid";
import { UserAttribute } from "./UserAttribute";
import { UserRole } from "./UserRole";
import { Role } from "./Role";
import { UserGroupMembership } from "./UserGroupMembership";
import { Group } from "./Group";

@Table({
  tableName: "user_entity",
  timestamps: false,
})
export class User extends Model<User> {
  @IsUUID(4)
  @PrimaryKey
  @Column({ primaryKey: true, defaultValue: uuid })
  id!: string;

  @Column
  email!: string;

  @Column
  emailConstraint!: string;

  @Column
  emailVerified!: boolean;

  @Column
  enabled!: boolean;

  @Column
  federationLink!: string;

  @Column
  firstName!: string;

  @Column
  lastName!: string;

  @Column
  realmId!: string;

  @Column
  username!: string;

  @Column
  createdTimestamp!: number;

  @Column
  serviceAccountClientLink!: string;

  @Column
  notBefore!: number;

  @HasMany(() => UserAttribute)
  userAttributes!: UserAttribute[];

  @BelongsToMany(() => Role, () => UserRole)
  roles!: Role[];

  @BelongsToMany(() => Group, () => UserGroupMembership)
  groups!: Group[];
}
