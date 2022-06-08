const knex = require("../database");
const UserModel = require("../model/UserModel");

const findOne = async ({ email }) => {
  return knex(UserModel.tableName()).select().where("email", email);
};

const create = async ({ name, email, password, iscompany }) => {
  return await knex(UserModel.tableName()).insert({
    name,
    email,
    password,
    iscompany,
  });
};

module.exports = {
  findOne,
  create,
};
