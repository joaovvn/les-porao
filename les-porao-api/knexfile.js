module.exports = {

  development: {
    client: 'pg',
    connection: {
      host: process.env.DATABASE_HOST,
      port: 5432,
      user: process.env.DATABASE_USER,
      password: process.env.DATABASE_PASSWORD,
      database: process.env.DATABASE
    },
    migrations: {
      tableName: "migrations",
      directory: `${__dirname}/src/database/migrations`
    }
  },
};

// DATABASE_URL="postgresql://postgres:admin@localhost:5432/prisma_deliveries?schema=public"
