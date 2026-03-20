function mostrarSecao(idSecao, event) {
    event.preventDefault();

    // Oculta todas as seções
    document.querySelectorAll('.relative').forEach(secao => {
        secao.style.display = 'none';
    });

    // Mostra apenas a seção clicada
    const secaoAlvo = document.getElementById(idSecao);
    if (secaoAlvo) {
        secaoAlvo.style.display = 'block';
    }

    // Remove a classe active de TODOS os links
    document.querySelectorAll('header nav span a').forEach(link => {
        link.classList.remove('active');
    });

    // Adiciona active ao link clicado
    event.target.classList.add('active');
}

function Codigos() {
    const DDL = document.getElementById('ddl-code');
    if (DDL) {
        DDL.textContent = DBContent.SQLDDL;
    }
    const DML = document.getElementById('dml-code');
    if (DML) {
        DML.textContent = DBContent.SQLDML;
    }
    const PyAuth = document.getElementById('py-auth-code');
    if (PyAuth) {
        PyAuth.textContent = PyContent.PyAuth;
    }
    const PyUser = document.getElementById('py-user-code');
    if (PyUser) {
        PyUser.textContent = PyContent.PyUser;
    }
    const PyMain = document.getElementById('py-main-code');
    if (PyMain) {
        PyMain.textContent = PyContent.PyMain;
    }
}

document.addEventListener('DOMContentLoaded', Codigos);
