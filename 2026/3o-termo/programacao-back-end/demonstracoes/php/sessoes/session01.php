<?php 
    session_start();
    $_SESSION["usuario"] = "Jorge";
    echo "<p>Usuário armazenado na sessão</p><pre>";
    var_dump($_SESSION);
    echo "</pre>";
?>