const knex = require("../database");
const UserModel = require("../model/UserModel");

const findOne = async ({ email }) => {
  return knex(UserModel.tableName()).select().where('email', email);
}

// const create = ({name, email, password}) => {

// }

module.exports = {
  findOne,
}
