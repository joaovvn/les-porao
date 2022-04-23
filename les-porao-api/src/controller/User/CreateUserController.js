const { created } = require("../../helpers/http_response");
const CreateUserService = require("../../service/User/CreateUserService");

class CreateUserController {
  async handle(httpRequest, httpResponse) {
    const { no_user, email_user, password_user } = httpRequest.body;

    const createUserService = new CreateUserService();
    await createUserService.execute({
      no_user,
      email_user,
      password_user,
    });

    return created(httpResponse, "User criado com sucesso!");
  }
}

module.exports = CreateUserController;
