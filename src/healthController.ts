import { Request, Response } from "express";

export function health(request: Request, response: Response): void {
  response.status(200).send("UP");
}
