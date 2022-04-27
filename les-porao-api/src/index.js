const express = require('express');
const routes = require('./routes/index.routes');

const app = express();

app.use(express.json());
app.use(routes);

app.get('/teste', (req, res) => {
   res.send('API OK ERRO 200')
})

app.listen(8000, () => {
   console.log("Servidor rodando na porta 8000!")
});
