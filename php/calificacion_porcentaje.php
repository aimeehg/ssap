<?php
include_once '../php/conexion.php';
if(!$profesor->is_loggedin())
{
 $profesor->redirect('../index.html');
}
$user_id = $_SESSION['user_session'];
$stmt = $DB_con->prepare("SELECT * FROM profesor WHERE id=:user_id");
$stmt->execute(array(":user_id"=>$user_id));
$userRow=$stmt->fetch(PDO::FETCH_ASSOC);

$stmt2 = $DB_con->prepare("SELECT * FROM evaluacion");
$stmt2->execute();
$cc=$stmt2->rowCount();

for ($i=1; $i<=$cc ; $i++) { 
$stmt1 = $DB_con->prepare("UPDATE evaluacion set calif=:calif WHERE id=:id");
$ind=(string)$_POST[$i];
echo $ind."<br>";
$stmt1->bindParam("calif",$ind);
$stmt1->bindParam("id",$i);
if($stmt1->execute()){
 echo '<script language="javascript">alert("Calificaciones subidas correctamente")</script>'; 
echo '<script language="javascript">window.location.href="../vistas/cursos.php" ;</script>'; 
}
else{
 echo '<script language="javascript">alert("Error")</script>'; 

echo '<script language="javascript">window.location.href="../vistas/cursos.php" ;</script>'; 
}

}



?>