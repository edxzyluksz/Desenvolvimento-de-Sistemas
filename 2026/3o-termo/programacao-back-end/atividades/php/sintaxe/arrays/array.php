<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quitanda</title>
</head>
<body>
    <h1>Feira de Frutas</h1>
    <?php 
        $alimentosDisponiveis = [
            "frutas" => ["maçã", "banana", "uva"],
            "grãos" => ["arroz", "aveia", "farinha"],
            "carnes" => ["coxa de frango", "filé mignon", "picanha"]
        ]; // Um Array associativo que guarda valores de indexados
        echo "<h2>Alimentos disponíveis</h2>";
        foreach ($alimentosDisponiveis as $tipos => $alimento) { // foreach de arrays associativos
            echo "<h3>$tipos</h3>";
            echo "<ol>"; // cria uma lista numerada
            foreach ($alimento as $item) { // foreach de arrays indexados
                echo "<li>$item</li>"; // 'item' são os alimentos dentro dos tipos
            }
            echo "</ol>"; // fecha a lista quando passar pro próximo tipo
        }
    ?>
</body>
</html>