<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulário 02</title>
</head>
<body>
    <form method="POST">
        <label for="email">E-mail: </label>
        <input type="email" name="email" id="email" placeholder="email@dominio.com">
        <label for="senha">Senha: </label>
        <input type="password" name="senha" id="senha">
        <input type="submit" value="enviar">
    </form>
    <?php 
        $email = $_POST["email"];
        echo "E-mail informado: $email";
        // Exposto no Header
    ?>
</body>
</html>