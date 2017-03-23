<?php
include_once 'conexion.php';
$data = json_decode(file_get_contents("php://input"));
$sql = "INSERT into anuncio(id_curso, descripcion,destino,fecha_final)
values ('$data->id_curso', '$data->descripcion', 0, '$data->fecha_final')";
$DB_con->exec($sql);
echo true;
?>