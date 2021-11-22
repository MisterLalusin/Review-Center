<?php
if(isset($_POST['username']) && isset($_POST['password']) && isset($_POST['logCategory'])  && isset($_POST['logScore']) && isset($_POST['logItem']) && isset($_POST['logPercentage'])){

    require('connection/default_connection.php');

    $username= mysqli_real_escape_string($connection,$_POST['username']);
    $password = mysqli_real_escape_string($connection,$_POST['password']);
    $logcategory = mysqli_real_escape_string($connection,$_POST['logCategory']);
    $logscore = mysqli_real_escape_string($connection,$_POST['logScore']);
    $logitem = mysqli_real_escape_string($connection,$_POST['logItem']);
    $logpercentage = mysqli_real_escape_string($connection,$_POST['logPercentage']);
	$created = date("Y-m-d H:i:s");

    $sql = "SELECT username, password FROM tblaccounts WHERE username = '$username' AND password = '$password'";

    $result = $connection->query($sql);

    if ($result->num_rows > 0) {
        //$connection->close(); 
        //$returnValue = array("response"=>"Log In Successful!");
		$sqlCreateLogs = "INSERT INTO `tblscorelogs` (`user`, `category`,   `score`,  `item`, `percentage`, `created`) VALUES('$username', '$logcategory', '$logscore', '$logitem', '$logpercentage', '$created');";
								
		$resultCreateLogs = $connection->query($sqlCreateLogs);
									
		if (!$resultCreateLogs) {
            $returnValue = array("response"=>"An error occured");
		}
		else {
            $returnValue = array("response"=>"Log created");
		}
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