class CargosModel {
  static tableName() {
    return "cargo";
  }

  static columns() {
    return ["id", "name", "id_area", "status", "fds"];
  }
}

module.exports = CargosModel;
