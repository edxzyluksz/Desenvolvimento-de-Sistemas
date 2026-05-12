<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro Cliente</title>
</head>
<body>
    <form method="POST">
        <label for="nome">Nome:</label>
            <input type="text" name="nome" id="nome">
        <label for="email">Email:</label>
            <input type="email" name="email" id="email">
        <label for="mensagem">Mensagem:</label>
            <input type="text" name="msg" id="msg">
        <input type="reset" value="Limpar">
        <input type="submit" value="Enviar">
    </form>
    <h2>Dados recebidos: </h2>
    <?php 
        $nome = $_POST["nome"];
        $email = $_POST["email"];
        $msg = $_POST["msg"];

        // Exibindo as informações
        echo "Nome: $nome <br>";
        echo "Email: $email <br>";
        echo "Mensagem: $msg";
    ?>
</body>
</html>