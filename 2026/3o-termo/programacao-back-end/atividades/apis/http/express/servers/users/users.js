import express from "express";
const PORT = 8000;
const app = express();

app.listen(PORT, () => {
  console.log("=================================");
  console.log("Servidor de USUÁRIOS rodando");
  console.log(`URL: http://localhost:${PORT}`);
  console.log("=================================");
});