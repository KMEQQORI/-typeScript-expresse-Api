import { UserService } from "../interface/userService";
import { inject, injectable } from "inversify";
import { UserRepository } from "../../entity/interface/userRepository";
import { TYPE } from "../../inversify.type";
import { UserNemmo } from "../../type/dto/UserNemmo";
import { buildNemmoUsers } from "./utils/mappingServiceUtils";

@injectable()
export class UserConcreteService implements UserService {
  private readonly userRepository: UserRepository;

  constructor(
    @inject(TYPE.UserRepository)
    userRepository: UserRepository
  ) {
    this.userRepository = userRepository;
  }

  async findAll(): Promise<UserNemmo[]> {
    return buildNemmoUsers(await this.userRepository.findAll());
  }
}
