/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function(knex) {
  return knex.schema.createTable("vagas", (table) => {
      table.increments("id").primary();
      table.text("name");
      table.integer("id_cargo");
      table.foreign("id_cargo").references("id").inTable("cargo");
    //   table.integer("id_empresa");
    //   table.foreign("id_empresa").references("id").inTable("empresa");
      table.integer("id_user");
      table.foreign("id_user").references("id").inTable("user");
  })
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function(knex) {
  return knex.schema.dropTable("vagas")
};
