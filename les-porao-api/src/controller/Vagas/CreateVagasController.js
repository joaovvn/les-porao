const { serverError, created, unauthorized } = require("../../helpers/http_response");
const CreateVagaService = require("../../service/Vagas/CreateVagaService");

class CreateVagasController {
  async handle(httpRequest, httpResponse) {
    try {
      const { name, id_cargo } = httpRequest.body;
      const { id: id_user, iscompany } = httpRequest.user;
      console.log("isCompany", httpRequest.user)

      const createVagaService = new CreateVagaService();
      if (iscompany) {
        const result = await createVagaService.execute({
          name,
          id_cargo,
          id_user,
        });

        return created(httpResponse, result);
      }
      return unauthorized(httpResponse, "Sem autorizacao!");
    } catch (error) {
      return serverError(httpResponse, error);
    }
  }
}

module.exports = CreateVagasController;
