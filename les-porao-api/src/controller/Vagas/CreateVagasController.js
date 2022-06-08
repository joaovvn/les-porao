const { serverError, created } = require("../../helpers/http_response");

class CreateVagasController {
  async handle(httpRequest, httpResponse) {
    try {
      const { name, description, id_cargo } = httpRequest.body;
      const teste = httpRequest.user;
      console.log("teste", teste);

      const createUserService = new CreateUserService();
      const result = await createUserService.execute({
        name,
        description,
        id_cargo,
      });

      return created(httpResponse, result);
    } catch (error) {
      return serverError(httpResponse, error);
    }
  }
}

module.exports = CreateVagasController;
