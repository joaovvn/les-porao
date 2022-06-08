const express = require("express");
const CreateVagasController = require("../controller/Vagas/CreateVagasController");

const vagaRoute = express.Router();
const createVagasController = new CreateVagasController();

vagaRoute.post("/", async (httpRequest, httpResponse) => {
  const result = await createVagasController.handle(httpRequest, httpResponse);

  return result;
});

vagaRoute.options("/", async (httpRequest, httpResponse) => {
  const result = await conversaoMoedaController.handle(httpRequest, httpResponse);

  return result;
});

vagaRoute.get("/", async (httpRequest, httpResponse) => {
  const result = await conversaoMoedaController.handle(httpRequest, httpResponse);

  return result;
});

module.exports = vagaRoute;
