<?php

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "picciotti";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);
// Check connection
if (!$conn) {
  die("Connection failed: " . $mysql_connect_error());
}
echo "Connection successfully";


$nome = $_POST["nome"];
$cognome = $_POST["cognome"];
$email = $_POST["email"];
$pass1 = $_POST["pass1"];
$pass2 = $_POST["pass2"];

if ($pass2 != "") {
  $pass3 = $_POST["pass3"];
  if ($pass2 == $pass3) {
    echo "password aggiornata correttamente";
  } else {
    echo "password diverse, ritenta";
  }
} 

?>