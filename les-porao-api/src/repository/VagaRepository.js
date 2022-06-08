const knex = require("../database");
const CargosModel = require("../model/CargosModel");
const VagasModel = require("../model/VagasModel");

const create = async ({ name, id_cargo, id_user }) => {
  return await knex(VagasModel.tableName()).insert({
    name,
    id_cargo,
    id_user
  });
}

const getVagas = async () => {
  return await knex(VagasModel.tableName()).join(CargosModel.tableName(), `${CargosModel.tableName()}.id`, `${VagasModel.tableName()}.id_cargo`).select();
}

module.exports = {
  create,
  getVagas,
}
