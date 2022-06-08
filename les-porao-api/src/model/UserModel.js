class UserModel {
  static tableName() {
    return "user";
  }

  static columns() {
    return ["id", "name", "email", "password", "iscompany"];
  }
}

module.exports = UserModel;
