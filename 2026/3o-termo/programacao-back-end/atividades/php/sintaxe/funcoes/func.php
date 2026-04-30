<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Funções da Empresa</title>
</head>
<body>
    <h1>Manual Interno de Funções da XPTO</h1>
    <ol>
        <h2><li>Funções com Parâmetros</li></h2>
        <ul>
            <h3><li>Saudação de Usuário</li></h3>
        </ul>
        <?php
            function saudacaoUsuario($nome){
                echo "Bem-vindo(a), $nome";
            }
            function soma($a, $b){
                return $a + $b;
            }
        ?>
    </ol>
</body>
</html>