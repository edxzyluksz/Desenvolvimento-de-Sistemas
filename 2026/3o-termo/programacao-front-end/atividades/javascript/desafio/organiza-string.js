// Desafio

// Converta o Texto: "João, MariA, NicolaS, SocoRRo, zuLeiCa"
// Em um array no seguinte formato: [João, Maria, Nicolas, Socorro, Zuleica]

let texto = "João, MariA, NicolaS, SocoRRo, zuLeiCa";

function StringParaArrayFormatado(string) {
    let array = string.split(",")

    for(let i = 0; (i < array.length); i++){
        array[i] = array[i].toLowerCase();
        array[i] = array[i].trim();
        array[i] = array[i].charAt(0).toUpperCase() + array[i].slice(1);
    }

    let list = array;
    return list;
}

novaLista = StringParaArrayFormatado(texto)
console.log(novaLista)