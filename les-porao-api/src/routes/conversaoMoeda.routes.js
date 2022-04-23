const express = require("express");
const ConversaoMoedaController = require("../controller/ConversaoMoedaController");
const { ok } = require("../helpers/http_response");

const conversaoMoedaRoutes = express.Router();
const conversaoMoedaController = new ConversaoMoedaController();

/**
 * @api {get} /conversao

 * @apiName conversaoMoedaController.handle
 * @apiGroup Moeda
 * @apiUse ConversaoResponse
 * 
 * @apiSuccessExample Success response:
 *  HTTP/1.1 200 OK
{
   "code": "OK",
   "content": {
      "USDBRL": {
         "code": "USD",
         "codein": "BRL",
         "name": "Dólar Americano/Real Brasileiro",
         "high": "4.8382",
         "low": "4.6214",
         "varBid": "0.174",
         "pctChange": "3.76",
         "bid": "4.7955",
         "ask": "4.7965",
         "timestamp": "1650661194",
         "create_date": "2022-04-22 17:59:54"
      }
   }
}
 */
conversaoMoedaRoutes.get("/", async (httpRequest, httpResponse) => {
   const result = await conversaoMoedaController.handle(httpRequest, httpResponse);

   return result;
});

module.exports = conversaoMoedaRoutes;
