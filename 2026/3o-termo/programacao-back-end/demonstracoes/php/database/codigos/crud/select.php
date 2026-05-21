<?php 
    require_once "../connect-postgres.php";
    $sql = "SELECT * FROM alunos LIMIT 10";

    // stmt = statement refere-se a um objeto PDOStatement no contexto do PDO
    $stmt = $conexao->prepare($sql);
    $stmt->execute();

    $alunos = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SELECT FROM ALUNOS</title>
    <style>
        body {
            margin: 0;
            text-align: center;
        }

        table {
            border: 1px solid black;
            border-collapse: collapse;
            margin: 0 auto;
        }

        table tr {
            border-bottom: 1px solid black;
        }
        
        table td {
            padding: 10px;
            border-left: 1px solid black;
            text-align: center;
        }

        table th {
            border-left: 1px solid black;
            padding: 5px;
        }
    </style>
</head>
<body>
    <h1><?php echo $sql ?></h1>
    <table>
    <tr>
        <thead>
            <th>ID</th>
            <th>Nome</th>
            <th>Data de Nascimento</th>
            <th>Turma</th>
            <th>Ativo</th>
        </thead>
    </tr>
    <tbody>
        <?php 
            foreach ($alunos as $a){
            echo "<tr>";
                echo "<td>{$a['id']}</td>";
                echo "<td>{$a['nome']} {$a['sobrenome']}</td>";
                echo "<td>{$a['data_nascimento']}</td>";
                echo "<td>{$a['turma']}</td>";
                echo "<td>" . ($a['ativo'] ? "Sim" : "Não") . "</td>";
            echo "</tr>";
        }
        ?>
    </tbody>
</table>
</body>
</html>