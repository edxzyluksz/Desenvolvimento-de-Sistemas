// Exercício 5: Servir arquivos estáticos (HTML, CSS)
import express from "express"
import path from "path"
const PORT = 3000;

const app = express();

// Middleware que permite a renderização completa da pasta public (se aplicável, e neste caso, sim dado o CSS)
app.use(express.static(path.join(__dirname, "public")))

// O path.join é responsável por resolver os caminhos de diretórios automaticamente dependendo do sistema operacional
// Isso permite que o servidor funciona tanto em Windows como Linux.
// __dirname é um (nomear tipo) nativo do node que retorna em string o caminho absoluto de onde o script está rodando

// Após o usuário digitar o url do servidor (localhost:3000), ele será redirecionado para página index.html
app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, "public", "index.html"))
})
// o sendFile envia um arquivo como resposta HTTP, servindo conteúdo para o navegador

// Tecnicamente, o middleware de arquivos estáticos já renderiza o index.html no endpoint "/".
// No entanto, apesar de redundante, é interessante manter este registro no código para fins educacionais.
// Em projetos reais, o ideal seria simplesmente remover o método GET.

app.listen(PORT, () => {
    console.log("Servidor rodando em 127.0.0.1:3000")
})