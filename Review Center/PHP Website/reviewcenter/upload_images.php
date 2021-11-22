<?php
if(isset($_POST['username']) && isset($_POST['password']) && isset($_POST['base64']) && isset($_POST['ImageName']) && isset($_POST['phpServer'])){

    require('connection/default_connection.php');

    $username= mysqli_real_escape_string($connection,$_POST['username']);
    $password = mysqli_real_escape_string($connection,$_POST['password']);
    $phpServer = mysqli_real_escape_string($connection,$_POST['phpServer']);
	$created = date("Y-m-d H:i:s");

	$target_dir = "72657669657763656e74657266696c6573/7175657374696f6e73/";
	$uploadOk = 1;
	$imageFileType = strtolower(pathinfo($_POST['ImageName'],PATHINFO_EXTENSION));
	//$imageFileType = strtolower("jpeg");

    $sql = "SELECT username, password FROM tblaccounts WHERE username = '$username' AND password = '$password'";

    $result = $connection->query($sql);

    if ($result->num_rows > 0) {
        //$connection->close(); 
        //$returnValue = array("response"=>"Log In Successful!");
		
        $newfilename = strToHex(str_replace(" ", "", $username . "_" . date('dmYHis')))  . "." . $imageFileType;
        $imgname = $target_dir .  $newfilename;

        $fix = str_replace(" ","+",$_POST['base64']);
        $fix = str_replace("\\","",$fix);

        $imsrc = base64_decode($fix);
        
        $fp = fopen($imgname, 'w');
        fwrite($fp, $imsrc);
        if(fclose($fp)){
            
            #$fileUrl = getBaseUrl() . $target_dir . $newfilename;
            $fileUrl = $phpServer . $target_dir . $newfilename;
            
            $connection->close(); 
            //echo "".$fileUrl;
            $returnValue = array("response"=>$fileUrl);
        }
        else{
            $connection->close();
            //echo "Error uploading image";
            $returnValue = array("response"=>"Error uploading image");
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
}


function strToHex($string){
    $hex = '';
    for ($i=0; $i<strlen($string); $i++){
        $ord = ord($string[$i]);
        $hexCode = dechex($ord);
        $hex .= substr('0'.$hexCode, -2);
    }
    return strToLower($hex);
}

?>