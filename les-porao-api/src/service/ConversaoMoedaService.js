const axios = require("axios");
const { serverError } = require("../helpers/http_response")

class ConversaoMoedaService {
   async execute(httpRequest, httpResponse) {
      const { moeda } = httpRequest.body;
      const urlApiConversao = `https://economia.awesomeapi.com.br/json/last/${moeda}-BRL`;

      try {
         const apiResponse = await axios.get(urlApiConversao);

         return apiResponse.data;
      } catch (error) {
         serverError(httpRequest, error);
      }
   }
}

module.exports = ConversaoMoedaService;
