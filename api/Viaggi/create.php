<?php
/**
 * Created by PhpStorm.
 * User: russo
 * Date: 2/5/2019
 * Time: 7:30 PM
 */

// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// include database and object files
include_once '../models/Viaggio.php';

try {
    // instantiate viaggio
    $viaggio = new Viaggio();

    // get data from post
    $data = json_decode(file_get_contents("php://input"), true);

    if( isset($data['codViaggio']) && isset($data['tipoViaggio']) && isset($data['luogoPartenza']) && isset($data['luogoDestinazione']) && isset($data['costoViaggio']) && isset($data['dataInizioViaggio']) && isset($data['dataFineViaggio']) ) {
        $viaggioToCreate['codViaggio'] = $data['codViaggio'];
        $viaggioToCreate['tipoViaggio'] = $data['tipoViaggio'];
        $viaggioToCreate['luogoPartenza'] = $data['luogoPartenza'];
        $viaggioToCreate['luogoDestinazione'] = $data['luogoDestinazione'];
        $viaggioToCreate['costoViaggio'] = $data['costoViaggio'];
        $viaggioToCreate['dataInizioViaggio'] = date('Y-m-d', strtotime($data['dataInizioViaggio']));
        $viaggioToCreate['dataFineViaggio'] = date('Y-m-d', strtotime($data['dataFineViaggio']));

        if($viaggio->create($viaggioToCreate)) {
            http_response_code(201); // set response code - 201 created
            echo json_encode(array("message" => "Viaggio creato con successo."));
        } else{
            http_response_code(503); // set response code - 503 service unavailable -> creation error
            echo json_encode(array("message" => "Impossibile creare il viaggio."));
        }

    } else {
        http_response_code(400); // set response code - 400 bad request
        echo json_encode(array("message" => "Impossibile creare il viaggio. Parametri incompleti."));
    }
} catch (Exception $exception) {
    http_response_code(500); // set response code - 500  Internal Server Error -> connection error
    echo json_encode( array("message" => $exception->getMessage()) );
}
