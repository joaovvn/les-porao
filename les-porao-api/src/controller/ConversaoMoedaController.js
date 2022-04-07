const ConversaoMoedaService = require("../service/ConversaoMoedaService")

class ConsersaoMoedaController {
   async handle(httpRequest, httpResponse) {
      const conversaoMoedaService = new ConversaoMoedaService();

      const consultaApiConversaoMoeda = await conversaoMoedaService.execute();

      return consultaApiConversaoMoeda;
   }
}

module.exports = ConsersaoMoedaController
