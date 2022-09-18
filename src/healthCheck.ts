import { iocContainer } from "./inversify.config";
import { HealthCheckRepository } from "./entity/interface/healthCheckRepository";
import { TYPE } from "./inversify.type";

export function healthCheckDb(): Promise<boolean> {
  return iocContainer
    .get<HealthCheckRepository>(TYPE.HealthCheckRepository)
    .healthCheckDb();
}
