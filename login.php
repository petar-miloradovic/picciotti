<?php

session_start();
$user = $_POST["username"];
$pw = $_POST["password"];
$tipo = $_POST["tipologia"];

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

switch ($tipo){
    case 1: 
        $professione = "docente";
        break;
    case 2:
        $professione = "tecnico_software";
        break;
    case 3:
        $professione = "segretario_hardware";
        break;
}
    
$sql = "SELECT * FROM $professione WHERE username='$user'";

if ($result = mysqli_query($conn, $sql)){
    // Return the number of rows in result set                
    $rowcount = mysqli_num_rows($result);
    printf("Result set has %d rows.\n", $rowcount);
    // Free result set
    mysqli_free_result($result);
}

if ($rowcount == 1){
    $pw = md5($pw);
    $sql2 = "SELECT password FROM $professione WHERE username = '$user'";
    $result = mysqli_query($conn,$sql2);
    $rowcount = mysqli_num_rows($result);
    $row = mysqli_fetch_assoc($result);
    $utente = $_SESSION["utente"];
    $password = $_SESSION["password"];
    if($pw == $row['password']){
            echo"logged";
        switch ($tipo){
            case 1: 
                header("location:docente.html");
                break;
            case 2:
                header("location:tecnico.html");
                break;
            case 3:
                header("location:segretario.html");
                break;
        }
    }
        else{
            echo"password errata";
        }
    
}
else{
    printf("utente non registrato");
}


mysqli_close($conn);
session_abort();
?>