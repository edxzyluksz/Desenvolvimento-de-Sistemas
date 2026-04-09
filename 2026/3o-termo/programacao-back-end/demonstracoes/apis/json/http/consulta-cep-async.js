const prompt = require("prompt-sync")();

async function consultarCEP() {
    try {
        let cep = prompt("Digite o CEP (somente números): ");
        cep = cep.trim();

        const url = `https://viacep.com.br/ws/${cep}/json/`
        const resposta = await fetch(url);

        if (!resposta.ok) {
            console.log("Erro na consulta");
            return;
        }
        const dados = await resposta.json();
        if (dados.erro) {
            console.log("CEP não encontrado!");
            return;
        }
        console.log("Dados do CEP: ");
        console.log("CEP:", dados.cep);
        console.log("Logradouro:", dados.logradouro);
        console.log("Bairro:", dados.bairro);
        console.log("Cidade:", dados.localidade);
        console.log("UF:", dados.uf);
    } catch(erro) {
        console.log("Erro ao acessar a API: ");
        console.log(erro.message);
    }
}

consultarCEP()