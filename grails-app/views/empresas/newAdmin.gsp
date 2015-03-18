<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/bootstrap/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/css/validacion.css">
		<script type="text/javascript" src="${request.contextPath}/js/jquery-2.1.3.js"></script>
		<script type="text/javascript" src="${request.contextPath}/bootstrap/js/bootstrap.js"></script>
		<link rel="icon" type="image/png" href="http://developers.mercadolibre.com/wp-content/uploads/logo_puzzle_slider.png" />
		<title>Crear Administradores</title>
	</head>
	
	<body>
		<nav class="navbar navbar-default">
			<div class="container">
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
	            		<li class="active"><a href="/cumplesMeli/cumples-de-hoy/${session["empresa"].nombre}">Home<span class="sr-only">(current)</span></a></li>
	            	</ul>
				</div>
			</div>
		</nav>
		
		<div class="container">
			<div style = "text-align: center" class="jumbotron">
				<p style = "font-size: 30px">Crear Administrador</p>
			</div>
	    </div>
			
			<div class="container marketing">
		     	<div class="row featurette" align="center">		          		
		          	<g:form method="post" controller="Empresas" action="agregarAdmin">
                        <h2 class="featurette-heading">Usuario:</h2>
                        <input type="text" name="user" />
                        <h2 class="featurette-heading">Password:</h2>
                        <input type="password" name="pass" />
                        <h2 class="featurette-heading">Empresa: </h2>
                        <g:select name="empresaID" class="btn btn-default" from="${empresas}" optionValue="nombre" optionKey="id"/>
                      
                        <br>
                        <br>
                       <button class="btn btn-primary btn-lg"><a style="color: white">Agregar Administrador</a> </button> 

                    </g:form>
		          		<g:if test="${flash.message=='error'}">
		          			<h3 style="text-align:center; color: #000;" class="lead"><span class="label label-danger">Ya hay un administrador registrado con ese nombre de usuario.</span></h3>
		          		</g:if>
		          		
		          		<g:if test="${flash.message=='success'}">
		          			<h3 style="text-align:center; color: #000;" class="lead"><span class="label label-success">Administrador registrado correctamente.</span></h3>
		          		</g:if>
		         </div>  
		 
		    </div>
	      <hr class="featurette-divider">
		
	</body>
</html>