<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sorteio</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div id="title">
        <h1>Sorteio de Números</h1>
    </div>
    <form method="POST">
        <input type="submit" value="Sortear!" name="enviar">
    </form>
    <?php
        if (isset($_POST["enviar"])){
            $sorteio = "";
            for ($i = 0; $i < 6; $i++){
                if ($sorteio === ""){
                    $sorteio .= strval(mt_rand(1, 60));
                } else {
                    $sorteio .= "-" . strval(mt_rand(1, 60));
                }

            }
            echo "<h2>Sorteio: " . $sorteio . " </h2>";
            unset($_POST["enviar"]);
        }
    ?>
</body>
</html>