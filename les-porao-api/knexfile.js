module.exports = {

  development: {
    client: 'pg',
    connection: {
      host: '127.0.0.1',
      port: 5432,
      user: 'postgres',
      password: 'admin',
      database: 'porao'
    },
    migrations: {
      tableName: "migrations",
      directory: `${__dirname}/src/database/migrations`
    }
  },
};

// DATABASE_URL="postgresql://postgres:admin@localhost:5432/prisma_deliveries?schema=public"
