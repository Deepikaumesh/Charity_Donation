<?php 
$servername = 'localhost';
$username = 'root';
$password = '';
$database = "charity_hope_db";

// Create connection
$connection = mysqli_connect($servername, $username, $password, $database);

          if( !empty($_POST["name"])and !empty($_POST["bank"])and !empty($_POST["ac_no"])and !empty($_POST["total_amt"])
			  and !empty($_POST["craft_id"]))
{

      
    $name= $_POST["name"];
	 $bank= $_POST["bank"];
    $ac_no= $_POST["ac_no"];
	$total_amt= $_POST["total_amt"];
	$craft_id= $_POST["craft_id"];
   
   
    
               
      
     
     $name=mysqli_real_escape_string($connection,$name);
	  $bank=mysqli_real_escape_string($connection,$bank);
	   $ac_no=mysqli_real_escape_string($connection,$ac_no);
	    $total_amt=mysqli_real_escape_string($connection,$total_amt);
		 $craft_id=mysqli_real_escape_string($connection,$craft_id);
     
     
	 
	

 
 



    $sql = "INSERT INTO   payment(name,bank,ac_no,total_amt,craft_id) VALUES (
	'".$name."','".$bank."','".$ac_no."','".$total_amt."','".$craft_id."')";


    if ( mysqli_query($connection, $sql) ) {
        $result["error"] = false;
        $result["message"] = "your payment successfull";
	}
	else{
		$result["error"] = true;
        $result["message"] = "payment not success";
	}

        echo json_encode($result);
        mysqli_close($connection);

    

}

	   
	   
	 
 
 




?>