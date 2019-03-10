<?php
/**
 * Created by PhpStorm.
 * User: russo
 * Date: 2/5/2019
 * Time: 5:58 PM
 */

// required headers
header("Access-Control-Allow-Origin: *", TRUE);
header("Content-Type: application/json");
header("Access-Control-Allow-Methods: GET");

// include database and object files

include_once '../models/Albergo.php';

$albergo = null;
try {
    // instantiate viaggio
    $albergo = new Albergo();

    // query products
    if ($alberghi = $albergo->read() ) {
        // set response code - 200 OK -> echo the data in json format
        http_response_code(200);
        echo json_encode($alberghi);
    } else {
        // set response code - 404 Not found -> no viaggi found
        http_response_code(404);
        echo json_encode( array("message" => "Nessun albergo trovato.") );
    }
} catch (Exception $exception) {
    // set response code - 500  Internal Server Error -> connection error
    http_response_code(500);
    echo json_encode( array("message" => $exception->getMessage()) );
}
