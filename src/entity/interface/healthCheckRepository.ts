export interface HealthCheckRepository {
  healthCheckDb(): Promise<boolean>;
}
