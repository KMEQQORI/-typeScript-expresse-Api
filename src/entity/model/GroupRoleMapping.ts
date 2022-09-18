import {
  AllowNull,
  Column,
  ForeignKey,
  IsUUID,
  Model,
  PrimaryKey,
  Table,
} from "sequelize-typescript";
import uuid from "uuid";
import { Role } from "./Role";
import { Group } from "./Group";

@Table({
  tableName: "group_role_mapping",
  timestamps: false,
})
export class GroupRoleMapping extends Model<GroupRoleMapping> {
  @IsUUID(4)
  @PrimaryKey
  @ForeignKey(() => Role)
  @Column({ primaryKey: true, defaultValue: uuid })
  role_id!: string;

  @AllowNull(false)
  @IsUUID(4)
  @ForeignKey(() => Group)
  @Column
  group_id!: string;
}
