const express = require('express');
const routes = require('./routes/index.routes');
const cors = require('cors');

const PORT = process.env.PORT || 8000

const app = express();

app.use(express.json());
app.use(routes);
app.use(cors());

app.get('/', (req, res) => {
   res.send('API OK ERRO 200 -> v1.1.0');
})

app.listen(PORT, () => {
   console.log(`Rodando na porta ${PORT}!`);
});
