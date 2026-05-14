<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Antecessor e Sucessor</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div id="title">
        <h1>Anterior e Posterior</h1>
    </div>
    <form method="POST">
        <h2>Números</h2>
        <input type="number" name="numero" id="numeroInput" placeholder="Insira algum número inteiro..." step="1">
        <input type="submit" value="Enviar" name="enviar">
    </form>
    <?php 
        
        if (isset($_POST["enviar"])){
            if (!isset($_POST["numero"])) $numero = 0;
            else $numero = intval($_POST["numero"]);
            echo "<h3>Antecessor: " . $numero - 1 . "</h3>";
            echo "<h3>Número: " . $numero . "</h3>";
            echo "<h3>Sucessor: " . $numero + 1 . "</h3>";
        }
    ?>
</body>
</html>