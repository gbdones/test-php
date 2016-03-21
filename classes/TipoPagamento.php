<?php
require_once 'crud.php';

class TipoPagamento extends Crud
{
	protected $table = 'TipoPagamento';
	private $TipoPagamentoDesc; 

	public function setTipoPagamentoDesc($TipoPagamentoDesc)
	{
		$this->TipoPagamentoDesc = $TipoPagamentoDesc;
	}

	public function insert()
	{
		$sql = "INSERT INTO $this->table (TipoPagamentoDesc) VALUES (:TipoPagamentoDesc)";
		$stmt = DB::prepare($sql);
		$stmt->bindParam(':TipoPagamentoDesc',$this->TipoPagamentoDesc);
		return $stmt->execute();
	}

	public function update($id)
	{
		$sql = "UPDATE $this->table SET TipoPagamentoDesc = :TipoPagamentoDesc WHERE idtipopagamento = :id";
		$stmt = DB::prepare($sql);
		$stmt->bindParam(':TipoPagamentoDesc', $this->TipoPagamentoDesc);
		$stmt->bindParam(':id', $id);
		return $stmt->execute();
	}

}


?>