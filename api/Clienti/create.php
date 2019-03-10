<?php
/**
 * Created by PhpStorm.
 * User: Marco Russodivito
 * Date: 28-Feb-19
 * Time: 21:32
 */

// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// include database and object files
include_once '../models/Cliente.php';

try {
    // instantiate viaggio
    $cliente = new Cliente();

    // get data from post
    $data = json_decode(file_get_contents("php://input"), true);

    if( isset($data['codFiscale']) && isset($data['nomeCliente']) && isset($data['cognomeCliente']) && isset($data['sesso']) && isset($data['telefono']) && isset($data['indirizzo']) ) {
        $clienteToCreate['codFiscale'] = $data['codFiscale'];
        $clienteToCreate['nomeCliente'] = $data['nomeCliente'];
        $clienteToCreate['cognomeCliente'] = $data['cognomeCliente'];
        $clienteToCreate['sesso'] = $data['sesso'];
        $clienteToCreate['telefono'] = $data['telefono'];
        $clienteToCreate['indirizzo'] = $data['indirizzo'];
        if($cliente->create($clienteToCreate)) {
            http_response_code(201); // set response code - 201 created
            echo json_encode(array("message" => "Cliente creato con successo."));
        } else{
            http_response_code(503); // set response code - 503 service unavailable -> creation error
            echo json_encode(array("message" => "Impossibile creare il cliente."));
        }

    } else {
        http_response_code(400); // set response code - 400 bad request
        echo json_encode(array("message" => "Impossibile creare il cliente. Parametri incompleti."));
    }
} catch (Exception $exception) {
    http_response_code(500); // set response code - 500  Internal Server Error -> connection error
    echo json_encode( array("message" => $exception->getMessage()) );
}
