const express = require("express");

const userRoutes = express.Router()

userRoutes.get("/teste",  (httpRequest, httpResponse) => {
   return httpResponse.json({message: "Teste usuario"}).send();
});

userRoutes.post("/cadastro", (httpRequest, httpResponse) => {
   return httpResponse.json({message: "Teste cadastro"}).send();
});

userRoutes.post("/login", (httpRequest, httpResponse) => {
   return httpResponse.json({message: "Teste login"}).send();
});
module.exports = userRoutes
