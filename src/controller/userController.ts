import { Request, Response } from "express";
import { inject, injectable } from "inversify";
import { TYPE } from "../inversify.type";
import { UserService } from "../service/interface/userService";
import { buildError } from "./errorHandler";

@injectable()
export class UserController {
  private readonly userService: UserService;

  constructor(
    @inject(TYPE.UserService)
    userService: UserService
  ) {
    this.userService = userService;
  }

  public findAll = async (
    request: Request,
    response: Response,
    next: Function
  ): Promise<Response> => {
    return this.userService
      .findAll()
      .then((users) => response.status(200).send(users))
      .catch((error) => next(buildError(error, "Error fetching users")));
  };
}
