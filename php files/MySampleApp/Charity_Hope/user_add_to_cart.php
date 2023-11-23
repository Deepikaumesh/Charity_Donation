<?php 
$servername = 'localhost';
$username = 'root';
$password = '';
$database = "charity_hope_db";

// Create connection
$connection = mysqli_connect($servername, $username, $password, $database);

          if( !empty($_POST["craft_id"])and !empty($_POST["uid"])and !empty($_POST["qty"]))
{

      
    $craft_id= $_POST["craft_id"];
	 $uid= $_POST["uid"];
    $qty= $_POST["qty"];
   
   
    
               
      
     
     $craft_id=mysqli_real_escape_string($connection,$craft_id);
	  $uid=mysqli_real_escape_string($connection,$uid);
	   $qty=mysqli_real_escape_string($connection,$qty);
     
	 
	

 
 



    $sql = "INSERT INTO   cart (craft_id,uid,qty) VALUES ('".$craft_id."','".$uid."','".$qty."')";


    if ( mysqli_query($connection, $sql) ) {
        $result["error"] = false;
        $result["message"] = "Registered successfully";
	}
	else{
		$result["error"] = true;
        $result["message"] = "Registration not success";
	}

        echo json_encode($result);
        mysqli_close($connection);

    

}

	   
	   
	 
 
 




?>