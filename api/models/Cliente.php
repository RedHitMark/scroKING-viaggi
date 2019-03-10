<?php
/**
 * Created by PhpStorm.
 * User: Marco Russodivito
 * Date: 10-Feb-19
 * Time: 23:14
 */

include_once '../config/Database.php';

class Cliente {
    //DB connection
    private $connection;

    //Object fields
    public $codFiscale;
    public $nome;
    public $cognome;
    public $sesso;
    public $telefono;
    public $indirizzo;

    /**
     * Cliente constructor.
     * Open the connection to the DataBase
     */
    public function __construct(){
        $this->connection = new Database();
    }

    /**
     * Cliente destuctor
     * Closes the connection to the d
     */
    public function __destruct(){
        Database::closeConnection($this->connection);
    }

    /**
     * @return mixed: excute stament
     * @throws Exception
     */
    function read() {
        $query = "CALL getClienti()";

        return $this->connection->runSelectQuery($query, null);
    }

    /**
     * @param $clienteToCreate
     * @return bool
     * @throws Exception
     */
    public function create($clienteToCreate){
        $query = "CALL insertCliente(
            :codFiscale, 
            :nomeCliente, 
            :cognomeCliente, 
            :sesso,
            :telefono,
            :indirizzo)";

        return $this->connection->runInsertQuery($query, $clienteToCreate);
    }

    /**
     * @param $codFiscale
     * @return bool
     * @throws Exception
     */
    public function delete($codFiscale) {
        // query to delete viaggio
        $query = "CALL deleteCliente(
            :codFiscale
        );";

        return $this->connection->runDeleteQuery($query, array(':codFiscale' => $codFiscale));
    }
}
