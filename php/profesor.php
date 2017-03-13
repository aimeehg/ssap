<?php
class profesor{
    private $db;
 
    function __construct($DB_con){
      $this->db = $DB_con;
    }

    public function getDatos($id){
                try
  { 
  
   $stmt = $this->db->prepare("SELECT * FROM profesor  WHERE id=:id");
   $stmt->execute(array(":id"=>$id));
   $row = $stmt->fetch(PDO::FETCH_ASSOC);
  // $count = $stmt->rowCount();
   echo json_encode($row);
    
  }
  catch(PDOException $e){
   echo $e->getMessage();
  }

    }

    public function editarProfesor($id,$nombre,$paterno,$materno,$email,$password,$num_cub,$ext_tel){
                    try
  { 
   $stmt = $this->db->prepare("UPDATE profesor SET nombre=:nombre, paterno=:paterno, materno=:materno, email=:email, password=:password, 
   num_cub=:num_cub, ext_tel=:ext_tel WHERE id=:id");
	        $stmt->bindParam(":nombre",$nombre,PDO::PARAM_STR);
			    $stmt->bindParam(":paterno",$paterno,PDO::PARAM_STR);
			    $stmt->bindParam(":materno",$materno,PDO::PARAM_STR);
          $stmt->bindParam(":email",$email,PDO::PARAM_STR);
			    $stmt->bindParam(":password",$password,PDO::PARAM_STR);
          $stmt->bindParam(":num_cub",$num_cub,PDO::PARAM_INT);
          $stmt->bindParam(":ext_tel",$ext_tel,PDO::PARAM_INT);
          $stmt->bindParam(":id",$id,PDO::PARAM_STR);

  		if($stmt->execute())
				{
					echo "editado";
				}
				else
				{
					echo "error";
				}
      return $stmt;
                  
  }
  catch(PDOException $e){
   echo $e->getMessage();
  }
    }
    
             public function registrar($id,$nombre,$paterno,$materno,$correo,$password,$num_cub,$ext_tel){
       try
       {
            $stmt = $this->db->prepare("SELECT * FROM profesor WHERE id=:id");
			$stmt->execute(array(":id"=>$id));
			$count = $stmt->rowCount();
           
           	if($count==1){
				

        
			$stmt = $this->db->prepare("UPDATE profesor set id=:id, nombre=:nombre,paterno=:paterno,materno=:materno,email=:correo,password=:password,num_cub=:num_cub,ext_tel=:ext_tel,tipo=1 where id=:id");
			$stmt->bindParam(":id",$id);
			$stmt->bindParam(":nombre",$nombre);
			$stmt->bindParam(":paterno",$paterno);
			$stmt->bindParam(":materno",$materno);
            $stmt->bindParam(":correo",$correo);
            $stmt->bindParam(":password",$password);
			$stmt->bindParam(":num_cub",$num_cub);
            $stmt->bindParam(":ext_tel",$ext_tel);
				if($stmt->execute())
				{
					echo "registrado";
				}
				else
				{
					echo "No se puede ejecutar !";
				}
                
                return $stmt;
			
			}
			else{
				
				echo "1"; //  not available
			}
       }
       catch(PDOException $e)
       {
           echo $e->getMessage();
       }    
    }
    public function registrar_curso($nrc,$materia,$seccion,$dias,$hora,$periodo,$fecha,$fecha2,$dia1,$dia2,$dia3){


$user_id = $_SESSION['user_session'];
$stmt = $this->db->prepare("SELECT * FROM profesor WHERE id=:user_id");
$stmt->execute(array(":user_id"=>$user_id));
$userRow=$stmt->fetch(PDO::FETCH_ASSOC);



  

      try{

$stmt = $this->db->query("select max(id) from periodo");
      $stmt->execute();
      $maxper=$stmt->fetch();
      $maxper=$maxper[0]+1;


      $stmt2 = $this->db->query("select max(id) from seccion");
      $stmt2->execute();
      $maxsec=$stmt2->fetch();
      $maxsec=$maxsec[0]+1;
        $prof=$userRow['id'];
      $stmtv2 = $this->db->query("select nrc from curso where id_profesor=$prof");
      $stmtv2->execute();
    //  $nrc_query=$stmtv2->fetch_array();

      // Create connection
$conn = new mysqli("localhost", "root", "","seguimiento_academico");
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
 $sql = "SELECT nrc FROM curso WHERE id_profesor= $prof";
$result = $conn->query($sql);

 
while ($row=$result->fetch_array()) {
      //echo $row[0]."<br>";
      $stmtv21 = $this->db->query("select dias,hora from horarios where nrc_curso = $row[0] and dias='lunes' and hora='$hora'");
      $stmtv21->execute();
  $count = $stmtv21->rowCount();

}

    if($count==0){
    $per=explode("-",$periodo);
      $stmt7 = $this->db->prepare("INSERT INTO periodo(ciclo,year) VALUES(:ciclo,:year)");
      $stmt7->bindParam(":ciclo",$per[0]);
      $stmt7->bindParam(":year",$per[1]);
      
        if($stmt7->execute())
        {
          //echo "registrado";
        }
        else
        {
          echo "No se puede ejecutar !";
        }


      $stmt8 = $this->db->prepare("INSERT INTO seccion(id,secc) VALUES(:id,:seccion)");
      $stmt8->bindParam(":id",$maxsec);
      $stmt8->bindParam(":seccion",$seccion);
      
        if($stmt8->execute())
        {
          //echo "registrado";
        }
        else
        {
          echo "No se puede ejecutar !";
        }


      $stmt3 = $this->db->prepare("INSERT INTO curso(nrc,id_materia,seccion,id_profesor,periodo) VALUES(:nrc,:id_materia,:seccion,:id_profesor,:periodo)");
      $stmt3->bindParam(":nrc",$nrc);
      $stmt3->bindParam(":id_materia",$materia);
      $stmt3->bindParam(":seccion",$maxsec);
      $stmt3->bindParam(":id_profesor",$userRow['id']);
      $stmt3->bindParam(":periodo",$maxper);
        if($stmt3->execute())
        {
        //  echo "registrado";
        }
        else
        {
          echo "No se puede ejecutar !";
        }
              



    


    if (strcasecmp($dias[1], "martes")==0){
      switch ($hora) {
        case "7:00":
          $horas="8:00";
          break;
        case "9:00":
          $horas="10:00";
          break;
        case "11:00":
          $horas="12:00";
          break;
        case "13:00":
          $horas="14:00";
          break;
        case "15:00":
          $horas="16:00";
          break;
        case "17:00":
          $horas="18:00";
          break;

        default:
          $horas=$hora;
                    break;
      }
    }
    else
      $horas=$hora;



    //echo $horas;






    
      $stmt4 = $this->db->prepare("INSERT INTO horarios(salon,dias,hora,nrc_curso,fecha_inicio,fecha_final) VALUES(:salon,:dias,:hora,:nrc_curso,:fecha_inicio,:fecha_final)");
      $stmt4->bindParam(":salon",$dia1);
      $stmt4->bindParam(":dias",$dias[0]);
      $stmt4->bindParam(":hora",$horas);
      $stmt4->bindParam(":nrc_curso",$nrc);
      $stmt4->bindParam(":fecha_inicio",$fecha);
      $stmt4->bindParam(":fecha_final",$fecha2);
        if($stmt4->execute())
        {
         // echo "registrado";
        }
        else
        {
          echo "No se puede ejecutar !";
        }
      



      $stmt5 = $this->db->prepare("INSERT INTO horarios(salon,dias,hora,nrc_curso,fecha_inicio,fecha_final) VALUES(:salon,:dias,:hora,:nrc_curso,:fecha_inicio,:fecha_final)");
      $stmt5->bindParam(":salon",$dia2);
      $stmt5->bindParam(":dias",$dias[1]);
      $stmt5->bindParam(":hora",$hora);
      $stmt5->bindParam(":nrc_curso",$nrc);
      $stmt5->bindParam(":fecha_inicio",$fecha);
      $stmt5->bindParam(":fecha_final",$fecha2);
        if($stmt5->execute())
        {
          //echo "registrado";
        }
        else
        {
          echo "No se puede ejecutar !";
        }
        


      $stmt6 = $this->db->prepare("INSERT INTO horarios(salon,dias,hora,nrc_curso,fecha_inicio,fecha_final) VALUES(:salon,:dias,:hora,:nrc_curso,:fecha_inicio,:fecha_final)");
      $stmt6->bindParam(":salon",$dia3);
      $stmt6->bindParam(":dias",$dias[2]);
      $stmt6->bindParam(":hora",$hora);
      $stmt6->bindParam(":nrc_curso",$nrc);
      $stmt6->bindParam(":fecha_inicio",$fecha);
      $stmt6->bindParam(":fecha_final",$fecha2);
        if($stmt6->execute())
        {
          echo "registrado";
        }
        else
        {
          echo "No se puede ejecutar !";
        }
        
      }else
      echo "1"; 
 

 



      }catch(PDOException $e)
       {
           //echo $e->getMessage();
           echo "error";
       }

    
   
    }
 
public function login($uname,$upass)
    {
       try
       {
        
          $stmt = $this->db->prepare("SELECT * FROM profesor WHERE id=:uname LIMIT 1");
          $stmt->execute(array(':uname'=>$uname));
          
          $userRow=$stmt->fetch(PDO::FETCH_ASSOC);
          
          if($stmt->rowCount() > 0)
          {
             if($upass == $userRow['password'])
             {
                $_SESSION['user_session'] = $userRow['id'];
                return true;
             }
             else
             {
                return false;
             }
          }
       }
       catch(PDOException $e)
       {
           echo $e->getMessage();
       }
   }
 
   public function is_loggedin()
   {
      if(isset($_SESSION['user_session']))
      {
         return true;
      }
   }
 
   public function redirect($url)
   {
       header("Location: $url");
   }
 
   public function logout()
   {
        session_destroy();
        unset($_SESSION['user_session']);
        return true;
   }

   
}

