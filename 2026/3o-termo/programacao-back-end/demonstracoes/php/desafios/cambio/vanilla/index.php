<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Conversão de Dólar</title>
</head>
<body>
    <h1>Conversor</h1>
    <form action="process.php" method="POST">
        <label for="real">Valor em R$</label>
            <input type="number" name="real" id="real" step="0.01">
        <label for="dolar">Valor em $</label>
            <input type="number" name="dolar" id="dolar" step="0.01">
        <input type="submit" value="enviar">
    </form>
</body>
</html>