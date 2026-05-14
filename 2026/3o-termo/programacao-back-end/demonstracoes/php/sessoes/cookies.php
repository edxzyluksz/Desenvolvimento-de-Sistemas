<?php 
    setcookie("empresa", "Empresa XYZ", time() + 3600);
    echo "Cookie criado. <br>";
    var_dump($_COOKIE);
?>