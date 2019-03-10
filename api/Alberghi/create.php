<?php

// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/Database.php';
include_once '../models/Albergo.php';

try{
    //instantiati database
    $databse = new Database();
    $db = $databse->getConnection();

    //instantiate Albergo
    $albergo = new Albergo();

    //get data form post
    $data = json_decode(file_get_contents("php://input"), true);

    if(isset($data['codAlbergo']) && isset($data['denominazione']) && isset($data['stanzeDisponibili']) && isset($data['numeri'])){

        $albergo->codAlbergo = $data['codAlbergo'];
        $albergo->denominazione = $data['denominazione'];
        $albergo->stanzeDisponibili = $data['stanzeDisponibili'];
        $albergo->numeri = $data['numeri'];

        if($albergo->create()) {
            // set response code - 201 created
            http_response_code(201);
            echo json_encode(array("message" => "Albergo inserito con successo."));
        } else{
            // set response code - 503 service unavailable -> creation error
            http_response_code(503);
            echo json_encode(array("message" => "Impossibile inserire l'albergo. "));
        }

    } else {
        // set response code - 400 bad request
        http_response_code(400);
        echo json_encode(array("message" => "Impossibile creare il viaggio. Parametri incompleti."));

    }

}catch(Exception $exception) {
    // set response code - 500  Internal Server Error -> connection error
    http_response_code(500);
    echo json_encode(array("message" => $exception->getMessage()));
}

