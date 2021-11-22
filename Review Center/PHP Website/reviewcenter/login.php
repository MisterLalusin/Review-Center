<?php
if(isset($_POST['username']) && isset($_POST['password'])){

    require('connection/default_connection.php');

    $username= $_REQUEST["username"];
    $password = $_REQUEST["password"];

    $sql = "SELECT username, password FROM tblaccounts WHERE username = '$username' AND password = '$password'";

    $result = $connection->query($sql);

    if ($result->num_rows > 0) {
        $connection->close(); 
        $returnValue = array("response"=>"Log In Successful!");
    } 
    else {
        $connection->close(); 
        $returnValue = array("response"=>"Log In Failed!");
    }	

    echo json_encode($returnValue); 

}
else {	
	header( "refresh:2;url=index.php" );
}?>