<?php
/**
 * Created by PhpStorm.
 * User: Marco Russodivito
 * Date: 15-Feb-19
 * Time: 13:47
 */

// required headers
header("Access-Control-Allow-Origin: *", TRUE);
header("Content-Type: application/json");
header("Access-Control-Allow-Methods: GET");

// include database and object files

include_once '../models/Dipendente.php';

$dipendente = null;
try {
    // instantiate viaggio
    $dipendente = new Dipendente();

    // query products
    if ($dipendenti = $dipendente->read() ) {
        // set response code - 200 OK -> echo the data in json format
        http_response_code(200);
        echo json_encode($dipendenti);
    } else {
        // set response code - 404 Not found -> no viaggi found
        http_response_code(404);
        echo json_encode( array("message" => "Nessun dipendente trovato.") );
    }
} catch (Exception $exception) {
    // set response code - 500  Internal Server Error -> connection error
    http_response_code(500);
    echo json_encode( array("message" => $exception->getMessage()) );
}
