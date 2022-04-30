const { hash } = require("bcrypt");
const knex = require("../../database/index");
const UserModel = require("../../model/UserModel");
const { findOne } = require("../../repository/UserRepository");

class CreateUserService {
  async execute({ name, email, password }) {
    const hashPassword = await hash(password, 0);

    const userAlreadyExists = await findOne({ email });

    if (userAlreadyExists.length > 0) {
      return { error: "User ja existe." }
    }

    const userCreated = knex(UserModel.tableName()).insert({
      name,
      email,
      password: hashPassword
    });

    return userCreated;
  }
}

module.exports = CreateUserService
