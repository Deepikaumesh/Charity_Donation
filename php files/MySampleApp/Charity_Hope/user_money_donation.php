<?php 
$servername = 'localhost';
$username = 'root';
$password = '';
$database = "charity_hope_db";

// Create connection
$connection = mysqli_connect($servername, $username, $password, $database);

          if( !empty($_POST["name"])and !empty($_POST["place"])
			  and !empty($_POST["phone"])and !empty($_POST["amount"])
		  and !empty($_POST["bank"])and !empty($_POST["account"]))
{

      $name = $_POST["name"];
    $place= $_POST["place"];
    $phone= $_POST["phone"];
    $amount = $_POST["amount"];
	 $bank= $_POST["bank"];
    $account = $_POST["account"];
    
               
      
      $name=mysqli_real_escape_string($connection,$name);
     $place=mysqli_real_escape_string($connection,$place);
      $amount=mysqli_real_escape_string($connection,$amount);
	   $bank=mysqli_real_escape_string($connection,$bank);
       $account=mysqli_real_escape_string($connection,$account);
	   
	   
	 
 
 



    $sql = "INSERT INTO   donation (name,place,phone,amount,bank,account) 
	VALUES ('".$name."','".$place."','".$phone."','".$amount."','".$bank."','".$account."')";


    if ( mysqli_query($connection, $sql) ) {
        $result["error"] = false;
        $result["message"] = "Money donated successfully";
	}
	// else{
		// $result["error"] = true;
        // $result["message"] = "donation not success";
	// }

        echo json_encode($result);
        mysqli_close($connection);

    


}

?>