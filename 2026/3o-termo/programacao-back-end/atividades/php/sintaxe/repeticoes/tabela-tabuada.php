<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tabela de Tabuada</title>
    <style>
        * {
            font-family: Comic Sans MS;;
        }
        body {
            display: flex;
            width: 100vw;
            flex-direction: column;
            align-items: center;
        }
    </style>
</head>
<body>
    <h1>Tabuadas (0 a 10)</h1>
    <table border="1" cellpadding="10">
        <?php 
            for ($i = 1; $i <= 10; $i++){
                echo "<tr> </tr>";
                for ($j = 1; $j <= 10; $j++){
                    echo "<td>$i x $j</td> " . "<td>" . ($i * $j) . "</td>";
                }
            }
        ?>
    </table> 
</body>
</html>