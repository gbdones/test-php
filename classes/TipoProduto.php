<?php
require_once 'crud.php';

class TipoProduto extends Crud
{
	protected $table = 'TipoProduto';
	private $Descricao; 

	public function setDescricao($Descricao)
	{
		$this->Descricao = $Descricao;
	}

	public function insert()
	{
		$sql = "INSERT INTO $this->table (Descricao) VALUES (:Descricao)";
		$stmt = DB::prepare($sql);
		$stmt->bindParam(':Descricao',$this->Descricao);
		return $stmt->execute();
	}

	public function update($id)
	{
		$sql = "UPDATE $this->table SET Descricao = :Descricao WHERE idtipoproduto = :id";
		$stmt = DB::prepare($sql);
		$stmt->bindParam(':Descricao', $this->Descricao);
		$stmt->bindParam(':id', $id);
		return $stmt->execute();
	}

}


?>