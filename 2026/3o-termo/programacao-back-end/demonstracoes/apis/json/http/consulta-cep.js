// Importa prompt-sync

const prompt = require('prompt-sync')();

// Função principal
function consultarCep() {
    // 1. Solicita o CEP - 2. Monta a URL - 3. Faz a req (GET) - 4. Retorna os dados
    let cep = prompt("Digite o CEP (somente números): ");
    cep = cep.trim();

    const url = `https://viacep.com.br/ws/${cep}/json/`

    fetch(url) // Essa ação precisa ser executada antes para o código continuar

    .then((resposta) => {
        return resposta.json();
    })
    .then((dados) => {
        // CEP inválido?
        if (dados.erro) {
            console.log("CEP não encontrado!");
            return;
        }
        // Exibe os dados do CEP:
        console.log("Dados do CEP: ");
        console.log("CEP:", dados.cep);
        console.log("Logradouro:", dados.logradouro);
        console.log("Bairro:", dados.bairro);
        console.log("Cidade:", dados.localidade);
        console.log("UF:", dados.uf);
    })
    .catch((erro) => {
        console.log("Erro ao acessar a API: ");
        console.log(erro.message);
    });
}

consultarCep()

