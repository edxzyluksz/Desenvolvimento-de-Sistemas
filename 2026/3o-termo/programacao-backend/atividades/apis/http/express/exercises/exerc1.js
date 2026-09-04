// Exercício 1: Criar um Servidor Básico
import express from "express"
const PORT = 3000;
const app = express();

// GET com o endpoint /hello, com parâmetros request (req) e response (res) sempre obrigatórios
app.get("/hello", (request, response) => {
    response.send("Olá, Mundo!")
});

// Inicia o servidor HTTP escutando na porta definida
app.listen(PORT, () => {
    console.log("Rodando em 127.0.0.1:3000/hello")
})