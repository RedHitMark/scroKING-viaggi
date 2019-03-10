<?php
/**
 * Created by PhpStorm.
 * User: Marco Russodivito
 * Date: 28-Feb-19
 * Time: 21:49
 */

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json;");
header("Access-Control-Allow-Methods: DELETE");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, Authorization");

// include database and object files
include_once '../models/Cliente.php';

try {
    // instantiate viaggio
    $cliente = new Cliente();

    $data = array();
    parse_str($_SERVER['QUERY_STRING'], $data);

    //set ID property of record to read
    $codFiscale = isset($data['codFiscale']) ? $data['codFiscale'] : die();

    if ($cliente->delete($codFiscale)) {
        http_response_code(200); // set response code - 200 ok
        echo json_encode(array("message" => "Cliente eliminato con successo."));
    } else {
        http_response_code(503); // set response code - 503 service unavailable
        echo json_encode(array("message" => "Eliminazione non eseguibile."));
    }
} catch (Exception $exception) {
    http_response_code(500); // set response code - 500  Internal Server Error -> connection error
    echo json_encode( array("message" => $exception->getMessage()) );
}
