import express from "express";
const PORT = 3000;
const app = express();

app.listen(PORT, () => {
  console.log("=================================");
  console.log("Servidor de PRODUTOS rodando");
  console.log(`URL: http://localhost:${PORT}`);
  console.log("=================================");
});