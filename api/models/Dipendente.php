<?php
/**
 * Created by PhpStorm.
 * User: Marco Russodivito
 * Date: 15-Feb-19
 * Time: 13:44
 */

include_once '../config/Database.php';

class Dipendente {
    //DB connection
    private $connection;

    /**
     * Dipendente constructor.
     * Open the connection to the DataBase
     */
    public function __construct(){
        $this->connection = new Database();
    }

    /**
     * Dipendente destuctor
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
        $query = "CALL getDipendenti()";

        return $this->connection->runSelectQuery($query, null);
    }

}
