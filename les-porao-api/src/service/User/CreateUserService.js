const { hash } = require("bcrypt");
const knex = require("../../database/index");
const UserModel = require("../../model/UserModel");
const { findOne } = require("../../repository/UserRepository");

class CreateUserService {
  async execute({ name, email, password }) {
    // const checkUserExists = findOne({ email_user });

    // if (checkUserExists) {
    //   return
    // }

    const hashPassword = await hash(password, 0);

    const userCreated = knex("user").insert({
      name,
      email,
      password: hashPassword
    });

    return userCreated;
  }
}

module.exports = CreateUserService
