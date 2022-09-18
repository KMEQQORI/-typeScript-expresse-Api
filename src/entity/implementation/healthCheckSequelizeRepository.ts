import { injectable } from "inversify";
import { HealthCheckRepository } from "../interface/healthCheckRepository";
import { sequelize } from "../../database";
import { QueryTypes } from "sequelize";

@injectable()
export class HealthCheckSequelizeRepository implements HealthCheckRepository {
  healthCheckDb(): Promise<boolean> {
    return sequelize
      .query("select 1", {
        raw: true,
        type: QueryTypes.SELECT,
        plain: true,
      })
      .then(() => true)
      .catch(() => false);
  }
}
