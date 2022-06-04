const axios = require("axios");
const { serverError } = require("../helpers/http_response");

class ConversaoMoedaService {
  async execute(httpRequest, httpResponse) {
    const urlApiConversao = `https://api.hgbrasil.com/finance`;

    try {
      const apiResponse = await axios.get(urlApiConversao);

      return apiResponse.data;
    } catch (error) {
      serverError(httpRequest, error);
    }
  }
}

module.exports = ConversaoMoedaService;
