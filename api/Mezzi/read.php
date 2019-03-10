<?php
/**
 * Created by PhpStorm.
 * User: Marco Russodivito
 * Date: 14-Feb-19
 * Time: 21:13
 */
// required headers
header("Access-Control-Allow-Origin: *", TRUE);
header("Content-Type: application/json");
header("Access-Control-Allow-Methods: GET");

// include database and object files

include_once '../models/Mezzo.php';

$mezzo = null;
try {
    // instantiate viaggio
    $mezzo = new Mezzo();

    // query products
    if ($mezzi = $mezzo->read() ) {
        // set response code - 200 OK -> echo the data in json format
        http_response_code(200);
        echo json_encode($mezzi);
    } else {
        // set response code - 404 Not found -> no viaggi found
        http_response_code(404);
        echo json_encode( array("message" => "Nessun mezzo trovato.") );
    }
} catch (Exception $exception) {
    // set response code - 500  Internal Server Error -> connection error
    http_response_code(500);
    echo json_encode( array("message" => $exception->getMessage()) );
}
