const { ok } = require("../helpers/http_response");
const ConversaoMoedaService = require("../service/ConversaoMoedaService")

class ConsersaoMoedaController {
   async handle(httpRequest, httpResponse) {
      const conversaoMoedaService = new ConversaoMoedaService();
      const consultaApiConversaoMoeda = await conversaoMoedaService.execute(httpRequest, httpResponse);

      return ok(httpResponse, consultaApiConversaoMoeda);
   }
}

module.exports = ConsersaoMoedaController
