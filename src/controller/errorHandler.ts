import VError from "verror";
import { logger } from "../logger";
import { Express, Request, Response } from "express";

export function registerErrorHandler(app: Express): void {
  app.use(
    // next function (_) is mandatory for error handling
    // eslint-disable-next-line @typescript-eslint/no-unused-vars
    (error: VError, request: Request, response: Response, _: Function) => {
      logger.warn(error);

      const cause = VError.cause(error);
      if (cause) {
        logger.error(cause);
      }
      const info = VError.info(error);
      response.status(500).send(info["clientMessage"]);
    }
  );
}

export function buildError(
  error: Error | string,
  clientMessage: string
): VError {
  let nestedError: Error;
  if ((error as Error).message) {
    nestedError = error as Error;
  } else {
    nestedError = new Error(error as string);
  }
  return new VError(
    {
      cause: nestedError,
      info: { clientMessage },
    },
    clientMessage
  );
}
