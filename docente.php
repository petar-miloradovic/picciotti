
<?php

session_start();

?>
<!DOCTYPE html>
<html lang="it">
<head>
    <!--
        scritto da petar miloradovic
    -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Docente - Peanuts School</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <!--
        nome
        cognome
        email
        pass1 (required)
        pass2 (nuova password)
        pass3 (conferma nuova password)
    -->
    <h1>Modifica dei dati</h1>
    <form action="edit.php" method="POST" class="box">
        <label for="nome">Nome</label>
        <input type="text" id="nome" name="nome"> <br>
        <label for="conome">Cognome</label>
        <input type="text" id="cognome" name="cognome"> <br>
        <label for="email">Email</label>
        <input type="email" id="email" name="email"> <br>
        <label for="pass1" >Password*</label>
        <input type="password" id="pass1" name="pass1" required> <br>
        <label for="pass2">Nuova password(lascia vuoto per ignorare)</label>
        <input type="password" id="pass2" name="pass2"> <br>
        <label for="pass3">Conferma la nuova password</label>
        <input type="password" id="pass3" name="pass3"> <br>
        <input type="submit" value="conferma"> <br>
    </form>
    <!--
        tipologia 1/2 (software, hardware)
        ambito
        descrizione
        priorita 1-4 (grave, medio, si soppravvive, una virgola)
        luogo
    -->
    <h1>Richiesta di assistenza</h1>
    <form action="nuova_richiesta.php" method="post" class="box">
        <label for="tipologia">Tipologia</label>
        <select name="tipologia">
            <option value="1">Software</option>
            <option value="2">Hardware</option>
        </select> <br>
        <label for="ambito">Ambito</label>
        <input type="text" name="ambito"> <br>
        <label for="descrizione">Inserisci una descrizione dettagliata del problema</label>
        <textarea name="descrizione" rows="5" cols="25" required></textarea> <br>
        <label for="text">Inserisci la prioritá/gravitá della situazione</label>
        <select name="priorita">
            <option value="1">Grave</option>
            <option value="2">Medio</option>
            <option value="3">Si soppravvive</option>
            <option value="4">Una virgola</option>
        </select> <br>
        <label for="luogo">Indica la classe e la sede</label>
        <input type="text" name="luogo" required> <br>
        <input type="submit" value="conferma"> <br>
    </form>
</body>
</html>