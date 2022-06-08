const { compare } = require("bcrypt");
const jsonwebtoken = require("jsonwebtoken");
const { findOne } = require("../../repository/UserRepository");

class SignInUserService {
  async execute({ email, password }) {
    try {
      if (!email || !password) {
        return { error: "E preciso completar todos os campos." };
      }

      const [findUser] = await findOne({ email });

      if (!findUser) {
        return { erro: "Email ou senha incorretos" };
      }

      const isSamePassword = await compare(password, findUser.password);

      if (!isSamePassword) {
        return { erro: "Email ou senha incorretos" };
      }

      const token = await jsonwebtoken.sign(
        {
          id: findUser.id,
          name: findUser.name,
          email: findUser.email,
          iscompany: findUser.iscompany,
        },
        "3u4m0p0r40"
      );

      return token;
    } catch (error) {
      console.log("Erro:", error);
    }
  }
}

module.exports = SignInUserService;
