<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Empresa XTPO - Login Sucedido </title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="acesso-interno.css">
</head>
<body>
    <h1>Acesso Concluído!</h1>
    <?php 
        function pegarDados(){
            $user = $_POST["user"];
            $email = $_POST["email"];
            $password = $_POST["passwd"];
            $dados = [$user, $email, $password];
            return $dados;
        }

        function exibirDados(){
            $infoUser = pegarDados();
            echo "<div>";
                echo "<h2>Seu nome de usuário é $infoUser[0]</h2>";
                echo "<h2>Seu email é $infoUser[1]</h2>";
                echo "<h2>Sua senha é... Secreta! Ela não será exibida, não se preocupe.<h2>";
            echo "</div>";
        }
        
        exibirDados();
    ?>
</body>
</html>