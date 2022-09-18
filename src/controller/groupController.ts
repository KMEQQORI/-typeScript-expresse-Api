import { Request, Response } from "express";
import { inject, injectable } from "inversify";
import { TYPE } from "../inversify.type";
import { GroupService } from "../service/interface/groupService";
import { buildError } from "./errorHandler";

@injectable()
export class GroupController {
  private readonly groupService: GroupService;

  constructor(
    @inject(TYPE.GroupService)
    groupService: GroupService
  ) {
    this.groupService = groupService;
  }

  public findAll = async (
    request: Request,
    response: Response,
    next: Function
  ): Promise<Response> => {
    return this.groupService
      .findAll()
      .then((groups) => response.status(200).send(groups))
      .catch((error) => next(buildError(error, "Error fetching groups")));
  };
}
