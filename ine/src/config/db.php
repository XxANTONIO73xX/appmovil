<?php
class db {
    private $dbhost = 'localhost';
    private $dbuser = 'root';
    private $dbpass = 'spoonme876';
    private $dbname = 'cangurodb';

    public function connect() {
        $mysql_connect_str = "mysql:host=$this->dbhost;dbname=$this->dbname; charset=utf8";
        $dbConnection = new PDO($mysql_connect_str, $this->dbuser, $this->dbpass);
        $dbConnection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $dbConnection;
    }
    
}

?>