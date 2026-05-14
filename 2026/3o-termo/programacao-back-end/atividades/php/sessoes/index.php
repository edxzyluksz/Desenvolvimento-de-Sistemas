<?php
    if (isset($_POST["theme"])) {
        setcookie("theme", $_POST["theme"], time() + 3600);
        $_COOKIE["theme"] = $_POST["theme"];
    }
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GCC - Repaginado</title>
    <link rel="stylesheet" href="style.css">
    <?php 
        if (!isset($_COOKIE["theme"]))
            setcookie("theme", "light", time() + 3600);
    ?>
</head>
<body class=<?php if ($_COOKIE["theme"] === "dark") echo "dark"; else echo "light" ?>>
    <?php include "../importacao/header.php"?>
    <main>
        <h1>GNU Compiler Collection</h1>
        <div class="user">
            <form method="POST">
                <h3>What's your name?</h3>
                <input type="text" name="name" id="nameInput" placeholder="Your own customized name here..">
                <input type="submit" value="that's it">
            </form>
        </div>
        <?php 
            session_start();
            if (isset($_POST["name"])) {
                $nome = $_POST["name"];
                $nome = trim($nome); // Remove espaços do início e fim da string
                if ($nome === "") $nome = "Visitor";
                $_SESSION["name"] = $nome;
            }
            if (isset($_SESSION["name"])) echo "<h3>Hello there, " . $_SESSION["name"] . "!</h3>";
        ?>
        <div id="gcc-articles">
            <article>
                <section>
                    <h3>News</h3>
                    <img src="https://lh4.googleusercontent.com/proxy/Hpaq4tb-3HIld66Bww6ryPkTNmepUrH_AC8WQ5re6Ptrus77sahSiYRSvq5TxABTg6INPQzwD9pu2Ul_WonG" alt="">
                </section>
                <section>
                    <h3>Supported Releases</h3>
                    <img src="https://miro.medium.com/v2/resize:fit:1400/1*vZtIEDA2RIyTo9sZAV1fpQ.jpeg" alt="">
                </section>
            </article>
        </div>
        <div class="user">
            <form method="POST">
                <h3>Which theme do you prefer?</h3>
                    <label for="light-theme">Light</label>
                        <input type="radio" name="theme" id="light-theme" value="light" <?php if ($_COOKIE["theme"] === "light") echo "checked"?>>
                    <label for="dark-theme">Dark</label>
                        <input type="radio" name="theme" id="dark-theme" value="dark" <?php if ($_COOKIE["theme"] === "dark") echo "checked"?>>
                    <input type="submit" value="that's it">
            </form>
        </div>
    </main>
    <?php include "../importacao/footer.php"?>
</body>
</html>