const { hash } = require("bcrypt");
const knex = require("../../database/index");
const UserModel = require("../../model/UserModel");
const { findOne } = require("../../repository/UserRepository");

class CreateUserService {
  async execute({ no_user, email_user, password_user }) {
    // const checkUserExists = findOne({ email_user });

    // if (checkUserExists) {
    //   return
    // }

    const hashPassword = await hash(password_user, 0);

    const userCreated = knex("tb_user").insert({
      no_user,
      email_user,
      password_user: hashPassword
    });

    return userCreated;
  }
}

module.exports = CreateUserService
