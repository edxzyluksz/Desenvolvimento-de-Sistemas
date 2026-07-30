// Exercício 2: Roteamento Simples
import express from "express"
const PORT = 3000;
const app = express();

let tarefas = [];
let nextIndex = 0;

// Middleware: Trecho de código que será executado antes da próxima etapa da cadeia

// Método necessário para o Express renderizar JSON (Middleware de parse)
app.use(express.json());

// Middleware que registra no console do servidor os métodos e url solicitadas pelos clientes (Exercício 3)
app.use((request, response, next) => {
    console.log(`[${request.method}] ${request.url}`)
    next()
});

// GET - Transforma array de JS em JSON com método parse e envia para o cliente
app.get("/tarefa", (request, response) => {
    response.json(tarefas);
});

// POST - Obtém o JSON do Body e tenta processar para colocar no array tarefas com um id incrementado automaticamente
app.post("/tarefa", (request, response, next) => {
    const {nome, prioridade} = request.body

    if (!nome || !prioridade) {
        const error = new Error("nome e prioridade são obrigatórios")
        error.status = 400
        return next(error)
    }

    tarefas.push({
        "id": nextIndex,
        "nome": nome,
        "prioridade": prioridade
    })

    nextIndex++
    return response.status(201).json({mensagem: "nova tarefa adicionada com sucesso.", tarefa: tarefas[tarefas.length - 1]});
});

// DELETE - Após receber o parâmetro de id no endpoint, o código tenta buscar varrendo todos os elementos da lista algum índice que possua uma chave com o valor do id apresentado (único)
app.delete("/tarefa/:id", (request, response, next) => {
    const id = Number(request.params.id);
    const taskIndex = tarefas.findIndex((tarefa) => tarefa.id === id);

    if (taskIndex === -1) {
        const error = new Error("id não encontrado")
        error.status = 404
        return next(error)
    }

    const tarefa = tarefas[taskIndex];
    tarefas.splice(taskIndex, 1);

    return response.status(200).json({
        mensagem: "id removido com sucesso.", 
        tarefa: tarefa
    });
});

// OBS - O ID cresce indefinidamente, sem frear mesmo que alguma tarefa seja deletada, assim como em aplicações reais.

// Middleware de ERRO: Executado sempre que algum método HTTP avisa que algo deu errado (Exercício 4)
app.use((error, request, response, next) => {
    const status = error.status || 500 // Se o erro não for específicado na rota, envia Internal Server Error (500)
    response.status(status).json({
        erro: error.message || "erro interno do servidor"
    })
});

// Necessário para que o servidor rode
app.listen(PORT, () => {
    console.log("Rodando em 127.0.0.1:3000");
});