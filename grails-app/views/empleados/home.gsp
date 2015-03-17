<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/bootstrap/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/css/validacion.css">
		<script type="text/javascript" src="${request.contextPath}/js/jquery-2.1.3.js"></script>
		<script type="text/javascript" src="${request.contextPath}/bootstrap/js/bootstrap.js"></script>
		<title>Empresas</title>
	</head>


	<body>
	
	
	<div class="container">
			<div style = "text-align: center" class="jumbotron">
				<p style = "font-size: 30px">Empresas</p>
			</div>
	    </div>

		<center><g:form method="post" controller="Empleados" action="sessionEmpresa">
			<g:select name="empresaID" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false" from="${listaEmpresas}" optionValue= "nombre"  optionKey="id"/>
			<input type="submit" class="btn btn-default" value="Ingresar al sistema">  
		</center></g:form>
	</body>
</html>