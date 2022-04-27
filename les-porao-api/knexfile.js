module.exports = {

  development: {
    client: 'pg',
    connection: {
      host: 'ec2-3-224-125-117.compute-1.amazonaws.com',
      port: 5432,
      user: 'dcqclqatfvweca',
      password: 'd11ca0d9adec21d8cd2f8640b45a4df9f1aeac20699eb88bc27f930e8b1d787d',
      database: 'd2f1mfb6ftaf8n',
      ssl: {rejectUnauthorized: false}
    },
    migrations: {
      tableName: "migrations",
      directory: `${__dirname}/src/database/migrations`
    }
  },
};

// DATABASE_URL="postgresql://postgres:admin@localhost:5432/prisma_deliveries?schema=public"
