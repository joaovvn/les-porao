const express = require("express");

const conversaoMoedaRoutes = require("./conversaoMoeda.routes");
const userRoutes = require("./user.routes");
const vagaRoute = require("./vaga.routes");

const routes = express.Router();

routes.use("/user", userRoutes);
routes.use("/conversao", conversaoMoedaRoutes);
routes.use("/vaga", vagaRoute);

module.exports = routes; 
