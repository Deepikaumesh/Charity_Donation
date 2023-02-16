<?php 
$servername = 'localhost';
$username = 'root';
$password = '';
$database = "charity_hope_db";

// Create connection
$connection = mysqli_connect($servername, $username, $password, $database);

       if( !empty($_POST["name"])and !empty($_POST["bank"])and !empty($_POST["ac_no"])and !empty($_POST["total_amt"])
			  and !empty($_POST["phone"])and !empty($_POST["uid"]) 
			  )
{

      
    $name= $_POST["name"];
	 $bank= $_POST["bank"];
    $ac_no= $_POST["ac_no"];
	$total_amt= $_POST["total_amt"];
	$phone= $_POST["phone"];
	$uid =$_POST["uid"];
   
    
               
      
 
     
     
	 
	

 
   
 $sql1 = "INSERT INTO     order_tb(uid,order_date,total_amt) VALUES ('".$uid."',	'".date("d/m/Y")."','".$total_amt."')";
  if ( mysqli_query($connection, $sql1))
 
    {
        
        $qry = "select max(order_id) as oid from order_tb";
        
        $result1 = mysqli_query($connection, $qry) or die("Error in Selecting " . mysqli_error($connection));
        
        $row = mysqli_fetch_assoc($result1);
        
         $sql_cart = "select * from cart where uid = ".$uid;
         
          $result2 = mysqli_query($connection, $sql_cart) or die("Error in Selecting " . mysqli_error($connection));
          
            while($row1 = $result2->fetch_assoc()){
                
               $sql_order_items = "INSERT INTO  order_items_tb(craft_id,qty,order_id,uid)  VALUES ('".$row1["craft_id"]."','".$row1["qty"]."','".$row["oid"]."',
                '".$row1["uid"]."')";
                 mysqli_query($connection, $sql_order_items);
   
                
                
            
        }
        
        $delete_cart = "delete from cart where uid =".$uid;
        
          if ( mysqli_query($connection, $delete_cart))
   {}
        
        
        
        
     
        
           $sql = "INSERT INTO    payment(name,bank,ac_no,total_amt,phone,order_id,uid) VALUES (
	'".$name."','".$bank."','".$ac_no."','".$total_amt."','".$phone."','".$row["oid"]."','".$uid."')";
	
        if ( mysqli_query($connection, $sql))
   {
       
       
        $result["error"] = false;
        $result["message"] = "your payment successfull";
        
      
   
        
        
	}
	else{
		$result["error"] = true;
        $result["message"] = "payment not success";
	}
    }



        echo json_encode($result);
        mysqli_close($connection);

    

}

	   
	   
	 
 
 




?>