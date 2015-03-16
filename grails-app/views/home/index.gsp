<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/bootstrap/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/css/validacion.css">
		<script type="text/javascript" src="${request.contextPath}/js/jquery-2.1.3.js"></script>
		<script type="text/javascript" src="${request.contextPath}/bootstrap/js/bootstrap.js"></script>
		<title>Empresas</title>
	</head>


	<body>
		<h1>Empresas</h1>
		<g:form method="post" controller="Empleados">
			<g:select name="empresaID" class="btn btn-default" from="${listaEmpresas}" optionValue= "nombre"  optionKey="id"/>
			<input type="submit" value="Ingresar al sistema">  
		</g:form>
	</body>
</html>