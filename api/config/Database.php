<?php
/**
 * Created by PhpStorm.
 * User: Marco Russodivito
 * Date: 11-Feb-19
 * Time: 17:45
 */

class Database extends PDO {
    //database credentials @todo make them private and secure
    const HOST = "localhost";
    const DB_NAME = "scroKING";
    const USERNAME = "marco";
    const PASSWORD = "marcodb";

    /**
     * Database constructor.
     */
    public function __construct() {
        try {
            parent::__construct("mysql:host=" . Database::HOST . ";dbname=" . Database::DB_NAME, Database::USERNAME, Database::PASSWORD);
            $this->setAttribute( PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION );
        } catch(PDOException $exception){
            throw $exception;
        }
    }

    /**
     * @param $query : the query to execute
     * @param $params : the parameters to bind
     * @return array|bool : an array with the result of the query or FALSE if no result
     * @throws Exception : in case something went wrong
     */
    public function runSelectQuery($query, $params) {
        try {
            $executedStatement = $this->executeQuery($query, $params);

            if($executedStatement->rowCount() != 0) {
                if($executedStatement->rowCount() == 1) {
                    return $executedStatement->fetch(self::FETCH_ASSOC);
                } else {
                    //fetch all result and push in an array
                    $resultSet = array();
                    while ($row = $executedStatement->fetch(self::FETCH_ASSOC)) {
                        array_push($resultSet, $row);
                    }

                    //return the result set
                    return $resultSet;
                }
            } else {
                return false;
            }
        } catch ( Exception $e) {
            throw new Exception($e->getMessage());
        }
    }


    /**
     * @param $query : the query to execute
     * @param $params : the parameters to bind
     * @return bool : true if insert, false otherwise
     * @throws Exception : in case something went wrong
     */
    public function runInsertQuery($query, $params) {
        try {
            $executedStatement = $this->executeQuery($query, $params);

            if($executedStatement->rowCount() == 1) {
                return true;
            } else {
                return false;
            }
        } catch ( Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    /**
     * @param $query : the query to execute
     * @param $params : the parameters to bind
     * @return bool : true if update, false otherwise
     * @throws Exception : in case something went wrong
     */
    public function runUpdateQuery($query, $params) {
        try {
            $executedStatement = $this->executeQuery($query, $params);

            if($executedStatement->rowCount() == 1) {
                return true;
            } else {
                return false;
            }
        } catch ( Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    /**
     * @param $query : the query to execute
     * @param $params : the parameters to bind
     * @return bool : true if delete, false otherwise
     * @throws Exception : in case something went wrong
     */
    public function runDeleteQuery($query, $params) {
        try {
            $executedStatement = $this->executeQuery($query, $params);

            if($executedStatement->rowCount() == 1) {
                return true;
            } else {
                return false;
            }
        } catch ( Exception $e) {
            throw new Exception($e->getMessage());
        }
    }

    /**
     * @param $query : the query to execute
     * @param $params : the parameters to bind
     * @return PDOStatement : statement executed
     * @throws Exception :  in case something went wrong
     */
    private function executeQuery($query, $params) {
        try {
            //prepare the query
            $stmn = $this->prepare($query);
            if($stmn) {
                if(isset($params) ) {
                    //sanitaries all prams in case any
                    filter_var_array($params, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
                }
                //execute the query with the sanitised params
                if( $stmn->execute($params)) {
                    return $stmn;
                } else {
                    throw new Exception("The database server cannot execute the statement");
                }
            } else {
                throw new Exception("The database server cannot prepare the statement");
            }
        } catch ( Exception $e) {
            throw new Exception($e->getMessage());
        }
    }


    /**
     * Close the connection to database
     * @param $connection : pointer of the DataBase's connection to close
     */
    static function closeConnection(&$connection) {
        $connection = null;
    }
}
