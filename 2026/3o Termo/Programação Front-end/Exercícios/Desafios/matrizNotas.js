const prompt = require("prompt-sync")();
let notasAlunos = [];

console.log(
  "BEM-VINDO, PARA COMEÇAR, DIGITE QUANTOS ALUNOS DESEJA ESCREVER NOTAS:",
);
let numAlunos = Number(prompt());

while (true) {
  console.log("\n=== GERENCIAMENTO DE NOTAS ===\n");
  console.log("1. Inserir notas");
  console.log("2. Imprimir Notas c/ Média");
  console.log("3. Alterar número de alunos");
  console.log("4. Ver informações do programa");
  console.log("5. Sair");
  console.log("Escolha uma das opções");

  let escolha = prompt();

  switch (escolha) {
    case "1":
      inserirNotas(numAlunos);
      break;
    case "2":
      imprimirNotas();
      break;
    case "3":
      mudarNumAlunos();
      break;
    case "4":
      exibirInfo();
      break;
    case "5":
      console.log("Entendido. Até mais!");
      return;
    default:
      console.log("Selecione uma opção válida.");
      break;
  }
}

function inserirNotas(numAlunos) {
  console.log("\n=== INSERÇÃO DE NOTAS ===\n");
  console.log("Agora, para cada aluno que digitou, insira 3 notas.");
  let totalAtual = notasAlunos.length;

  for (let i = 0; i < numAlunos; i++) {
    let novasNotas = [];
    console.log(`Inserindo notas do aluno ${totalAtual + i + 1}`);
    for (let j = 0; j < 3; j++) {
      console.log(`Nota ${j + 1} do aluno ${totalAtual + (i + 1)}:`);
      let notaDisciplina = Number(prompt());
      while (
        isNaN(notaDisciplina) ||
        notaDisciplina < 0 ||
        notaDisciplina > 10
      ) {
        console.log("Digite uma nota válida entre 0 e 10:");
        notaDisciplina = Number(prompt());
      }
      novasNotas.push(notaDisciplina);
    }
    console.log(`Aluno número ${totalAtual + i + 1} concluído\n`);
    notasAlunos.push(novasNotas);
  }
}

function imprimirNotas() {
  if (notasAlunos.length === 0) {
    console.log("Atualmente, não existem alunos registrados para impressão.");
    return;
  }
  console.log("\n=== IMPRIMINDO NOTAS ===\n");
  for (let i = 0; i < notasAlunos.length; i++) {
    console.log("Notas do aluno " + (i + 1));
    for (let j = 0; j < 3; j++) {
      console.log(notasAlunos[i][j]);
    }
    let media = notasAlunos[i].reduce((x, y) => x + y, 0) / 3;
    console.log(`A média total do estudante foi ${media}`);
    if (media >= 7) {
      console.log("Este aluno foi aprovado! 👍");
    } else {
      console.log("Este aluno foi reprovado! 🙁");
    }
    console.log("\n");
  }
}

function mudarNumAlunos() {
  console.log("=== ALTERANDO NÚMERO DE ALUNOS ===\n");
  console.log("Digite o novo número: ");
  numAlunos = Number(prompt());
}

function exibirInfo() {
  console.log("\nSoftware feito por EdxzyLuksz (Eduardo Lucas Garcia)");
  console.log("O objetivo é gerenciar na memória volátil, notas de alunos");
  console.log(
    "Somente valores numéricos são armazenados, por isso não seria interessante colocar em produção tal código.",
  );
  console.log("Obrigado por acessar!\n");
}
