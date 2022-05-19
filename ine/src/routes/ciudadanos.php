<?php
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;

$app->get('/api/ciudadanos', function(Request $request, Response $response){
    try{
        $sql = "SELECT * FROM ciudadano";
        try {
            $db = new db();
            $db = $db->connect();
            $stmt = $db->query($sql);
            $ciudadanos = $stmt->fetchAll(PDO::FETCH_OBJ);
            $db = null;
            return $response->withStatus(200)
            ->withHeader('Content-Type', 'application/json')
            ->write(json_encode($ciudadanos, JSON_UNESCAPED_UNICODE));
        } catch(PDOException $ex){
            echo '{"error": {"text": '.$ex->getMessage().'}';
        }
    }catch(PDOException $ex){
        echo '{"error": {"text": '.$ex->getMessage().'}';
    }
});

$app->post('/api/ciudadano/guardar', function(Request $request, Response $response){
    try{
        $value = $request->getParsedBody();
        $nombre = $value["nombre"];
        $apellidoPaterno = $value["apellidoPaterno"];
        $apellidoMaterno = $value["apellidoMaterno"];
        $telefono = $value["telefono"];
        $tipoTelefono = $value["tipoTelefono"]; 
        $correo = $value["correo"];

        $db = new db();
        $db = $db->connect();
        include("../src/entities/Respuesta.php");
        $object = new Respuesta();
        

        $sql = "INSERT INTO ciudadano (nombre, apellidoPaterno, apellidoMaterno, telefono, tipoTelefono, correo) VALUES (:nombre, :apellidoPaterno, :apellidoMaterno, :telefono, :tipoTelefono, :correo)";
        $statement = $db->prepare($sql);
        if($statement->execute([":nombre" => $nombre, ":apellidoPaterno" => $apellidoPaterno, ":apellidoMaterno" => $apellidoMaterno, ":telefono" => $telefono, ":tipoTelefono" => $tipoTelefono, ":correo" => $correo])){
            $object->resultado = true;
            $object->mensaje = "El usuario se guardo correctamente";

        }else {
            $object->resultado = false;
            $object->mensaje = "Ocurrio un error al guardar el usuario";
        }
        $db = null;
        return $response->withStatus(200)
        ->withHeader('Content-Type', 'application/json')
        ->write(json_encode($object, JSON_UNESCAPED_UNICODE));
    } catch(PDOException $ex){
        echo '{"error": {"text": '.$ex->getMessage().'}';
    }
});