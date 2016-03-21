<?php
require_once 'crud.php';

class TipoResponsavel extends Crud
{
	protected $table = 'TipoResponsavel';
	private $Nome; 

	public function setNome($Nome)
	{
		$this->Nome = $Nome;
	}

	public function insert()
	{
		$sql = "INSERT INTO $this->table (Nome) VALUES (:Nome)";
		$stmt = DB::prepare($sql);
		$stmt->bindParam(':Nome',$this->Nome);
		return $stmt->execute();
	}

	public function update($id)
	{
		$sql = "UPDATE $this->table SET Nome = :Nome WHERE idtiporesponsavel = :id";
		$stmt = DB::prepare($sql);
		$stmt->bindParam(':Nome', $this->Nome);
		$stmt->bindParam(':id', $id);
		return $stmt->execute();
	}

}


?>