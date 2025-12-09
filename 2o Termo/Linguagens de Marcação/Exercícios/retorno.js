document.addEventListener("DOMContentLoaded", () => {

    const ref = document.referrer;

    // URL de origem permitida
    const origemCorreta = "http://127.0.0.1:5500/2o%20Termo/Linguagens%20de%20Marca%C3%A7%C3%A3o/Exerc%C3%ADcios/index.html";

    if (ref === origemCorreta) {

        // você pode trocar por um popup bonitinho
        const querVoltar = confirm("Você veio da página de exercícios. Quer voltar?");

        if (querVoltar) {
            window.location.href = origemCorreta;
        }
    }
});