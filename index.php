<?php
	error_reporting(E_ALL);
	ini_set('display_errors', '1');
	
	function __autoload($class_name){
		require_once 'classes/' . $class_name . '.php';
	}
?>

<!DOCTYPE HTML>
<html land="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1" />
   <title>TESTE PHP_OO</title>
  <meta name="description" content="TESTE PHP_OO" />
  <meta name="robots" content="index, follow" />
   <meta name="author" content="Guaracy Dias"/>
   <link rel="stylesheet" href="css/bootstrap.css" />
  <link rel="stylesheet" />
  <!--[if lt IE 9]>
      <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
   <![endif]-->
</head>
<body>

  <h2>CADASTROS</h2>
  <p>Selecione qual tabela você quer popular:</p>
<div class="container">                                  
  <div class="dropdown">
    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"> Cadastros
    <span class="caret"></span></button>
    <ul class="dropdown-menu" >
      <li><a href="cad_tipoproduto.php">Tipo Produto</a></li>
      <li><a href="cad_tiporesponsavel.php">Tipo Responsável</a></li>
      <li><a href="cad_tipopagamento.php">Tipo Pagamento</a></li>
    </ul>
  </div>
</div>

<script src="js/jQuery.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>