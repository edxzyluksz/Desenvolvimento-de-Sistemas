// ==================================================
// IMPORTAÇÕES
// ==================================================

// prompt-sync permite ler dados do usuário no terminal
const prompt = require("prompt-sync")();


// ==================================================
// FUNÇÃO PARA BUSCAR EVOLUÇÕES
// ==================================================
async function buscarEvolucoes(urlEvolucao) {
  /*
    Esta função:
    - Recebe a URL da cadeia de evolução
    - Percorre os níveis de evolução
    - Retorna um array com os nomes das evoluções
  */

  const resposta = await fetch(urlEvolucao);
  const dados = await resposta.json();

  let evolucoes = [];

  // Começa pela primeira forma do Pokémon
  let atual = dados.chain;

  // Percorre a cadeia de evoluções
  while (atual) {
    evolucoes.push(atual.species.name);
    atual = atual.evolves_to[0];
  }

  return evolucoes;
}


// ==================================================
// FUNÇÃO PRINCIPAL – POKEDEX
// ==================================================
async function pokedex() {
  // Solicita o nome do Pokémon
  let nomePokemon = prompt("Digite o nome do Pokémon: ");

  // Normaliza o nome (API exige minúsculas)
  nomePokemon = nomePokemon.trim().toLowerCase();

  try {
    // ===============================================
    // 1️⃣ BUSCAR DADOS DO POKÉMON
    // ===============================================
    const urlPokemon = `https://pokeapi.co/api/v2/pokemon/${nomePokemon}`;
    const respostaPokemon = await fetch(urlPokemon);
    const pokemon = await respostaPokemon.json();

    // ===============================================
    // 2️⃣ BUSCAR DADOS DA ESPÉCIE
    // ===============================================
    const urlEspecie = `https://pokeapi.co/api/v2/pokemon-species/${nomePokemon}`;
    const respostaEspecie = await fetch(urlEspecie);
    const especie = await respostaEspecie.json();

    // ===============================================
    // 3️⃣ BUSCAR EVOLUÇÕES
    // ===============================================
    const evolucoes = await buscarEvolucoes(especie.evolution_chain.url);

    // ===============================================
    // EXIBIÇÃO DOS DADOS
    // ===============================================
    console.log("\n================ POKEDEX ================\n");

    // Nome
    console.log("Nome:", pokemon.name);

    // Tipos
    console.log("\nTipos:");
    pokemon.types.forEach(t => {
      console.log("-", t.type.name);
    });

    // Habilidades
    console.log("\nHabilidades:");
    pokemon.abilities.forEach(h => {
      console.log("-", h.ability.name);
    });

    // Movimentos (limitar para não poluir o console)
    console.log("\nMovimentos (golpes):");
    pokemon.moves.slice(0, 10).forEach(m => {
      console.log("-", m.move.name);
    });

    // Evoluções
    console.log("\nEvoluções:");
    evolucoes.forEach(e => {
      console.log("-", e);
    });

    console.log("\n=========================================");

  } catch (erro) {
    console.log("\n❌ Pokémon não encontrado ou erro na API");
  }
}


// ==================================================
// EXECUÇÃO DO PROGRAMA
// ==================================================
pokedex();