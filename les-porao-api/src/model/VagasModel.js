class VagasModel {
  static tableName() {
    return "vagasUser";
  }

  static columns() {
    return ['id', 'name', 'id_cargo', 'id_user'];
  }
}

module.exports = VagasModel;
