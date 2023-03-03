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

$i = $_POST["num"];
$sql = "UPDATE richiesta SET status = 'risolto' WHERE id_richiesta = $i";
if ($conn->query($sql) === TRUE) {
    echo "Aggiornato";
} 
else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

?>