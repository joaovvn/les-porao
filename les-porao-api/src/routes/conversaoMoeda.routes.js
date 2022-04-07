const express = require("express");
const ConversaoMoedaController = require("../controller/ConversaoMoedaController");

const conversaoMoedaRoutes = express.Router();

const conversaoMoedaController = new ConversaoMoedaController();

conversaoMoedaRoutes.get("/", async (httpRequest, httpResponse) => {
   const result = await conversaoMoedaController.handle(httpRequest, httpResponse);

   return httpResponse.json({message: result}).send();
});

module.exports = conversaoMoedaRoutes;
