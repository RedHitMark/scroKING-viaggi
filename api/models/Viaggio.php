<?php
/**
 * Created by PhpStorm.
 * User: russo
 * Date: 2/5/2019
 * Time: 5:56 PM
 */

include_once '../config/Database.php';
class Viaggio {
    //db connection
    private $connection;

    //object fields
    public $codViaggio;
    public $tipoViaggio;
    public $luogoPartenza;
    public $luogoDestinazione;
    public $costoViaggio;
    public $dataInizioViaggio;
    public $dataFineViaggio;

    /**
     * Viaggio constructor.
     * Open the connection to the DataBase
     */
    public function __construct(){
        $this->connection = new Database();
    }

    /**
     * Viaggio destuctor
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
        $query = 'CALL getViaggi()';

        return $this->connection->runSelectQuery($query, null);
    }

    /**
     * @param $viaggioToCreate : viaggio to create
     * @return bool: true if creation happened otherwise false
     * @throws Exception : in case something went wrong
     */
    function create($viaggioToCreate)
    {
        // query to insert viaggio
        $query = "CALL insertViaggio(
            :codViaggio, 
            :tipoViaggio, 
            :luogoPartenza, 
            :luogoDestinazione,
            :costoViaggio,
            :dataInizioViaggio, 
            :dataFineViaggio
        );";

        // execute query
        return $this->connection->runInsertQuery($query, $viaggioToCreate);
    }

    /**
     * @param $codViaggio : codViaggio to delete
     * @return bool: true if delete happened otherwise false
     * @throws Exception : in case something went wrong
     */
    function delete($codViaggio) {
        // query to delete viaggio
        $query = "CALL deleteViaggio(
            :codViaggio
        );";

        return $this->connection->runDeleteQuery($query, array(':codViaggio' => $codViaggio));
    }

}
