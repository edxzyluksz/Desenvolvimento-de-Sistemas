"use strict";
// Exercício 2: Sistema de Notas Escolares
// Interface Estudante com as propriedades nome(string) e notas (array de números: number[])
// Crie uma função chamada calcularMedia que receba um Estudante, calcule a média de suas notas e exiba no console o nome do aluno, sua média formatada e se ele foi Aprovado (média maior ou igual a 7) ou Reprovado.
// Crie um objeto de teste para validar o funcionamento
Object.defineProperty(exports, "__esModule", { value: true });
function calcularMedia(student) {
    let soma = 0;
    student.notas.forEach(nota => {
        soma += nota;
    });
    const count = student.notas.length;
    const media = count > 0 ? soma / count : 0;
    const mediaFormatada = media.toFixed(2);
    const status = media >= 7 ? 'Aprovado' : 'Reprovado';
    console.log(`${student.nome} - Média: ${mediaFormatada} - ${status}`);
}
// Objeto de teste
const aluno = {
    nome: 'Eduardo',
    notas: [8, 7.5, 6]
};
calcularMedia(aluno);
//# sourceMappingURL=notas.js.map