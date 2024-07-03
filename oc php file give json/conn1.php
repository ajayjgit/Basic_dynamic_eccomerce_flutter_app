<?php      
    $host = "localhost";  
    $user = "root";  
    $password = '';  
    $db_name = "ockadai";  
      
    $con = mysqli_connect($host, $user, $password, $db_name);  
    if(mysqli_connect_errno()) {  
        die("Failed to connect with MySQL: ". mysqli_connect_error());  
    }
	date_default_timezone_set('Asia/Kolkata');	
    $current_datetime = date('Y-m-d H:i:s');		
?> 