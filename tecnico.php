
<?php 
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "picciotti";

// Create connection
$conn = mysqli_connect($servername, $username, $password, $dbname);;
    if (!$conn) {
        die("Errore nella connessione al database!");
    }
    
    // recuperare dati dal database
    $sql = "SELECT * FROM richiesta where tipologia = 'software'";
    $risultato = mysqli_query($conn, $sql);
    
    // stampare la tabella
    if (mysqli_num_rows($risultato) > 0) {
        echo "<table>";
        echo "<tr> <th>Data</th> <th>priorità</th> <th>descrizione</th> <th>ambito</th> <th>luogo</th> <th>tipologia</th> <th>status</th> </tr>";
        // output dei dati di ogni riga
        while($riga = mysqli_fetch_assoc($risultato)) {
            echo "<tr>";
            echo "<td>" . $riga['data'] . "</td>";
            echo "<td>" . $riga['priorità'] . "</td>";
            echo "<td>" . $riga['descrizione'] . "</td>";
            echo "<td>" . $riga['ambito'] . "</td>";
            echo "<td>" . $riga['luogo'] . "</td>";
            echo "<td>" . $riga['tipologia'] . "</td>";
            echo "<td>" . $riga['status'] . "</td>";
    

            echo "</tr>";
        }
        echo "</table>";
    } else {
        echo "0 risultati";
    } 

    // chiudere la connessione
    mysqli_close($conn);
?>
