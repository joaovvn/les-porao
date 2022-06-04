const { unauthorized } = require("../helpers/http_response");
const { verify } = require("jsonwebtoken");

function auth(httpRequest, httpResponse, next) {
  const authToken = httpRequest.headers.authorization;

  if (!authToken) {
    return unauthorized(httpResponse, "Token is missing");
  }

  const [, token] = authToken.split(" ");

  try {
    verify(token, "3u4m0p0r40");
    return next();
  } catch (err) {
    return unauthorized(httpResponse, "Token invalid");
  }
}

module.exports = { auth };
