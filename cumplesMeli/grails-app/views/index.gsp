<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/bootstrap/css/bootstrap.css">

		<script type="text/javascript" src="${request.contextPath}/js/jquery-2.1.3.js"></script>
		<script type="text/javascript" src="${request.contextPath}/bootstrap/js/bootstrap.js"></script>
		<title>Cumples MELI</title>
	</head>
	<body>
		<div style = "text-align: center" class="jumbotron">
		<p style = "font-size: 30px">Cumpleaños de los Empleados</p>
		<g:actionSubmit class="btn btn-primary btn-lg" value="${message(code:'Crear Empleado')}" action="crearEmpleado"/>
		</div>
	</body>
</html>