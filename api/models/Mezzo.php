<?php
/**
 * Created by PhpStorm.
 * User: stefano
 * Date: 2019-02-10
 * Time: 11:39
 */

include_once '../config/Database.php';

class Mezzo {
    //db connection
    private $connection;

    //object fields
    public $codMezzo;
    public $descrizioneMezzo;
    public $capienzaMezzo;
    public $viaggio;
    public $costoAffitto;
    public $dataInizioAffitto;
    public $dataFineAffitto;

    /**
     * Mezzo constructor.
     * Open the connection to the DataBase
     */
    public function __construct(){
        $this->connection = new Database();
    }

    /**
     * Mezzo destuctor
     * Closes the connection to the d
     */
    public function __destruct(){
        Database::closeConnection($this->connection);
    }


    /**
     * @return array|bool
     * @throws Exception
     */
    function read(){
        $query = "CALL getMezzi()";

        // prepare query statement, execute and return
        return $this->connection->runSelectQuery($query, null);
    }

    /**
     * @return bool: true if creation happened otherwise false
     */

    function create(){
        //query to insert Mezzo
        $query = "CALL insertMezzo(
            :codMezzo,
            :descrizioneMezzo,
            :capienzaMezzo,
            :viaggio,
            :costoAffitto,
            :dataInizioAffitto,
            :dataFineAffitto
        );";

        //prepare query
        $stmt = $this->connection->prepare($query);

        //sanitize
        $this->codMezzo = htmlspecialchars(strip_tags($this->codMezzo));
        $this->descrizioneMezzo = htmlspecialchars($this->descrizioneMezzo);
        $this->capienzaMezzo =htmlspecialchars(strip_tags($this->capienzaMezzo));
        $this->viaggio = htmlspecialchars(strip_tags($this->viaggio));
        $this->costoAffitto = htmlspecialchars(strip_tags($this->costoAffitto));
        $this->dataInizioAffitto = htmlspecialchars(strip_tags($this->dataInizioAffitto));
        $this->dataFineAffitto = htmlspecialchars(strip_tags($this->dataFineAffitto));

        //bind values

        $stmt->bindParam("codMezzo",$this->codMezzo);
        $stmt->bindParam("descrizioneMezzo",$this->descrizioneMezzo);
        $stmt->bindParam("capienzaMezzo",$this->capienzaMezzo);
        $stmt->bindParam("viaggio",$this->viaggio);
        $stmt->bindParam("costoAffitto",$this->costoAffitto);
        $stmt->bindParam("dataInizioAffitto",$this->dataInizioAffitto);
        $stmt->bindParam("dataFineAffitto",$this->dataFineAffitto);

        if($stmt->execute() ){
            return true;
        }
            return false;
    }

    public function readOne(){
        $query = "CALL getMezzo(:codMezzo)";

        //prepare query
        $stmt = $this->connection->prepare($query);

        //bind codMezzo
        $stmt->bindParam("codMezzo",$this->codMezzo);

        //execute query
        $stmt->execute();

        // get retrieved row
        $row = $stmt->fetch(PDO::FETCH_ASSOC);

        // set values to object properties
        $this->codMezzo = $row["codMezzo"];
        $this->descrizioneMezzo =  $row["descrizioneMezzo"];
        $this->capienzaMezzo =  $row["capienzaMezzo"];
        $this->viaggio =  $row["viaggio"];
        $this->costoAffitto =  $row["costoAffitto"];
        $this->dataInizioAffitto =  $row["dataInizioAffitto"];
        $this->dataFineAffitto =  $row["dataFineAffitto"];
    }


}
