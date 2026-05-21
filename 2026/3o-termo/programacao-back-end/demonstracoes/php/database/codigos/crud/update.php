<?php 
    require_once '../connect-postgres.php';
    $sql = "UPDATE alunos SET sobrenome = 'Costa' WHERE id = 2";
    $conexao->exec($sql);
    echo "Usuário Atualizado!";
?>