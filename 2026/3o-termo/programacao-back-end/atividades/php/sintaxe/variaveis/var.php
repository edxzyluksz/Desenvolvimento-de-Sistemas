<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Empresa Edxzy's</title>
    <style>
        body {text-align: center;}
    </style>
</head>
<body>
    <?php 
        $nomeEmpresa = "Edxzy's"; // string
        $descricao = "Um plano promissor para o futuro."; // string
        $anosEmpresa = 10; // int
        $notaEmpresa = 9.9; // float
        $isPrivada = true; // privatiazação é verdadeira (true)
        echo "<h1>$nomeEmpresa</h1>";
        echo "<h2>$descricao</h2>";
        echo "<p>Com $anosEmpresa de história. nossa nota na avaliadora mais prestigiada
        das empresas equivale a $notaEmpresa!</p>";
        echo "<p>Somos uma instituição privada? R: " . ($isPrivada ? "Sim" : "Não") . "</p>"
    ?>
</body>
</html>