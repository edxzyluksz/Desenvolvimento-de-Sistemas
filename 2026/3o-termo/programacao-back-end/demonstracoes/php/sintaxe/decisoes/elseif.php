<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tamanho da Empresa</title>
</head>
<body>
    <?php 
        $funcionarios = 100000;

        if ($funcionarios < 50){
            echo "Pequeno porte";
        }
        elseif ($funcionarios < 100){
            echo "Médio porte";
        }
        else {
            echo "Grande porte";
        }
    ?>
</body>
</html>