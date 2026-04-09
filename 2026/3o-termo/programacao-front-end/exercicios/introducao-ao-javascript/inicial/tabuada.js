let tabuadaDoNumero = 5;

for(let contador = 1; ; contador++){
    let resultado = tabuadaDoNumero * contador
    if(resultado > 20) break;
    console.log(`${tabuadaDoNumero} * ${contador} = ${resultado}`)
}

console.log("=================================")

for(i = 0; i <= 20; i++){
    let resultado = (tabuadaDoNumero * i)
    console.log(`${tabuadaDoNumero} * ${i} = ${resultado}`)
}