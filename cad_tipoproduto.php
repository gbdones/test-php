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
   <title>TESTE PHP OO</title>
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

	<div class="container">

		<?php
	
		$TipoProduto = new TipoProduto();

		#validacao para verificar se existe post para cadastrar
		if(isset($_POST['cadastrar'])):

			$Descricao = $_POST['Descricao'];

			$TipoProduto->setDescricao($Descricao);

			#validacao para verificar se name existe ou nao
			#if($name == '')
			#{
			#	echo 'Digite um name!';
			#}
			#endif;

			# Insert
			if($TipoProduto->insert()){
				echo "Inserido com sucesso!";
			}

		endif;

		?>
		<header class="masthead">
			<h1 class="muted">TESTE PHP OO</h1>
			<nav class="navbar">
				<div class="navbar-inner">
					<div class="container">
						<ul class="nav">
							<li class="active"><a href="cad_tipoproduto.php">Página de Cadastro do Tipo de Produto</a></li>
						</ul>
					</div>
				</div>
			</nav>
		</header>

		<?php 
		if(isset($_POST['atualizar'])):

			$id = $_POST['id'];
			$Descricao = $_POST['Descricao'];

			$TipoProduto->setDescricao($Descricao);

			if($TipoProduto->update($id)){
				echo "Atualizado com sucesso!";
			}

		endif;
		?>

		<?php
		if(isset($_GET['acao']) && $_GET['acao'] == 'deletar'):

			$id = (int)$_GET['id'];
			if($TipoProduto->delete($id)){
				echo "Deletado com sucesso!";
			}

		endif;
		?>

		<?php
		if(isset($_GET['acao']) && $_GET['acao'] == 'editar'){

			$id = (int)$_GET['id'];
			$resultado = $TipoProduto->find($id);
		?>

		<form method="post" action="">
			<div class="input-prepend">
				
				<input type="text" name="Descricao" value="<?php echo $resultado->descricao; ?>" placeholder="Descrição:" />
			</div>
			<input type="hidden" name="id" value="<?php echo $resultado->idtipoproduto; ?>">
			<br />
			<input Type="button" Value="Página Inicial" class="btn btn-primary" Onclick="window.location.href='index.php'">	
			<input type="submit" name="atualizar" class="btn btn-primary" value="Atualizar dados">					
		</form>

		<?php }else{ ?>


		<form method="post" action="">
			<div class="input-prepend">
				
				<input type="text" name="Descricao" placeholder="Descrição:" />
			</div>
			<br />
			<input Type="button" Value="Página Inicial" class="btn btn-primary" Onclick="window.location.href='index.php'">	
			<input type="submit" name="cadastrar" class="btn btn-primary" value="Cadastrar dados">					
		</form>

		<?php } ?>

		<table class="table table-hover">
			
			<thead>
				<tr>
					<th>#</th>
					<th>Descrição:</th>
					<th>Ações:</th>
				</tr>
			</thead>
			
			<?php foreach($TipoProduto->findAll() as $key => $value):?>

			<tbody>
				<tr>
					<td><?php echo $value->idtipoproduto; ?></td>
					<td><?php echo $value->descricao; ?></td>
					<td>
						<?php echo "<a href='cad_tipoproduto.php?acao=editar&id=" . $value->idtipoproduto . "'>Editar</a>"; ?>
						<?php echo "<a href='cad_tipoproduto.php?acao=deletar&id=" . $value->idtipoproduto . "' onclick='return confirm(\"Deseja realmente deletar?\")'>Deletar</a>"; ?>
					</td>
				</tr>
			</tbody>

			<?php endforeach; ?>

		</table>

	</div>

<script src="js/jQuery.js"></script>
<script src="js/bootstrap.js"></script>
</body>
</html>