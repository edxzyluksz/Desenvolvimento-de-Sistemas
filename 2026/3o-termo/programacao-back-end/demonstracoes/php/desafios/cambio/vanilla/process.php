<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resultados</title>
</head>
<body>    
<?php 
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $real = $_POST["real"] ?? 0;
        $dolar = $_POST["dolar"] ?? 0;
        $conversao = $real / $dolar;
        echo "<h2>Resultado da conversão</h2>";
    }

    echo "<p>Valor em Reais (R$): " . number_format($real, 2, ",", ".") . "</p>";
    echo "<p><strong>Valor em Dólar (U$): " . number_format($conversao, 2, ".", ",") . "</p>";

    $padrao_brasil = numfmt_create("pt-BR", NumberFormatter::CURRENCY);
    $padrao_eua = numfmt_create("en_US", NumberFormatter::CURRENCY);

    echo "<p>Valor em Reais (R$): " . numfmt_format_currency($padrao_brasil, $real, "BRL") . "</p>";
    echo "<p><strong>Valor em Dólares: " . numfmt_format_currency($padrao_eua, $conversao, "USD") . "</strong></p>";
?>
<button onclick="window.location.href='index.php'">Voltar para Conversão</button>
</body>
</html>