<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tempo da Empresa</title>
</head>
<body>
    <?php 
        $tempoEmpresa = 5;

        if ($tempoEmpresa < 2){
            echo "Empresa nova no mercado";
        }
        else{
            echo "Empresa Consolida";
        }
    ?>
</body>
</html>