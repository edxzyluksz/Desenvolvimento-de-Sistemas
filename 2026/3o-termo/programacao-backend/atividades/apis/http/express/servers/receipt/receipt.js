import express from "express";
const PORT = 5500;
const app = express();

app.listen(PORT, () => {
  console.log("=================================");
  console.log("Servidor de PEDIDOS rodando");
  console.log(`URL: http://localhost:${PORT}`);
  console.log("=================================");
});