<?php
	   
	$con=mysqli_connect("localhost","root","","seguimiento_academico");

if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }
$nrc= $_POST['nrc'];
	if(isset($_POST['matriculas'])) {
    $json = $_POST['matriculas'];
   // print_r($json);
   $error = false;

      foreach($json as $item) {
       if(!mysqli_query($con,"INSERT INTO inscripcion (id_curso, id_alumno) VALUES ($nrc,'".$item['matricula']."')")){
           $error = true; //error
       }
    }
    if($error){
        echo 0; //error
    }else echo 1;


mysqli_close($con);
  } else {
    echo "Error post";
  }

?>