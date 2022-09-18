import {
  IsUUID,
  Table,
  Model,
  PrimaryKey,
  Column,
  AllowNull,
  ForeignKey,
} from "sequelize-typescript";
import { Group } from "./Group";
import { User } from "./User";

@Table({
  tableName: "user_group_membership",
  timestamps: false,
})
export class UserGroupMembership extends Model<UserGroupMembership> {
  @AllowNull(false)
  @IsUUID(4)
  @PrimaryKey
  @ForeignKey(() => Group)
  @Column
  groupId!: string;

  @AllowNull(false)
  @IsUUID(4)
  @ForeignKey(() => User)
  @Column
  userId!: string;
}
