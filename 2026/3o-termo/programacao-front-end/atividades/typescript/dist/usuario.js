"use strict";
// Exercício 1: Cadastro de Usuários
// Interface chamada Usuario que contenha as propriedades: id(número), nome(string), email(string) e isAdmin (booleano)
// Função chamada renderizar Perfil que receba um objeto do tipo Usuario e exiba no console uma mensagem personalizada (ex: "Usuário Administrador: Fulano (fulano@gmail.com) caso ele seja admin, ou apenas "Usuário Comum: ..." caso não seja).
Object.defineProperty(exports, "__esModule", { value: true });
function renderizarPerfil(user) {
    if (user.isAdmin)
        console.log(`[ADMINISTRADOR]: ${user.nome} (${user.email})`);
    else
        console.log(`[USUÁRIO]: ${user.nome} (${user.email})`);
}
//# sourceMappingURL=usuario.js.map