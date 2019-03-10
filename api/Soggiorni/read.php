<?php
/**
 * Created by PhpStorm.
 * User: Marco Russodivito
 * Date: 15-Feb-19
 * Time: 19:39
 */

// required headers
header("Access-Control-Allow-Origin: *", TRUE);
header("Content-Type: application/json");
header("Access-Control-Allow-Methods: GET");

// include object files
include_once '../models/Soggiorno.php';

$soggiorno = null;
try {
    // instantiate viaggio
    $soggiorno = new Soggiorno();

    // query products
    if ($soggiorni = $soggiorno->read() ) {
        // set response code - 200 OK -> echo the data in json format
        http_response_code(200);
        echo json_encode($soggiorni);
    } else {
        // set response code - 404 Not found -> no viaggi found
        http_response_code(404);
        echo json_encode( array("message" => "Nessun soggiorno trovato.") );
    }
} catch (Exception $exception) {
    // set response code - 500  Internal Server Error -> connection error
    http_response_code(500);
    echo json_encode( array("message" => $exception->getMessage()) );
}
