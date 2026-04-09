const fs = require("fs");
const listagem = JSON.parse(fs.readFileSync("pessoasCurso.json", "utf-8"));

for (let cargo in listagem) {
    console.log(`\n === SEÇÃO ${cargo.toUpperCase()} ===`);
    listagem[cargo].forEach((pessoa, index) => {
        console.log(`ID: ${index + 1} - Nome: ${pessoa.nome} - Telefone: ${pessoa.telefone}`);
    });
}