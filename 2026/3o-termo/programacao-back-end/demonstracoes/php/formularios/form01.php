<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulário 01</title>
</head>
<body>
    <form method="GET">
        <label for="nome">
            <input type="text" name="nome" id="nome" placeholder="Digite seu nome.. ">
            <input type="submit" value="enviar">
        </label>
    </form>
    <?php
        // O nome que está sendo resgatado se dá pelo name="nome" na caixa de texto
        $nome = $_GET["nome"];
        echo "<br>Nome informado: $nome <br>";
        var_dump($_GET);
        // Exposto na URL
    ?>
</body>
</html>