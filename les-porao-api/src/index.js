const express = require('express');
const routes = require('./routes/index.routes');

const app = express();

app.use(express.json());
app.use(routes);

app.get('/', (httpRequest, httpResponse) => {
   return httpResponse.json({message: "O dola ta R$4,59!"}).send()
});

app.listen(3000, () => {
   console.log("Fvck rodando")
});
