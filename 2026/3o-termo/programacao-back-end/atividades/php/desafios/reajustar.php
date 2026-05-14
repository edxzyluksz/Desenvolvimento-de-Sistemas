<?php 
    $valor = floatval($_COOKIE["valor"] ?? 0);
    $percentage = intval($_COOKIE["porcentagem"] ?? 15);
    $resultado = null;

    if (isset($_POST["enviar"])) {
        $valor = floatval($_POST["valor"] ?? 0);
        $percentage = intval($_POST["percentual"] ?? 15);

        setcookie("valor", $valor, time() + 3600);
        setcookie("porcentagem", $percentage, time() + 3600);

        $resultado = $valor * (100 + $percentage) / 100;
    }
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reajustar</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Reajustar Preço</h1>
    <form method="POST" style="margin-top: 20px;">
        <label for="valor">Valor para reajuste</label>
            <input type="number" name="valor" id="numeroInput" placeholder="Insira preço.." value="<?= $valor?>" step="0.01">
        <label for="percentual-ajuste" id="listen-percentage">Percentual de Reajuste (<?= $percentage ?>%)</label>
            <input type="range" name="percentual" id="percentual-ajuste" min="-100" max="100" value="<?= $percentage?>" step="1">
        <input type="submit" value="Reajustar" name="enviar">
    </form>
    <div id="resultados" style="margin-top: 20px;">
        <?php
            if ($resultado !== null){
                echo "<h3>Valor a ser reajustado: R$" . number_format($valor, 2, ",", ".") . "</h3>";
                echo "<h3>Reajustando, agora é: R$" . number_format($resultado, 2, ",", ".") . "</h3>";
            }
        ?>
    </div>
</body>
<script src="script.js"></script>
</html>