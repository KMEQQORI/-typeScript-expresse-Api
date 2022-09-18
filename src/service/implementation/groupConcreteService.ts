import { inject, injectable } from "inversify";
import { TYPE } from "../../inversify.type";
import { GroupRepository } from "../../entity/interface/groupRepository";
import { GroupService } from "../interface/groupService";
import { GroupNemmo } from "../../type/dto/GroupNemmo";
import { buildNemmoGroups } from "./utils/mappingServiceUtils";

@injectable()
export class GroupConcreteService implements GroupService {
  private readonly groupRepository: GroupRepository;

  constructor(
    @inject(TYPE.GroupRepository)
    groupRepository: GroupRepository
  ) {
    this.groupRepository = groupRepository;
  }

  async findAll(): Promise<GroupNemmo[]> {
    return buildNemmoGroups(await this.groupRepository.findAll());
  }
}
