// Ao definir o array de usuários como constante, é impossível redeclarar ela novamente, mas possível manipular os elementos internos
const users = [];
let nextIndex = 0;

function getUsers() {
    return users;
}

function addUser(user){
    users.push({
        id: nextIndex,
        nome: user
    })
    nextIndex++
    return users[users.length - 1]
}

// Assume que o ID passado é o correto dentro da chave
function delUser(id){
    const arrayIndex = users.findIndex((user) => user.id === id)
    if (arrayIndex === -1) return false
    const user = users[arrayIndex]
    users.splice(arrayIndex, 1)
    return user
}

// Padrão do Node atual com ES (ECMAScript) Modules, permitindo que as funções apresentadas sejam utilizadas em outros arquivos.
export default {
    getUsers,
    addUser,
    delUser
}
// import e export são palavras-chave de JS para buscar e enviar dependências modulares