<?php 
    function calcularTempoEmpresa($anoFundacao, $anoAtual){
        return $anoAtual - $anoFundacao;
    }

    $tempo = calcularTempoEmpresa(2013, 2026);
    echo "Tempo empresa: $tempo anos";
?>