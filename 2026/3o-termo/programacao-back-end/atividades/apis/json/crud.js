const fs = require("fs");
const prompt = require("prompt-sync")();

function menu() {
    console.log("=== BRAWLERS ===");
    console.log("1 - Adicionar Brawler");
    console.log("2 - Atualizar Brawler");
    console.log("3 - Listar Brawlers (P/ Classe)");
    console.log("4 - Excluir Brawler");
    console.log("X - Sair");
}

function chooseClass() {
    console.log("=== Escolha a classe ===")
    console.log("1. Algoz")
    console.log("2. Destruidor")
    console.log("3. Tanque")
    console.log("4. Suporte")
    console.log("5. Sniper")
    console.log("6. Controlador")

    const opcao = prompt("\nDigite: ")

    switch (opcao){
        case "1":
            return "algoz";
        case "2":
            return "destruidor";
        case "3":
            return "tanque";
        case "4":
            return "suporte";
        case "5":
            return "sniper";
        case "6":
            return "controlador";
        default:
            console.log("Classe inválida!");
    }

    return false
}

function main() {
    let opcao;

    do {
        menu();
        opcao = prompt("Selecione uma opção: ");
        switch (opcao){
            case "1":
                addBrawler();
                break;
            case "2":
                updtBrawler();
                break
            case "3":
                getBrawlers();
                break
            case "4":
                delBrawlers();
                break;
            case "X":
                console.log("Até a próxima!");
                return
            default:
                console.log("Digite corretamente!");
        }
        const enter = prompt("Pressione Enter para continuar");
        console.clear();
    } while (opcao !== "X")
}

function readData() {
    try {
        let dados = fs.readFileSync("brawlers.json", "utf-8");
        return JSON.parse(dados);
    } catch {
        return {
            algoz: [],
            destruidor: [],
            tanque: [],
            suporte: [],
            sniper: [],
            controlador: []
        };
    }
}

function writeData(dados){
    fs.writeFileSync("brawlers.json", JSON.stringify(dados, null, 4), "utf-8")
}

function addBrawler() {
    const classe = chooseClass();
    if (!classe) return
    
    let dados = readData();
    
    let nome = prompt("Nome do Brawler: ");
    let raridade = prompt("Raridade: ");
    let vida = Number(prompt("Vida:"));

    if (isNaN(vida)) {
        console.log("Vida inválida!");
        return;
    }

    let ataque = prompt("Dano do ataque: ");
    let descricao = prompt("Descrição do Brawler: ");
    let poder_estelar = prompt("Nome (Poder estrela): ");
    let poder_estelar_descricao = prompt("Descrição (Poder estrela)");
    let estilo = prompt("Estilo de jogo: ");

    dados[classe].push({
        nome,
        raridade,
        vida: Number(vida),
        ataque,
        descricao,
        poder_estelar,
        poder_estelar_descricao,
        estilo
    });

    writeData(dados)
    console.log("Novo Brawler Adicionado!")
}

function updtBrawler() {
    const classe = chooseClass();
    if (!classe) return

    const dados = readData();

    let id = Number(prompt("(Atualização) Digite o ID do Brawler contido na classe: ")) - 1

    if (isNaN(id)){
        console.log("Erro: Digite somente números para o ID.");
        return;
    }

    if (id < 0 || id >= dados[classe].length){
        console.log("Erro: ID inválido.")
        return;
    }

    let nome = prompt("Nome do Brawler: ");
    let raridade = prompt("Raridade: ");
    let vida = Number(prompt("Vida:"));

    if (isNaN(vida)) {
        console.log("Vida inválida!");
        return;
    }

    let ataque = prompt("Dano do ataque: ");
    let descricao = prompt("Descrição do Brawler: ");
    let poder_estelar = prompt("Nome (Poder estrela): ");
    let poder_estelar_descricao = prompt("Descrição (Poder estrela)");
    let estilo = prompt("Estilo de jogo: ");

    dados[classe][id].nome = nome
    dados[classe][id].raridade = raridade
    dados[classe][id].vida = vida
    dados[classe][id].ataque = ataque
    dados[classe][id].descricao = descricao
    dados[classe][id].poder_estelar = poder_estelar
    dados[classe][id].poder_estelar_descricao = poder_estelar_descricao
    dados[classe][id].estilo = estilo

    writeData(dados)
    console.log("Brawler atualizado com sucesso!");
}

function getBrawlers() {
    const classe = chooseClass();
    if (!classe) return;

    const dados = readData();

    console.log(`=== CLASSE: ${classe.toUpperCase()} ===`);
    dados[classe].forEach((brawler, index) => {
        console.log(`ID: ${index + 1}`);
        console.log(`Nome: ${brawler.nome}`);
        console.log(`Raridade: ${brawler.raridade}`);
        console.log(`Vida: ${brawler.vida}`);
        console.log(`Ataque: ${brawler.ataque}`);
        console.log(`Descrição: ${brawler.descricao}`);
        console.log(`Poder Estrela: ${brawler.poder_estelar}`);
        console.log(`Descrição: ${brawler.poder_estelar_descricao}`);
        console.log(`Estilo: ${brawler.estilo}`);
        console.log("=============================================");
    });
}

function delBrawlers() {
    const classe = chooseClass();
    if (!classe) return;

    const dados = readData();

    let id = Number(prompt("(Remoção) Digite o ID do Brawler contido na classe: ")) - 1;

    if (isNaN(id)){
        console.log("Erro: Digite somente números para o ID.");
        return;
    }

    if (id < 0 || id >= dados[classe].length){
        console.log("Erro: ID inválido.");
        return;
    }

    dados[classe].splice(id, 1);
    writeData(dados);
    console.log("Deletado com sucesso.");
}

main()