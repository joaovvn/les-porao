/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.schema.createTable("empresa", (table) => {
    table.increments("id").primary();
    table.text("name");
    table.text("email");
    table.text("password");
    table.integer("status").defaultTo(1);
    // table.integer("id_moeda");
    // table.foreign("id_moeda").references("id").inTable("area");
    table.timestamp("created_at").defaultTo(knex.fn.now());
    table.timestamp("updated_at").defaultTo(knex.fn.now());
  });
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {};
