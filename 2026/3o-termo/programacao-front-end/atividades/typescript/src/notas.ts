// Exercício 2: Sistema de Notas Escolares
// Interface Estudante com as propriedades nome(string) e notas (array de números: number[])
// Crie uma função chamada calcularMedia que receba um Estudante, calcule a média de suas notas e exiba no console o nome do aluno, sua média formatada e se ele foi Aprovado (média maior ou igual a 7) ou Reprovado.
// Crie um objeto de teste para validar o funcionamento

interface Estudante {
    nome:string,
    notas:number[]
}

function calcularMedia(student:Estudante) : void {
    let soma: number = 0;
    student.notas.forEach(nota => {
        soma += nota;
    });

    const total = student.notas.length;
    const media = total > 0 ? soma / total : 0;
    const mediaFormatada = media.toFixed(2);
    const status = media >= 7 ? 'Aprovado' : 'Reprovado';

    console.log(`${student.nome} - Média: ${mediaFormatada} - ${status}`);
}

// Objeto de teste
const aluno: Estudante = {
    nome: 'Eduardo',
    notas: [8, 7.5, 6]
};

calcularMedia(aluno);