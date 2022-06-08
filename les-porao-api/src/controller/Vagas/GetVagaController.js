const { serverError, ok } = require("../../helpers/http_response");
const { getVagas } = require("../../repository/VagaRepository");

class GetVagaController {
  async handle(httpRequest, httpResponse) {
    try {
      const result = await getVagas();
      console.log("result", result)

      return ok(httpResponse, result);
    } catch (error) {
      return serverError(httpResponse, error);
    }
  }
}

module.exports = GetVagaController;
