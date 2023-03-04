<?php
/**
 * scritto da petar miloradovic
 */
session_start();

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "picciotti";

if(isset($_SESSION["login"]) and $_SESSION["login"] == "ok"){
  $utente = $_SESSION["utente"];
  // Create connection
  $conn = mysqli_connect($servername, $username, $password, $dbname);
  // Check connection
  if (!$conn) {
    die("Connection failed: " . $mysql_connect_error());
  }
  echo "Connection successfully";
}
else{
  echo "errore nella connessione al database";
}

date_default_timezone_set('Europe/Rome');
$data = "date("d-m-Y")";

/**
 * tipologia 1/2 (software, hardware)
 * ambito
 * descrizione
 * priorita 1-4 (grave, medio, si soppravvive, una virgola)
 * luogo
 */

$tipo = $_POST["tipologia"];  
$ambito = $_POST["ambito"];
$descrizione = $_POST["ambito"];
$priorita = $_POST["priorita"];
$luogo = $_POST["luogo"];

$tipoString = "";
$prioritaString = "";


switch($tipo){
  case 1: $tipoString = "software";
  break;
  case 2: $tipoString = "hardware";
  break;
  default: echo "errore nella selezione della tipologia!";
  break;
}
switch($priorita){
  case 1: $prioritaString = "grave";
  break;
  case 2: $prioritaString = "medio";
  break;
  case 3: $prioritaString = "si soppravvive";
  break;
  case 4: $prioritaString = "una virgola";
  break;
  default: echo "errore nella selezione della priorita!";
  break;
}

$sql = "INSERT INTO richiesta (data, priorita, descrizione, ambito, luogo, tipologia, status, fk_tecnico,fk_segretario, fk_docente) VALUES ('$data','$prioritaString','$ambito','$luogo','$tipoString','non risolto','tecnigigio','mariobros','$utente')";
if ($conn->query($sql) === TRUE) {
  echo "Richiesta inviata";
  } else {
  echo "Error: " . $sql . "<br>" . $conn->error;
  }

mysqli_close($conn);
session_abort();

?>