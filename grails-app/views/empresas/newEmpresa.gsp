<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/bootstrap/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/css/validacion.css">
		<script type="text/javascript" src="${request.contextPath}/js/jquery-2.1.3.js"></script>
		<script type="text/javascript" src="${request.contextPath}/bootstrap/js/bootstrap.js"></script>
		<link rel="icon" type="image/png" href="http://developers.mercadolibre.com/wp-content/uploads/logo_puzzle_slider.png" />
		<title>Crear Empresa</title>
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
				<p style = "font-size: 30px">Crear Nueva Empresa</p>
			</div>
	    </div>
			
			<div class="container marketing">
		     	<div class="row featurette" align="center">		          		
		          	<g:form method="post" controller="Empresas" action="agregarEmpresa">
                        <h2 class="featurette-heading">Nombre:</h2>
                        <input type="text" pattern="[A-Za-z0-9]+" name="nombreEmp" />
                        <h2 class="featurette-heading">Mail Admin:</h2>
                        <input type="email" name="mailEmp" />
                        
                        <br>
                        <br>
                       <button class="btn btn-primary btn-lg"><a style="color: white">Agregar Empresa</a> </button> 

                    </g:form>
                    
                    <g:if test="${flash.message=='error'}">
						<h3 style="text-align:center; color: #000;" class="lead"><span class="label label-danger" >Ya hay un empresa registrada con ese nombre.</span></h3>
					</g:if>
					<g:if test="${flash.message=='success'}">
						<h3 style="text-align:center; color: #000;" class="lead"><span class="label label-success" >Empresa registrado correctamente.</span></h3>
					</g:if>
		          		
		         </div>  
		 
		    </div>
	      <hr class="featurette-divider">
		
	</body>
</html>