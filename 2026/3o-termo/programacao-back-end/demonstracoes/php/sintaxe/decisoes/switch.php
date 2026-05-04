<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Setor da Empresa</title>
</head>
<body>
    <?php 
        $setor = "TI";

        switch ($setor) {
            case "TI":
                echo "Setor de Tec";
                break;
            case "RH":
                echo "Recursos Humanos";
                break;
            case "Financeiro":
                echo "Setor Financeiro";
                break;

            default:
                echo "Setor não identificado";
                break;
        }
    ?>
</body>
</html>