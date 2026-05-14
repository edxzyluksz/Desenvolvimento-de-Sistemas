<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cálculo de Salários</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div id="title" style="background-color: #398139;">
        <h1>Salários</h1>
        <p>Considerando o salário mínimo de R$ 1621,00...</p>
    </div>
    <form method="POST">
        <h2>Digite um valor: </h2>
        <input type="number" name="salario" id="numeroInput" placeholder="1621,00..." step="0.01" min="1621">
        <input type="submit" value="Analisar" name="enviar">
    </form>
    <div id="resultados">
        <?php 
            if (isset($_POST["enviar"])){
                if (!isset($_POST["salario"])) $salario = 1621.00;
                else $salario = floatval($_POST["salario"]);
                if ($salario < 1621.00) $salario = 1621.00;
                echo "<h3>Quem recebe um salário de R$ " . number_format($salario, 2, ",", "."). "</h3>";
                echo "<h3>Ganha: " . intdiv((int)$salario, (int)1621.00) . "</h3>";
                echo "<h3>E sobra: R$" . number_format(fmod($salario, 1621.00), 2, ",", ".") ."</h3>";
            }
        ?>
    </div>
</body>
</html>