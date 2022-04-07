const axios = require("axios");
const urlApiConversao = "https://economia.awesomeapi.com.br/json/last/USD-BRL,EUR-BRL";

class ConversaoMoedaService {
   async execute() {
      try {
         const apiResponse = await axios.get(urlApiConversao)
         
         return apiResponse.data;
      } catch (error) {
         console.error("Erro:", error)
      }
   }
}

module.exports = ConversaoMoedaService;
