<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loops com PHP</title>
    <style>
        * {
            font-family: Comic Sans MS;
        }
    </style>
</head>
<body>
    <h1>Site do Edxzy</h1>
    <?php
        $mesAtual = 4;
        // Uso de for para incremento previsível
        for ($i = 1; $i <= 10; $i++){
            echo "<p>Essa mensagem já se repetiu $i vezes ";
            if ($i % 2 == 0){
                echo "--> Números pares são satisfatórios";
            }
            echo "</p>"; // Fim de tag isolada para que o echo do if fique na mesma linha do i
        }
    ?>
</body>
</html>