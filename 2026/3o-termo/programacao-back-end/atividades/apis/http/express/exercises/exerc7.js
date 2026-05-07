// Exercício 7: Gerenciamento de Usuários (com Object)
import express from "express"
const port = 3000;
const app = express();

const users = {};
let nextIndex = 0;

app.use(express.json());

app.get("/usuarios", (req, res) => {
    res.status(200).json(Object.values(users)) // Por estar em formato de objeto, pega só os valores das chaves para exibir como um array tradicional faria.
})

app.get("/usuarios/:id", (req, res, next) => {
    const id = Number(req.params.id);
    const user = users[id]
    if (!user) {
        const error = new Error("id não encontrado")
        error.status = 404
        return next(error)
    }
    res.status(200).json(user)
})

app.post("/usuarios", (req, res, next) => {
    const {nome} = req.body
    if (!nome) {
        const error = new Error("nome é obrigatório")
        error.status = 400
        return next(error)
    }
    users[nextIndex] = {
        id: nextIndex,
        nome: nome
    }
    const user = users[nextIndex]
    nextIndex++
    return res.status(201).json({
        mensagem: "novo usuário adicionado",
        usuario: user
    })
});

app.put("/usuarios/:id", (req, res, next) => {
    const id = Number(req.params.id)
    const {nome} = req.body
    if (!nome) {
        const error = new Error("nome é obrigatório")
        error.status = 400
        return next(error)
    }
    const user = users[id]
    if (!user) {
        const error = new Error("id não encontrado")
        error.status = 404
        return next(error)
    }
    users[id] = {
        id: id,
        nome: nome
    }
    res.status(200).json({
        mensagem: "usuário atualizado com sucesso",
        usuario: users[id]
    })
})

app.delete("/usuarios/:id", (req, res, next) => {
    const id = Number(req.params.id)
    const user = users[id]
    if (!user) {
        const error = new Error("id não encontrado")
        error.status = 404
        return next(error)
    }
    delete users[id]
    return res.status(200).json( {
        mensagem: "usuário especificado foi deletado",
        usuario: user
    });
});

app.listen(port, () => {
    console.log("Rodando em 127.0.0.1:3000")
});

app.use((err, req, res, next) => {
    const status = err.status || 500
    res.status(status).json({
        erro: err.message || "erro interno do servidor"
    })
});