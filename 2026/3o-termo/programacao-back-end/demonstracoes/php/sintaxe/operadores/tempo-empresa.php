<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tempo de Empresa</title>
</head>
<body>
    <?php 
        $anoFundacao = 2010;
        $anoAtual = 2026;

        $tempoEmpresa = $anoAtual - $anoFundacao;
        echo "Tempo de empresa: $tempoEmpresa anos";
    ?>
</body>
</html>