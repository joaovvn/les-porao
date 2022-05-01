const express = require("express");
const cors = require("cors");

const CreateUserController = require("../controller/User/CreateUserController");
const SignInUserController = require("../controller/User/SignInUserController");

const userRoutes = express.Router();
const createUserController = new CreateUserController();
const signInUserController = new SignInUserController();

/**
* @api {get} /user/cadastro

* @apiName CreateUserController.handle
* @apiGroup User
* @apiUse UserResponse
* 
* @apiSuccessExample Success response:
*  HTTP/1.1 201 CREATED
{
 "code": "CREATED",
 "content": {
    "success": "User criado com sucesso."
 }
}
*/
userRoutes.post("/cadastro", cors(), async (httpRequest, httpResponse) => {
   const result = await createUserController.handle(httpRequest, httpResponse);

   return result;
});

userRoutes.options("/cadastro", cors(), async (httpRequest, httpResponse) => {
   const result = await createUserController.handle(httpRequest, httpResponse);

   return result;
});

/**
* @api {get} /user/login

* @apiName SignInUserController.handle
* @apiGroup User
* @apiUse UserResponse
* 
* @apiSuccessExample Success response:
*  HTTP/1.1 200 OK
{
 "code": "OK",
 "content": {
    "success": "JSON WEB TOKEN"
 }
}
*/
userRoutes.post("/login", cors(), async (httpRequest, httpResponse) => {
   const result = await signInUserController.handle(httpRequest, httpResponse);
   return result;
});

userRoutes.options("/login", cors(), async (httpRequest, httpResponse) => {
   const result = await signInUserController.handle(httpRequest, httpResponse);
   return result;
});

module.exports = userRoutes;
