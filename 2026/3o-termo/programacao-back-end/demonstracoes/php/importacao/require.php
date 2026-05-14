<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php require "head.php" // Escrito errado propositalmente (não executa mais adiante)
                            // Com include, 'Página Inicial' ainda seria exibido de qualquer forma. ?>
    <main>
        <p>Página Inicial</p>
    </main>
    <?php require "fooer.php" ?>
</body>
</html>