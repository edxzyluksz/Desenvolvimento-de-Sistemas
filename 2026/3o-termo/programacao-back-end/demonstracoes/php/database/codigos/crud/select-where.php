<?php 
    require_once "../connect-postgres.php";
    $id = 2;
    $sql = "SELECT * FROM alunos WHERE id = :id";

    $stmt = $conexao->prepare($sql);
    $stmt->bindValue(":id", $id);
    $stmt->execute();

    $aluno = $stmt->fetch(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SELECT WHERE</title>
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
    <h1>SELECT * FROM alunos WHERE id = 2</h1>
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
        <tr>
            <?php
                if ($aluno) {
                    echo "<td>$id</td>";
                    echo "<td>{$aluno['nome']} {$aluno['sobrenome']}</td>";
                    echo "<td>{$aluno['data_nascimento']}</td>";
                    echo "<td>{$aluno['turma']}";
                    echo "<td>" . ($aluno['ativo'] ? "Ativo" : "Inativo") . "</td>";
                } else {
                    echo "<h2>ID não encontrado.</h2>";
                }
            ?>
        </tr>
    </tbody>
</table>
</body>
</html>