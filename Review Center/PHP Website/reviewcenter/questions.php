<?php
if(isset($_POST['username']) && isset($_POST['password']) && isset($_POST['category']) && isset($_POST['questionprevid'])){
    require('connection/default_connection.php');

    $username= strtolower($_REQUEST["username"]);
    $password = $_REQUEST["password"];
    $category = $_REQUEST["category"];
    $questionprevid = $_REQUEST["questionprevid"];

    $sql = "SELECT username, password FROM tblaccounts WHERE username = '$username' AND password = '$password'";

    $result = $connection->query($sql);

    if ($result->num_rows > 0) {
        
        // get data from database
        $result = mysqli_query($connection, "SELECT * FROM tblquestions WHERE category LIKE '%[$category]%' and  NOT id='$questionprevid' and deleted ='false' ORDER BY RAND ()  LIMIT 1 ");

        // adding in array
        $data = array();
        while ($row = mysqli_fetch_object($result))
        {
            array_push($data, $row);
        }

        // send as response
        echo json_encode($data);

    } 
    else {
        $connection->close(); 
        $returnValue = array("response"=>"No Questions Available!");
    }	
}
else {	
	header( "refresh:2;url=index.php" );
}?>