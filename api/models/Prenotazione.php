<?php
/**
 * Created by PhpStorm.
 * User: Marco Russodivito
 * Date: 11-Feb-19
 * Time: 00:16
 */

include_once '../config/Database.php';

class Prenotazione {
    //DB connection
    private $connection;

    public $cliente;
    public $viaggio;
    public $pSconto;
    public $dataPrenotazione;

    /**
     * Prenotazione constructor.
     * Open the connection to the DataBase
     */
    public function __construct(){
        $this->connection = new Database();
    }

    /**
     * Prenotazione destuctor
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
        $query = 'CALL getPrenotazioni()';

        return $this->connection->runSelectQuery($query, null);
    }
}
