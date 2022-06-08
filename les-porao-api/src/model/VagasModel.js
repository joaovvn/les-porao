class VagasModel {
  static tableName() {
    return "vagas";
  }

  static columns() {
    return ['id_vaga', 'name', 'id_cargo', 'id_user'];
  }
}

module.exports = VagasModel;
