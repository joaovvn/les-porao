const express = require('express');
const routes = require('./routes/index.routes');
const PORT = process.env.PORT || 8000

const app = express();

app.use(express.json());
app.use(routes);

app.get('/teste', (req, res) => {
   res.send('API OK ERRO 200')
})

app.listen(PORT, () => {
   console.log(`Rodando na porta ${ PORT }!`)
});
