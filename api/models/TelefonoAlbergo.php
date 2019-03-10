<?php
/**
 * Created by PhpStorm.
 * User: Marco Russodivito
 * Date: 15-Feb-19
 * Time: 19:13
 */

include_once '../config/Database.php';
class TelefonoAlbergo {
    //db connection
    private $connection;

    /**
     * TelefonoAlbergo constructor.
     * Open the connection to the DataBase
     */
    public function __construct(){
        $this->connection = new Database();
    }

    /**
     * TelefonoAlbergo destuctor
     * Closes the connection to the d
     */
    public function __destruct(){
        Database::closeConnection($this->connection);
    }


    /**
     * @return array|bool : an array with viaggi of false if any
     * @throws Exception : in case something went wrong
     */
    function read(){
        $query = 'CALL getTelefoniAlberghi()';

        return $this->connection->runSelectQuery($query, null);
    }
}
