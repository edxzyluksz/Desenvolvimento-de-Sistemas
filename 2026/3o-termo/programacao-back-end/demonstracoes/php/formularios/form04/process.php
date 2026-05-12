<?php 
    function exibirCampo($label, $valor){
        echo "<p> $label : $valor </p>";
    }

    if (isset($_POST["nome"], $_POST["email"])){
        exibirCampo("Nome: ", $_POST["nome"]);
        exibirCampo("Email: ", $_POST["email"]);
    } // isset verifica nulidade de variáveis
?>