<?php
//if(isset($_POST['username']) && isset($_POST['password']) && isset($_POST['category']) && isset($_POST['question_img']) && isset($_POST['question_type']) && isset($_POST['ans_correct'])){
if(isset($_POST['username']) && isset($_POST['password']) && isset($_POST['category']) && isset($_POST['question_text']) && isset($_POST['question_type']) && isset($_POST['ans_correct'])){

    require('connection/default_connection.php');

    $username= mysqli_real_escape_string($connection,$_POST['username']);
    $password = mysqli_real_escape_string($connection,$_POST['password']);
    $category = mysqli_real_escape_string($connection,$_POST['category']);
    $question_img;
    $question_text = mysqli_real_escape_string($connection,$_POST['question_text']);
    $question_type = mysqli_real_escape_string($connection,$_POST['question_type']);
    $ans_a;
    $ans_b;
    $ans_c;
    $ans_d;
    $ans_a_img;
    $ans_b_img;
    $ans_c_img;
    $ans_d_img;
    $ans_correct = mysqli_real_escape_string($connection,$_POST['ans_correct']);
	$created = date("Y-m-d H:i:s");


    if ($question_type == "plain") {

        $ans_a = mysqli_real_escape_string($connection,$_POST['ans_a']);
        $ans_b = mysqli_real_escape_string($connection,$_POST['ans_b']);
        $ans_c = mysqli_real_escape_string($connection,$_POST['ans_c']);
        $ans_d = mysqli_real_escape_string($connection,$_POST['ans_d']);

    }
    elseif ($question_type == "wimage") {

        $ans_a = mysqli_real_escape_string($connection,$_POST['ans_a']);
        $ans_b = mysqli_real_escape_string($connection,$_POST['ans_b']);
        $ans_c = mysqli_real_escape_string($connection,$_POST['ans_c']);
        $ans_d = mysqli_real_escape_string($connection,$_POST['ans_d']);

        $question_img = mysqli_real_escape_string($connection,$_POST['question_img']);
    
    }
    elseif ($question_type == "wimage_answimage") {

        $ans_a = mysqli_real_escape_string($connection,$_POST['ans_a']);
        $ans_b = mysqli_real_escape_string($connection,$_POST['ans_b']);
        $ans_c = mysqli_real_escape_string($connection,$_POST['ans_c']);
        $ans_d = mysqli_real_escape_string($connection,$_POST['ans_d']);
        $ans_a_img = mysqli_real_escape_string($connection,$_POST['ans_a_img']);
        $ans_b_img = mysqli_real_escape_string($connection,$_POST['ans_b_img']);
        $ans_c_img = mysqli_real_escape_string($connection,$_POST['ans_c_img']);
        $ans_d_img = mysqli_real_escape_string($connection,$_POST['ans_d_img']);

        $question_img = mysqli_real_escape_string($connection,$_POST['question_img']);
    
    }
    elseif ($question_type == "wimage_answimagewotext") {

        $ans_a_img = mysqli_real_escape_string($connection,$_POST['ans_a_img']);
        $ans_b_img = mysqli_real_escape_string($connection,$_POST['ans_b_img']);
        $ans_c_img = mysqli_real_escape_string($connection,$_POST['ans_c_img']);
        $ans_d_img = mysqli_real_escape_string($connection,$_POST['ans_d_img']);

        $question_img = mysqli_real_escape_string($connection,$_POST['question_img']);
    
    }
    elseif ($question_type == "woimage_answimage") {

        $ans_a = mysqli_real_escape_string($connection,$_POST['ans_a']);
        $ans_b = mysqli_real_escape_string($connection,$_POST['ans_b']);
        $ans_c = mysqli_real_escape_string($connection,$_POST['ans_c']);
        $ans_d = mysqli_real_escape_string($connection,$_POST['ans_d']);
        $ans_a_img = mysqli_real_escape_string($connection,$_POST['ans_a_img']);
        $ans_b_img = mysqli_real_escape_string($connection,$_POST['ans_b_img']);
        $ans_c_img = mysqli_real_escape_string($connection,$_POST['ans_c_img']);
        $ans_d_img = mysqli_real_escape_string($connection,$_POST['ans_d_img']);

    
    }
    elseif ($question_type == "woimage_answimagewotext") {

        $ans_a_img = mysqli_real_escape_string($connection,$_POST['ans_a_img']);
        $ans_b_img = mysqli_real_escape_string($connection,$_POST['ans_b_img']);
        $ans_c_img = mysqli_real_escape_string($connection,$_POST['ans_c_img']);
        $ans_d_img = mysqli_real_escape_string($connection,$_POST['ans_d_img']);

    
    }

    $sql = "SELECT username, password FROM tblaccounts WHERE username = '$username' AND password = '$password'";

    $result = $connection->query($sql);

    if ($result->num_rows > 0) {
        //$connection->close(); 
        //$returnValue = array("response"=>"Log In Successful!");

        $sqlCreateQuestions = "";

        if ($question_type == "plain") {  
            $sqlCreateQuestions = "INSERT INTO `tblquestions` (`category`, `question_text`,   `question_type`,  `ans_a`,  `ans_b`,  `ans_c`,  `ans_d`,  `ans_correct`,  `posted_by`,  `deleted`, `created`) VALUES('$category', '$question_text', '$question_type', '$ans_a', '$ans_b', '$ans_c', '$ans_d', '$ans_correct', '$username', 'false','$created');";
        }
        else if ($question_type == "wimage") {  
            $sqlCreateQuestions = "INSERT INTO `tblquestions` (`category`, `question_text`,   `question_type`,    `question_img`,  `ans_a`,  `ans_b`,  `ans_c`,  `ans_d`,  `ans_correct`,  `posted_by`,  `deleted`, `created`) VALUES('$category', '$question_text', '$question_type',  '$question_img', '$ans_a', '$ans_b', '$ans_c', '$ans_d', '$ans_correct', '$username', 'false','$created');";
        }
        else if ($question_type == "wimage_answimage") {  
            $sqlCreateQuestions = "INSERT INTO `tblquestions` (`category`, `question_text`,   `question_type`,    `question_img`,  `ans_a`,  `ans_b`,  `ans_c`,  `ans_d`,  `ans_a_img`,  `ans_b_img`,  `ans_c_img`,  `ans_d_img`,  `ans_correct`,  `posted_by`,  `deleted`, `created`) VALUES('$category', '$question_text', '$question_type',  '$question_img', '$ans_a', '$ans_b', '$ans_c', '$ans_d', '$ans_a_img', '$ans_b_img', '$ans_c_img', '$ans_d_img', '$ans_correct', '$username', 'false','$created');";
        }
        else if ($question_type == "wimage_answimagewotext") {  
            $sqlCreateQuestions = "INSERT INTO `tblquestions` (`category`, `question_text`,   `question_type`,    `question_img`, `ans_a_img`,  `ans_b_img`,  `ans_c_img`,  `ans_d_img`,  `ans_correct`,  `posted_by`,  `deleted`, `created`) VALUES('$category', '$question_text', '$question_type',  '$question_img', '$ans_a_img', '$ans_b_img', '$ans_c_img', '$ans_d_img', '$ans_correct', '$username', 'false','$created');";
        }
        else if ($question_type == "woimage_answimage") {  
            $sqlCreateQuestions = "INSERT INTO `tblquestions` (`category`, `question_text`,   `question_type`,  `ans_a`,  `ans_b`,  `ans_c`,  `ans_d`,  `ans_a_img`,  `ans_b_img`,  `ans_c_img`,  `ans_d_img`,  `ans_correct`,  `posted_by`,  `deleted`, `created`) VALUES('$category', '$question_text',  '$question_type', '$ans_a', '$ans_b', '$ans_c', '$ans_d', '$ans_a_img', '$ans_b_img', '$ans_c_img', '$ans_d_img', '$ans_correct', '$username', 'false','$created');";
        }
        else if ($question_type == "woimage_answimagewotext") {  
            $sqlCreateQuestions = "INSERT INTO `tblquestions` (`category`, `question_text`,   `question_type`, `ans_a_img`,  `ans_b_img`,  `ans_c_img`,  `ans_d_img`,  `ans_correct`,  `posted_by`,  `deleted`, `created`) VALUES('$category', '$question_text', '$question_type', '$ans_a_img', '$ans_b_img', '$ans_c_img', '$ans_d_img', '$ans_correct', '$username', 'false','$created');";
        }
								
		$resultCreateQuestions = $connection->query($sqlCreateQuestions);
									
		if (!$resultCreateQuestions) {
            $returnValue = array("response"=>"An error occured");
		}
		else {
            $returnValue = array("response"=>"Question created");
		}
        
    } 
    else {
        $connection->close(); 
        $returnValue = array("response"=>"Log In Failed!");
    }	

    echo json_encode($returnValue); 

}
else {	
	//header( "refresh:2;url=index.php" );
}?>