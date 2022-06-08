const { create } = require("../../repository/VagaRepository");

class CreateVagaService {
  async execute({ name, id_cargo, id_user }) {
    const vagaCreated = create({
      name,
      id_cargo,
      id_user,
    });

    return vagaCreated;
  }
}

module.exports = CreateVagaService;
