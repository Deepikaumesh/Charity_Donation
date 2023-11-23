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


     $uid = $_GET['uid'];
     // $uid =58;

   //$uid=mysqli_real_escape_string($connection,$uid);
 // $sql = "SELECT cart.id as cartid,qty,uid, craft.* FROM cart inner join craft ON cart.craft_id =craft.craft_id
 // WHERE uid=3"; 
  $sql = "SELECT cart.id as cartid,qty,uid, craft.* FROM cart inner join craft ON cart.craft_id =craft.craft_id
 WHERE uid=".$uid; 
 
 //  

    

 
    $result = mysqli_query($connection, $sql) or die("Error in Selecting " . mysqli_error($connection));
     
    
    $response = array();
    if($result->num_rows > 0){
        while($row = $result->fetch_assoc()){
            array_push($response,$row);
        }
    }

    
//$connection->close();
//header('Content-Type: application/json');
echo json_encode($response);

  
    
?>




