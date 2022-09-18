import { createExpressAppForTests } from "../utils/testUtils";
import { User } from "../../src/type/entity/user";

describe("Test container", () => {
  it("should return the list of all users", async () => {
    const request = createExpressAppForTests();

    await request
      .get("/api/users")
      .expect(200)
      .then((response) => {
        const users: User[] = response.body;
        expect(users.length).toBe(33);
      });
  });
});
