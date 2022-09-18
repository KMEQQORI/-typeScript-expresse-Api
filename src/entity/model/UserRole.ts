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
import { User } from "./User";
import { Role } from "./Role";

@Table({
  tableName: "user_role_mapping",
  timestamps: false,
})
export class UserRole extends Model<UserRole> {
  @IsUUID(4)
  @PrimaryKey
  @ForeignKey(() => Role)
  @Column({ primaryKey: true, defaultValue: uuid })
  role_id!: string;

  @AllowNull(false)
  @IsUUID(4)
  @ForeignKey(() => User)
  @Column
  user_id!: string;
}
