const { created } = require("../../helpers/http_response");
const CreateUserService = require("../../service/User/CreateUserService");

class CreateUserController {
  async handle(httpRequest, httpResponse) {
    const { name, email, password } = httpRequest.body;

    const createUserService = new CreateUserService();
    await createUserService.execute({
      name,
      email,
      password,
    });

    return created(httpResponse, "User criado com sucesso!");
  }
}

module.exports = CreateUserController;
