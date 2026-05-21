<?php 
    require_once '../connect-postgres.php';
    $sql = "DELETE FROM alunos WHERE id = 1";
    $conexao->exec($sql);
    echo "Usuário deletado com sucesso!";
?>