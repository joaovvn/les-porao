const express = require("express");
const CreateVagasController = require("../controller/Vagas/CreateVagasController");
const GetVagaController = require("../controller/Vagas/GetVagaController");
const { auth } = require("../middlewares/auth");

const vagaRoute = express.Router();
const createVagasController = new CreateVagasController();
const getVagaController = new GetVagaController();

vagaRoute.post("/create", auth, async (httpRequest, httpResponse) => {
  const result = await createVagasController.handle(httpRequest, httpResponse);

  return result;
});

vagaRoute.options("/create", auth, async (httpRequest, httpResponse) => {
  const result = await createVagasController.handle(httpRequest, httpResponse);

  return result;
});

vagaRoute.get("/list", async (httpRequest, httpResponse) => {
  const result = await getVagaController.handle(httpRequest, httpResponse);

  return result;
});

vagaRoute.options("/list", async (httpRequest, httpResponse) => {
  const result = await getVagaController.handle(httpRequest, httpResponse);

  return result;
});

module.exports = vagaRoute;
