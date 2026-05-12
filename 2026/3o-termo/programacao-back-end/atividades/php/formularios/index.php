<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Empresa XPTO - Cadastro</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header>
        <h1>Formulário</h1>
        <img src="https://www.pngarts.com/files/6/PHP-Elephant-Logo-PNG-Photo.png" alt="">
    </header>
    <form action="process.php"method="POST">
        <fieldset>
            <label for="user">Usuário</label>
                <input type="text" placeholder="Seu nome de usuário.." name="user" id="user" required>
            <label for="email">Email</label>
                <input type="email" name="email" id="email" placeholder="exemplo@email.com" required>
            <label for="passwd">Senha</label>
                <input type="password" name="passwd" id="passwd" placeholder="Sua senha.." required>
            <input type="submit" value="Enviar">
        </fieldset>
    </form>
</body>
</html>