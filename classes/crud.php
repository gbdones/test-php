<?php
require_once 'DB.php';

abstract class Crud extends DB
{
	protected $table;

	abstract public function insert ();
	abstract public function update($id);


	public function find($id)
	{
		if ($this->table=="TipoProduto")
	{
		$sql = "SELECT * FROM $this->table WHERE idTipoProduto = :id";
		$stmt = DB::prepare($sql);
		$stmt->bindParam(':id', $id, PDO::PARAM_INT);
		$stmt->execute();
		return $stmt->fetch();
	} 
		
	elseif ($this->table == "TipoResponsavel") 
	{
		$sql = "SELECT * FROM $this->table WHERE idTipoResponsavel = :id";
		$stmt = DB::prepare($sql);
		$stmt->bindParam(':id', $id, PDO::PARAM_INT);
		$stmt->execute();
		return $stmt->fetch();
	}
	
	elseif ($this->table == "TipoPagamento") 
	{
		$sql = "SELECT * FROM $this->table WHERE idTipoPagamento = :id";
		$stmt = DB::prepare($sql);
		$stmt->bindParam(':id', $id, PDO::PARAM_INT);
		$stmt->execute();
		return $stmt->fetch();
	}


	}

	public function findAll()
	{
		$sql = "SELECT * FROM $this->table";
		$stmt = DB::prepare($sql);
		$stmt->execute();
		return $stmt->fetchAll();
				

	}

	public function delete($id)
	{
		if ($this->table == "TipoProduto") 
		{
		$sql = "DELETE FROM $this->table WHERE idTipoProduto = :id";
		$stmt = DB::prepare($sql);
		$stmt->bindParam(':id', $id, PDO::PARAM_INT);
		$stmt->execute();
		return $stmt->fetch();
		}
		
		elseif ($this->table == "TipoResponsavel")
		{
		$sql = "DELETE FROM $this->table WHERE idTipoResponsavel = :id";
		$stmt = DB::prepare($sql);
		$stmt->bindParam(':id', $id, PDO::PARAM_INT);
		$stmt->execute();
		return $stmt->fetch();
		}

		elseif ($this->table == "TipoPagamento")
		{
		$sql = "DELETE FROM $this->table WHERE idTipoPagamento = :id";
		$stmt = DB::prepare($sql);
		$stmt->bindParam(':id', $id, PDO::PARAM_INT);
		$stmt->execute();
		return $stmt->fetch();
		}

	}
}

?>