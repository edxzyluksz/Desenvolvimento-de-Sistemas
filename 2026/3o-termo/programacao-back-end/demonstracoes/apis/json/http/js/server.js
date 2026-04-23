// Expres para criação de APIs 

const express = require('express');
const fs = require('fs')
const app = express();

// Porta do servidor 
const PORT = 3000;

// Quando vamos interagir com uma API, uma exclusão ou funtap, preciso enviar essas informações no corpo do http
// fazer uma função para o express entender o json, permitindo o servidor entender o JSON no Body 
// req.body fica undefined 
app.use(express.json());
// Chama o arquivo json (BD)
const ARQUIVO = "../contatos.json";

// Ler dados 
function lerDados() {
    // leitura de dados
    const dados = fs.readFileSync(ARQUIVO, "utf-8");

    // Converto JSON em obj JS (parse)
    return JSON.parse(dados); 
}

function salvarDados(dados) {
    fs.writeFileSync(ARQUIVO, JSON.stringify(dados, null, 2));
}

app.get("/contatos/:grupo", (req,res) => { // onde :grupo é o parâmetro que vamos receber na URL 
    const grupo = req.params.grupo; // Faz a requisição dos parametros(grupo)
    const dados = lerDados();

    // Fazer um filtro dos dados que foram recebidos pelo parametro
    if(!dados[grupo]) {
        return res.status(404).json({erro: "Grupo não encontrado"});
    }

    res.json(dados[grupo]);
});

// Rota para adicionar contatos
app.post("/contatos/:grupo", (req, res) => {
    const grupo = req.params.grupo;
    const {nome, telefone } = req.body;
    const dados = lerDados();

    // Validar se o grupo existe 
    if (!dados[grupo]) {
        return res.status(404).json({erro:"Grupo não encontrado"});
    }

    // Verifica se o nome e telefone tem valor 
    if (!nome || !telefone) {
        return res.status(400).json({ erro: "Nome e telefone são obrigatórios"});
    }

    // Adiciona o novo contato 
    dados[grupo].push({ nome, telefone });

    // Salva no JSON 
    salvarDados(dados);

    res.status(201).json({
        mensagem: "Contato adicionado com sucesso!",
        contato: {nome, telefone}
    });
})

// Rota para atualizar um contato (PUT - atualiza)
app.put("/contatos/:grupo/:index", (req, res) => {
    const grupo = req.params.grupo;
    const index = parseInt(req.params.index);
    const {nome, telefone} = req.body;

    const dados = lerDados();

    // Validar se o grupo existe 
    if (!dados[grupo]) {
        return res.status(404).json({ erro: "Grupo não encontrado"});
    }

    // Verifica se o index existe 
    if (index < 0 || index >= dados[grupo].length) {
        return res.status(404).json({ erro: "Contato não encontrado"});
    }

    // Atualizar o contato 
    dados[grupo][index] = { nome, telefone};
    salvarDados(dados);

    // Retorna a confirmação para o usuário
    res.json({
        mensagem: "Contato atualizado com sucesso",
        contato: dados[grupo][index]
    });
});

// Rota para excluir um contato (DELETE)
app.delete("/contatos/:grupo/:index", (req, res) => {
    const grupo = req.params.grupo;
    const index = parseInt(req.params.index);

    const dados = lerDados();

    if (!dados[grupo]) {
        return res.status(404).json({ erro: "Grupo não enconstrado"});
    }

     if (index <0 || index >= dados[grupo].length) {
        return res.status(404).json({ erro: "Contato não enconstrado"});
    }
    
    const removido = dados[grupo].splice(index, 1);
    salvarDados(dados);

    res.json({
        mensagem: "Contato excluído com sucesso!",
        contato: removido[0]
    });
});

app.listen(PORT, () => {
    console.log(`API rodando em http://localhost:${PORT}`);
});