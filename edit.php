<?php


$servername = "localhost";
$username = "root";
$password = "";
$dbname = "picciotti";

session_start();

if(isset($_SESSION["login"]) == 'ok'){
  $utente = $_SESSION["utente"];
  $lavoro = $_SESSION["lavoro"];
  // Create connection
  $conn = mysqli_connect($servername, $username, $password, $dbname);
  // Check connection
  if (!$conn) {
    die("Connection failed: " . $mysql_connect_error());
  }
  echo "Connection successfully";
} else{
  echo "errore nella connessione al database";
}

/**
 * nome
 * cognome
 * email
 * pass1 (required)
 * pass2 (nuova password, opzionale)
 * pass3 (conferma nuova password, opzionale)
 */

$nome = $_POST["nome"];
$cognome = $_POST["cognome"];
$email = $_POST["email"];
$pass1 = $_POST["pass1"];
$pass2 = $_POST["pass2"];

$pass1 = md5($pass1);

$sql_password = "SELECT password FROM $lavoro WHERE username = '$utente'";
if ($conn->query($sql_password) === TRUE) {
  echo "password corretta";
  } else {
  echo "Error: " . $sql_password . "<br>" . $conn->error;
  }

if($nome != "" && $cognome != "" && $email != "") {
  echo "procedo alla verifica della password";
  if ($pass1 == $sql_password) {
    echo "password corretta, procedo ad aggiornare i dati";
  } else {
    echo "password errata";
  }
  //modifica del nome
  if ($nome != "") {
    $sql_nome = "UPDATE $lavoro SET nome = '$nome' WHERE username = '$utente'";
    if ($conn->query($sql_nome) === TRUE) {
      echo "nome cambiato";
    } else {
      echo "Error: " . $sql_nome . "<br>" . $conn->error;
    }
  }
    // modifica del cognome
  if ($cognome != "") { 
    $sql_cognome = "UPDATE $lavoro SET cognome = '$cognome' WHERE username = '$utente'";
    if ($conn->query($sql_cognome) === TRUE) {
      echo "cognome cambiato";
    } else {
      echo "Error: " . $sql_cognome . "<br>" . $conn->error;
    }
  }
  //modifica della email
  if ($email != "") {
    $sql_email = "UPDATE $lavoro SET email = '$email' WHERE username = '$utente'";
    if ($conn->query($sql_email) === TRUE) {
      echo "email cambiata";
    } else {
      echo "Error: " . $sql_email . "<br>" . $conn->error;
    }
  }

  /**
   * controllo che la password 2 sia stata inserita
   * controllo che entrambe le password combacino
   * in caso combacino aggiorno la password
   */
  
  if($pass2 != "") { 
    $pass3 = $_POST["pass3"];
    if($pass2 == $pass3){
      //elimino la password 3(in chiaro) per evitare che possa essere rubata(questioni di sicurezza)
      unset($pass3);
      $pass2 = md5($pass2);
      $sql_pass2 = "UPDATE $lavoro SET password = '$pass2' WHERE username = '$utente'";
      if ($conn->query($sql_pass2) === TRUE) {
        echo "password cambiata";
      } else {
        echo "Error: " . $sql_pass2 . "<br>" . $conn->error;
      }
    }
  }
} else {
  echo "inserire almeno un dato";
}

mysqli_close($conn);
session_abort();
?>