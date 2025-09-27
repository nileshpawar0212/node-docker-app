// server.js
const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => res.send('Hello from Node.js running i K8S!'));

app.listen(PORT, () => console.log(`Server listening on http://localhost:${PORT}`));

