const { ok } = require("../../helpers/http_response");
const SignInUserService = require("../../service/User/SignInUserService");

class SignInUserController {
  async handle(httpRequest, httpResponse) {
    const { email, password } = httpRequest.body;

    const signInUserService = new SignInUserService();
    const result = await signInUserService.execute({
      email,
      password,
    });

    return ok(httpResponse, result);
  }
}

module.exports = SignInUserController;
