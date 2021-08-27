<?php
require_once('connection.php');

class balance extends connection{

    function updateBalance(){
	   
		
			$this->connection->beginTransaction();
		    $this->connection->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);

		try{
			
			$stmt=$this->connection->prepare("SELECT bal FROM `balance` ORDER by id DESC LIMIT 1 FOR UPDATE");
			$stmt->execute();
			$bal=(integer) $stmt->fetchColumn()+1;
			$stmt->closeCursor();


            $stmt2=$this->connection->prepare("INSERT INTO `balance` (`bal`) VALUE (?)");
			$stmt2->execute([$bal]);
			$stmt2->closeCursor();

            $this->connection->commit();
		}catch(PDOException $e){


			$this->connection->rollBack();
			echo $e->getMessage();
			
		}

	}


}

$Balance = new balance();
$Balance->updateBalance();