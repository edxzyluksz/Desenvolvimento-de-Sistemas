
const aInp = document.getElementById("numeroA");
const operator = document.getElementById("operations");
const bInp = document.getElementById("numeroB");
const btnCalc = document.getElementById("calcular");
const result = document.getElementById("resultado");
const limpHist = document.getElementById('limpHist')
let historico = []

btnCalc.addEventListener('click', () => {
    let a = Number(aInp.value);
    let b = Number(bInp.value);
    let calculo, resultado
    if (operator.value === "sum") {
        calculo = (a + b)
        resultado = `[SOMA:] ${a} + ${b} = ${calculo}`
    }
    else if (operator.value === "subtract") {
        calculo = (a - b)
        resultado = `[SUBTRAÇÃO:] ${a} - ${b} = ${calculo}`
    }
    else if (operator.value === "multiply") {
        calculo = (a * b)
        resultado = `[MULTIPLICAÇÃO:] ${a} * ${b} = ${calculo}`
    }
    else if (operator.value === "division") {
        calculo = (a / b)
        resultado = `[DIVISÃO:] ${a} / ${b} = ${calculo}`
    }
    else if (operator.value === "exponent") {
        calculo = (a ** b)
        resultado = `[EXPONENCIAÇÃO:] ${a} ** ${b} = ${calculo}`
    }
    else {
        result.textContent = "⚠ Escolha uma operação antes de começar"
        return;
    }

    historico.push(resultado)
    result.textContent = historico.join("\n")
})
limpHist.addEventListener('click', () => {
    result.textContent = ""
    resultado = []
});