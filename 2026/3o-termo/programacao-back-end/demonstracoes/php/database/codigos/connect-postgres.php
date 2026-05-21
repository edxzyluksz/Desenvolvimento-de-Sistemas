<?php 
    $host = "127.0.0.1";
    $dbname = "escola";
    $user = "postgres";
    $pass = "postgres";
    try {
        $conexao = new PDO (
            "pgsql:host=$host;
            dbname=$dbname",
            $user,
            $pass
        );
    } catch(PDOException $e) {
        echo "Erro: " . $e;
    }
?>