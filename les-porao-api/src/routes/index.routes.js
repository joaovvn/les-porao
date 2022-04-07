const express = require("express");

const conversaoMoedaRoutes = require("./conversaoMoeda.routes");
const userRoutes = require("./user.routes");

const routes = express.Router();

routes.use("/user", userRoutes);
routes.use("/conversao", conversaoMoedaRoutes);

module.exports = routes; 
