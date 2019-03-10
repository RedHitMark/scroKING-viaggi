<?php
/**
 * Created by PhpStorm.
 * User: Marco Russodivito
 * Date: 15-Feb-19
 * Time: 19:37
 */

include_once '../config/Database.php';
class Soggiorno {
    //DB connection
    private $connection;

    /**
     * Soggiorno constructor.
     * Open the connection to the DataBase
     */
    public function __construct(){
        $this->connection = new Database();
    }

    /**
     * Soggiorno destuctor
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
        $query = 'CALL getSoggiorni()';

        return $this->connection->runSelectQuery($query, null);
    }
}
