<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Decisões</title>
    <style>
        * {font-family: "Arial";}
        body {text-align: center;}
    </style>
</head>
<body>
    <h1>Empresa XPTO</h1>
    <?php 
        $mesAtual = 12;
        $diaAtual = 25;
        switch ($mesAtual) { // Switch: Utilizado para melhor legibilidade, às vezes desempenho e padrão de variável
            case 1:
                echo "<p>Estamos no mês de Férias</p>";
                break; // Necessário dar break para o programa não ir ao próximo case
            case 4:
                echo "<p>Estamos no mês de Páscoa 2026!</p>";
                if ($diaAtual == 5){
                    echo "<p>Estamos no dia da Páscoa de 2026!!!</p>";
                }
                break;
            case 10:
                echo "<p>Estamos no mês de Halloween...</p>";
                if ($diaAtual == 31){
                    echo "<p>Estamos no dia do Halloween!!!</p>";
                }
                break;
            case 12:
                echo "<p>Estamos no mês de Natal!</p>";
                if ($diaAtual == 25){
                    echo "<p>Estamos no dia do Natal!!!</p>";
                }
                break;
        }
    ?>
    <p>Tenha um ótimo dia!</p>
</body>
</html>