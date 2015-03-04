<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/bootstrap/css/bootstrap.css">

		<script type="text/javascript" src="${request.contextPath}/js/jquery-2.1.3.js"></script>
		<script type="text/javascript" src="${request.contextPath}/bootstrap/js/bootstrap.js"></script>
		<link rel="icon" type="image/png" href="http://developers.mercadolibre.com/wp-content/uploads/logo_puzzle_slider.png" />
		<title>Cumples MELI</title>
	</head>
	<body>
	    <nav class="navbar navbar-default">
	      <div class="container">
	        <div id="navbar" class="navbar-collapse collapse">
	          <ul class="nav navbar-nav navbar-right">
	            <li class="active"><a href="./crearEmpleado">Crear Empleado <span class="sr-only">(current)</span></a></li>
	          </ul>
	        </div><!--/.nav-collapse -->
	      </div>
	    </nav>
		<div class="container">
			<div style = "text-align: center" class="jumbotron">
				<p style = "font-size: 30px">Cumpleaños de los Empleados</p>
				<!-- <g:actionSubmit class="btn btn-primary btn-lg" value="${message(code:'Crear Empleado')}" action="crearEmpleado"/> -->
			</div>
	    </div>
		<div class="container marketing">	
				<g:each in="${listaEmpleados}" var="empleado">
					<hr class="featurette-divider">
			      	<div class="row featurette">
			        	<div class="col-md-7">
			          		<h2 class="featurette-heading">${empleado.nombre} ${empleado.apellido} ${empleado.fechaNacimiento} <span class="text-muted">Regalo</span></h2>
			          		<p class="lead">Ver de poner descripcion.</p>
			        	</div>
			       		<div class="col-md-5">	
			          		<img class="featurette-image img-responsive" data-src="holder.js/500x500/auto" 	alt="Generic placeholder image">
			        	</div>
			        </div>
			    </g:each>
	      
	      <hr class="featurette-divider">
	    </div>
	</body>
</html>