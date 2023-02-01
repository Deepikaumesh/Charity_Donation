<?php 
$servername = 'localhost';
$username = 'root';
$password = '';
$database = "charity_hope_db";


// Create connection
$connection = mysqli_connect($servername, $username, $password, $database);
   
// Check connection
if ($connection->connect_error) {
  die("Connection failed: " . $connection->connect_error);
}
 $ip_address ='192.168.29.64';
 echo $ip_address;
    
// $connection->close();
// header('Content-Type: application/json');
// echo json_encode($response);

  
    
?>




