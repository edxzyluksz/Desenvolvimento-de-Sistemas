const fs = require("fs");
const prompt = require("prompt-sync")();

function menu (){
    console.log("\n=== Menu de Contatos ===");
    console.log("1 -    GET");
    console.log("2 -   POST");
    console.log("3 -  PATCH");
    console.log("4 - DELETE");
    console.log("X -   Sair");
}

function main() {
    let opcao;
    do {
        menu();
        opcao = prompt("Escolha uma opção: ").toUpperCase();
        switch (opcao) {
            case "1":
                listar();
                break;
            case "2":
                adicionar();    
                break;
            case "3":
                atualizar();
                break;
            case "4":
                excluir();
                break; 
            case "X": 
                console.log("Alunos! Até mais!");
                return;
            default:
                console.log("Digite alguma das opções!");
                break;
        }
        let enter = prompt("Digite enter para continuar... ");
        console.clear()
    } while (opcao !== "X")
}


function lerDados(){
    const dados = fs.readFileSync("contatos.json", "utf-8");
    return JSON.parse(dados || "[]"); // Retorna um array vazio se não houver dados no JSON
}

function salvarDados(lista) {
    fs.writeFileSync("contatos.json", JSON.stringify(lista, null, 2))
}

// Função para adicionar um novo contato
function adicionar() {
    const nome = prompt("Digite o nome do contato: ");
    const telefone = prompt("Digite o telefone do contato: ");
    
    const contatos = lerDados()
    contatos.push({nome, telefone})
    salvarDados(contatos)
    console.log("Contato adicionado com sucesso")
}

function listar() {
    const contatos = lerDados();
    console.log("Contatos: ");
    contatos.forEach((contato, index) => {
        console.log(`${index + 1}. ${contato.nome} - ${contato.telefone}`);
    });
}

function atualizar(){
    const indexAtualizar = Number(prompt("Digite o ID do contato a ser atualizado: ")) - 1;
    const contatos = lerDados();

    if (indexAtualizar < 0 || indexAtualizar >= contatos.length || isNaN(indexAtualizar)) {
        console.log("ID válido.");
        return;
    }

    const novoNome = prompt("Digite o novo nome de contato: ");       
    const novoTelefone = prompt("Digite o novo numero: ");

    contatos[indexAtualizar] = {nome: novoNome, telefone: novoTelefone};
    salvarDados(contatos);
    console.log("Contato atualizado com sucesso!")
}

function excluir(){
    const indexExcluir = Number(prompt("Digite o ID do contato a ser excluído: ")) - 1;
    const contatos = lerDados();

    if (indexExcluir < 0 || indexExcluir >= contatos.length || isNaN(indexExcluir)) {
      console.log("ID válido.");
      return;
    }

    contatos.splice(indexExcluir, 1);
    salvarDados(contatos);
    console.log("Contato deletado com sucesso.");
}


main();