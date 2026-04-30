<?php 
    // Crie uma página que calcule e compare dados da empresa
    $ganhos = 1096710.40;
    $gastos = 500000.99;
    echo "<p>Para uma empresa que ganhou R$" . $ganhos . " e gastou R$" . $gastos . ", lucrou  R$ " .  $ganhos - $gastos. "</p>"; // Uso de concatenação e subtração entre ganho e gasto
    echo "<p>Empresa possui ganhos milionários? R: " . ($ganhos > 1000000 ? "Sim" : "Não") . "</p>";
    echo "<p>Empresa possui gastos milionários? R: " . ($gastos > 1000000 ? "Sim" : "Não") . "</p>";
?>