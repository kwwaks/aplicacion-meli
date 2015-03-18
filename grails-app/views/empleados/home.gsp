<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/bootstrap/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/css/validacion.css">
		<script type="text/javascript" src="${request.contextPath}/js/jquery-2.1.3.js"></script>
		<script type="text/javascript" src="${request.contextPath}/bootstrap/js/bootstrap.js"></script>
		<title>Empresas</title>
	</head>


	<body>
		<nav class="navbar navbar-default">
			<div class="container">
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<sec:ifLoggedIn>
							<li><a href="/cumplesMeli/j_spring_security_logout">Desloguearme!<span class="sr-only">(current)</span></a></li>
	            		</sec:ifLoggedIn>
	            
	            		<sec:ifNotLoggedIn>
	            			<li><a href="/cumplesMeli/login/auth">Loguearme!<span class="sr-only">(current)</span></a></li>
	            		</sec:ifNotLoggedIn>
	          		</ul>
				</div>
			</div>
		</nav>
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