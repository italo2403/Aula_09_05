📱 Projeto Flutter + Node.js

Este projeto demonstra como conectar um app Flutter com um backend Node.js simples usando HTTP.

🚀 Tecnologias Usadas

Flutter (Frontend)

Node.js com Express (Backend)

📁 Estrutura do Projeto

flutter_application_1/
├── backend/                # Backend Node.js
│   ├── index.js
│   └── package.json
│
├── lib/                   # Código Flutter
│   ├── main.dart
│   └── telas/
│       ├── sinal.dart
│       └── node.dart
...

🧭 Passo a Passo Completo

✅ 1. Criar o projeto Flutter

flutter create flutter_application_1
cd flutter_application_1

✅ 2. Adicionar dependência HTTP ao Flutter

flutter pub add http

✅ 3. Criar a pasta e o projeto Node.js

mkdir backend
cd backend
npm init -y
npm install express cors

✅ 4. Criar o arquivo index.js no backend

const express = require('express');
const cors = require('cors');

const app = express();
const port = 3000;

app.use(cors());
app.use(express.json());

app.post('/api/log', (req, res) => {
  const { cor } = req.body;
  console.log(`🔔 Cor acionada: ${cor}`);
  res.status(200).json({ status: 'recebido com sucesso' });
});

app.listen(port, () => {
  console.log(`Servidor rodando em http://localhost:${port}`);
});

✅ 5. Rodar o backend

cd backend
node index.js

✅ 6. Rodar o Flutter (em outro terminal)

flutter run -d chrome

📝 Observações

O app Flutter envia a cor clicada para o backend Node.js via POST /api/log

O Node.js imprime a cor no console

Não há banco de dados envolvido (apenas comunicação e logging)

✅ Comandos Extras Úteis

flutter pub get           # Atualiza dependências Flutter
npm install               # Reinstala pacotes Node.js
npm uninstall firebase-admin   # Remove firebase (caso tenha instalado)

✅ Finalizado!

Você agora tem uma comunicação funcional entre Flutter e Node.js com envio de dados simples via HTTP.

