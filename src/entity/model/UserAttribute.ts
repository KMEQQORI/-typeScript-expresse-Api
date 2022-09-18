import {
  IsUUID,
  Table,
  Model,
  PrimaryKey,
  Column,
  AllowNull,
  ForeignKey,
  BelongsTo,
} from "sequelize-typescript";
import uuid from "uuid";
import { User } from "./User";

@Table({
  tableName: "user_attribute",
  timestamps: false,
})
export class UserAttribute extends Model<UserAttribute> {
  @IsUUID(4)
  @PrimaryKey
  @Column({ primaryKey: true, defaultValue: uuid })
  id!: string;

  @AllowNull(false)
  @IsUUID(4)
  @ForeignKey(() => User)
  @Column
  userId!: string;

  @BelongsTo(() => User)
  user!: User;

  @Column
  name!: string;

  @Column
  value!: string;
}
