<?php
/**
 * scritto da nicolò beltrame
 */
$lavoro = $_POST["lavoro"];
$sede = $_POST["sede"];
$ufficio = $_POST["ufficio"];
$user = $_POST["username"];
$pw = $_POST["password"];
$controllo = $_POST["password2"];
$name = $_POST["name"];
$cognome = $_POST["cognome"];
$email = $_POST["email"];

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

if($pw != $controllo){
    header("location:register.html");
}
$pw = md5($pw);

//crea utente 
switch($lavoro){
    case 1:      
        $professione = 'docente';
        $s = "SELECT * FROM  $professione WHERE username='$user' AND email='$email'";
        if ($result = mysqli_query($conn, $s)){
            // Return the number of rows in result set                
            $rowcount = mysqli_num_rows($result);
            printf("Result set has %d rows.\n", $rowcount);
            // Free result set
            mysqli_free_result($result);
        }
        if ($rowcount == 0){
            $sql = "INSERT INTO $professione(username,nome,cognome,email,password) VALUES ('$user','$name','$cognome','$email','$pw')";
            if ($conn->query($sql) === TRUE) {
            echo "Registrazione effettuale";
            } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
            }
        }
        else{
            echo"email o username già esistente";
        }
    break;
    case 2:
        $professione = 'tecnico_software';
        $s = "SELECT * FROM  $professione WHERE username='$user' AND email='$email'";
        if ($result = mysqli_query($conn, $s)){
            // Return the number of rows in result set                
            $rowcount = mysqli_num_rows($result);
            printf("Result set has %d rows.\n", $rowcount);
            // Free result set
            mysqli_free_result($result);
        }
        if ($rowcount == 0){
            $sql = "INSERT INTO $professione(username,nome,cognome,email,password,fk_sede) VALUES ('$user','$name','$cognome','$email','$pw','$sede')";
            if ($conn->query($sql) === TRUE) {
            echo "Registrazione effettuale";
            } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
            }
        }
        else{
            echo"email o username già esistente";
        }
    break;
    case 3:
        $professione = 'segretario_hardware';
        $s = "SELECT * FROM  $professione WHERE username='$user' AND email='$email'";
        if ($result = mysqli_query($conn, $s)){
            // Return the number of rows in result set                
            $rowcount = mysqli_num_rows($result);
            printf("Result set has %d rows.\n", $rowcount);
            // Free result set
            mysqli_free_result($result);
        }
        if ($rowcount == 0){
            $sql = "INSERT INTO $professione(username,nome,cognome,email,password,fk_ufficio) VALUES ('$user','$name','$cognome','$email','$pw','$ufficio')";
            if ($conn->query($sql) === TRUE) {
            echo "Registrazione effettuale";
            } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
            }
        }
        else{
            echo"email o username già esistente";
        }
        break;
}
mysqli_close($conn);
?>