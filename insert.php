<?php
$data = $_POST["data"];
$pri = $_POST["pri"];
$desc = $_POST["desc"];
$amb = $_POST["amb"];
$luogo = $_POST["luogo"];
$tipo = $_POST["tipo"];
$stato = $_POST["stato"];

$s = "SELECT * FROM richiesta WHERE data ='$data' AND descrizione ='$desc'";
if ($result = mysqli_query($conn, $s)){
    // Return the number of rows in result set                
    $rowcount = mysqli_num_rows($result);
    printf("Result set has %d rows.\n", $rowcount);
    // Free result set
    mysqli_free_result($result);
}

if ($rowcount == 0){
    //registrazione nuova richiesta
    $sql = "INSERT INTO richiesta(data,priorità,descrizione,ambito,luogo,tipo,stato,) VALUES ('$data,'$pri','$desc','$amb','$luogo','$tipo','$stato')";
    if ($conn->query($sql) === TRUE) {
    echo "Registrazione effettuale";
    } else {
    echo "Error: " . $sql . "<br>" . $conn->error;
    }
}
else{
    echo"email o username già esistente";
}
?>