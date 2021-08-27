<?php

class connection{

   private $host="127.0.0.1";
   private $dbName="test";
   private $dbUser="root";
   private $dbPassword="";
   protected $connection;

   function __construct(){

     try{
          $this->connection = new PDO("mysql:host=$this->host;dbname=$this->dbName",$this->dbUser,$this->dbPassword);
          $this->connection->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
          return $this->connection;
          
     }catch(PDOException $e){
          echo $e->getMessage();
     }

   }
    
}