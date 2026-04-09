const fs = require("fs");
const prompt = require("prompt-sync")();

// Menu principal
function menu() {
  console.log("\n=== MENU CURSO ===");
  console.log("1 - Adicionar contato");
  console.log("2 - Listar contatos");
  console.log("3 - Atualizar contato");
  console.log("4 - Excluir contato");
  console.log("X - Sair");
}

function escolherGrupo() {
  console.log("Tipo de contato: ");
  console.log("1. Aluno");
  console.log("2. Professor");

  const opcao = prompt("Escolha: ");

  if (opcao === "1") return "alunos";
  if (opcao === "2") return "professores";

  console.log("Opção inválida.");
  return null;
}

// Leitura do JSON
function lerDados() {
  const dados = fs.readFileSync("pessoasCurso.json", "utf-8");
  return JSON.parse(dados);
}

function salvarDados(dados) {
  fs.writeFileSync("pessoasCurso.json", JSON.stringify(dados, null, 2));
}

function adicionar() {
  const grupo = escolherGrupo();
  if (!grupo) return;

  const nome = prompt("Nome: ");
  const telefone = prompt("Telefone: ");

  const dados = lerDados();
  dados[grupo].push({ nome, telefone });

  salvarDados(dados);
  console.log("Contato adicionado com sucesso!");
}

function listar() {
  const grupo = escolherGrupo();
  if (!grupo) return;

  const dados = lerDados();

  console.log(`\nLista de ${grupo.toUpperCase()}: `);
  dados[grupo].forEach((contato, index) => {
    console.log(`${index + 1}. ${contato.nome} - ${contato.telefone}`);
  });
}

function atualizar() {
  const grupo = escolherGrupo();
  if (!grupo) return;

  const dados = lerDados();
  const index =
    parseInt(prompt("Digite o ID do contato que deseja atualizar: ")) - 1;

  if (index < 0 || index >= dados[grupo].length || isNaN(index)) {
    console.log("ID inválido.");
    return;
  }

  const nome = prompt("Novo nome: ");
  const telefone = prompt("Novo telefone: ");

  dados[grupo][index] = { nome, telefone };
  salvarDados(dados);
  console.log("Contato atualizado com sucesso!");
}

function excluir() {
  const grupo = escolherGrupo();
  if (!grupo) return;

  const dados = lerDados();
  const index =
    parseInt(prompt("Digite o ID do contato que deseja excluir: ")) - 1;

  if (index < 0 || index >= dados[grupo].length || isNaN(index)) {
    console.log("ID inválido.");
    return;
  }

  dados[grupo].splice(index, 1);
  salvarDados(dados);
  console.log("Contato excluído com sucesso!");
}

function main() {
  let opcao;

  do {
    menu();
    opcao = prompt("Escolha uma opção: ");
    switch (opcao) {
      case "1":
        adicionar();
        break;
      case "2":
        listar();
        break;
      case "3":
        atualizar();
        break;
      case "4":
        excluir();
        break;
      case "X":
      case "x":
        console.log("Alunos! Adeus!");
        return;
      default:
        console.log("Digite alguma das opções!");
        break;
    }
    prompt("Digite enter para continuar... ");
    console.clear();
  } while (opcao.toUpperCase() !== "X");
}

main();
