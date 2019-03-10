<?php
/**
 * Created by PhpStorm.
 * User: stefano
 * Date: 2019-02-06
 * Time: 06:48
 */

include_once '../config/Database.php';

class Albergo {
    //DB connection
    private $connection;

    //Object fields
    public $codAlbergho;
    public $denominazione;
    public $stanzeDisponibili;
    public $numeri;

    /**
     * Albergo constructor.
     * Open the connection to the DataBase
     */
    public function __construct(){
        $this->connection = new Database();
    }

    /**
     * Albergo destuctor
     * Closes the connection to the d
     */
    public function __destruct(){
        Database::closeConnection($this->connection);
    }


    /**
     * @return array|bool
     * @throws Exception
     */
    function read() {
        $query = "CALL getAlberghi();";

        return $this->connection->runSelectQuery($query, null);
    }

    //@TODO redOne on the DB
    /**
     * @return bool: true if creation happined otherwise false
     */
    function create(){
        //Query to insert Albergo
        $query = "CALL insertAlbergo(
           :codAlbergho
           :denominazione
           :stanzeDisponibili
           );";



        //Prepare query
        $stmt = $this->connection->prepare($query);

        $this->codAlbergho = htmlspecialchars(strip_tags($this->codAlbergho));
        $this->denominazione = htmlspecialchars(strip_tags($this->denominazione));
        $this->stanzeDisponibili = htmlspecialchars(strip_tags($this->stanzeDisponibili));
        $this->numeri = htmlspecialchars(strip_tags($this->numeri));



        //Bind Values
        $stmt->bindParam(":codAlbergo", $this->codAlbergho);
        $stmt->bindParam(":denominazione", $this->denominazione);
        $stmt->bindParam(":stanzeDisponibili", $this->stanzeDisponibili);

        if (!$stmt->execute()){
            return false;
        }

        $recapiti = explode(", ", $this->numeri);
        $query1 = "insertTelefono(:numero,:codAlbergo);";

        for($i=0; $i<count($recapiti); $i++){
            $stmt1 = $this->connection->prepare($query1);

            $stmt1->bindParam(":numero", $recapiti[$i]);
            $stmt1->bindParam(":codAlbergo",$this->codAlbergho);
            if(!$stmt->execute()) {
                return false;
            }
            $stmt1->closeCursor();
        }

        return true;
    }
}
