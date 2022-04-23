const express = require("express");

const CreateUserController = require("../controller/User/CreateUserController");

const userRoutes = express.Router();
const createUserController = new CreateUserController();

userRoutes.post("/cadastro", async (httpRequest, httpResponse) => {
   const result = await createUserController.handle(httpRequest, httpResponse)

   return result;
});

userRoutes.post("/login", (httpRequest, httpResponse) => {
   return httpResponse.json({ message: "Teste login" }).send();
});

module.exports = userRoutes;
