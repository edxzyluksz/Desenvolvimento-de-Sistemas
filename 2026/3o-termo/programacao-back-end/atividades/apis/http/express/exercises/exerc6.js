// Exercício 6: Simulação de Banco de Dados (com Array)
import db from "./db.js";
import express from "express"

const PORT = 3000;
const app = express();

app.use(express.json());

app.get("/usuarios", (req, res) => {
    res.status(200).json(db.getUsers())
});

app.post("/usuarios", (req, res, next) => {
    const {nome} = req.body
    if (!nome) {
        const error = new Error("nome é obrigatório")
        error.status = 400
        return next(error)
    }
    const added = db.addUser(nome)
    return res.status(201).json({
        mensagem: "novo usuário adicionado",
        usuario: added
    })
});

app.delete("/usuarios/:id", (req, res, next) => {
    const id = Number(req.params.id)
    const deleted = db.delUser(id)
    if (!deleted) {
        const error = new Error("id não encontrado")
        error.status = 404
        return next(error)
    }
   
    return res.status(200).json( {
        mensagem: "usuário especificado foi deletado",
        usuario: deleted
    });
});

app.use((err, req, res, next) => {
    const status = err.status || 500
    res.status(status).json({
        erro: err.message || "erro interno do servidor"
    })
});

app.listen(PORT, () => {
    console.log("Rodando em localhost:3000")
});
