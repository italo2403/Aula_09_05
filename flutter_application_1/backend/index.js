const express = require('express');
const cors = require('cors');



const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());

app.get('/api/mensagem', (req, res) => {
  console.log('🔔 Requisição recebida do Flutter!');
  res.json({ mensagem: 'Olá do Node.js!' });
});

app.post('/api/log', (req, res) => {
  const { cor } = req.body;
  console.log(`🔔 Cor acionada: ${cor}`);
  res.status(200).json({ status: 'recebido' });
});

app.listen(port, () => {
  console.log(`Servidor Node rodando em http://localhost:${port}`);
});
