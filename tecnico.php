
<?php 
$username = "u"; 
$password = ""; 
$database = ""; 
$mysqli = new mysqli("localhost", $username, $password, $database); 
$query = "SELECT * FROM richiesta where tipologia = 'hardware'";

echo '<table border="0" cellspacing="2" cellpadding="2"> 
      <tr> 
          <td> <font face="Arial">data</font> </td> 
          <td> <font face="Arial">priorità</font> </td> 
          <td> <font face="Arial">descrizione</font> </td> 
          <td> <font face="Arial">ambito</font> </td> 
          <td> <font face="Arial">tipologia</font> </td> 
      </tr>';

if ($result = $mysqli->query($query)) {
    while ($row = $result->fetch_assoc()) {
        $field1name = $row["col1"];
        $field2name = $row["col2"];
        $field3name = $row["col3"];
        $field4name = $row["col4"];
        $field5name = $row["col5"]; 

        echo '<tr> 
                  <td>'.$field1name.'</td> 
                  <td>'.$field2name.'</td> 
                  <td>'.$field3name.'</td> 
                  <td>'.$field4name.'</td> 
                  <td>'.$field5name.'</td> 
              </tr>';
    }
    $result->free();
} 
?>
