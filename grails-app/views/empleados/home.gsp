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
	    
	    <center>
	    	<g:select name="empresaID" id="optionSelect" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false" from="${listaEmpresas}" optionValue= "nombre" optionKey="nombre"/>
	    	<input type="button" id="btnHome" class="btn btn-default" value="Ingresar al sistema" >  
		</center>
		
		<script type="text/javascript">
		$("#btnHome").click(redirigir);
		function redirigir(){
				var empresa = $("#optionSelect").val();
				var url = "/cumplesMeli/cumples-de-hoy/"+empresa;
				$(location).attr("href", url);
			}
		</script>
	</body>
</html>