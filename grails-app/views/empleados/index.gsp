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
	            <li ><a href="/cumplesMeli/empleados/buscarEmpleado">Buscar Empleado <span class="sr-only">(current)</span></a></li>
	            <li class="active"><a href="/cumplesMeli/empleados/crearEmpleado">Crear Empleado <span class="sr-only">(current)</span></a></li>
	          </ul>
	        </div><!--/.nav-collapse -->
	      </div>
	    </nav>
		<div class="container">
			<div style = "text-align: center" class="jumbotron">
				<p style = "font-size: 30px">Cumpleaños del Dia</p>
				<p id="fechaDeHoy" style = "font-size: 30px" ></p>
				<script>
				//para ver la fecha facil en el home. Habria que mostrarla mas linda <------
				var d = new Date();
				var month = d.getMonth()+1;
				var day = d.getDate();
				$("#fechaDeHoy").html(day + "/" + month);</script>
			</div>
	    </div>
		<div class="container marketing" style="width: 60%">	
				<g:each in="${infoRegalos}" var="empleado">
					<hr class="featurette-divider">
			      	<div class="row featurette">	          		 
			          	

			          		 <g:if test="${empleado.regalo == null}">
			          		 	<div class="col-md-7">
			          				<h2 class="featurette-heading">${empleado.nombre} ${empleado.apellido} ${empleado.fechaCumpleanios}</h2>
			          				<a class="btn btn-primary btn-lg" style="color: white"href="/cumplesMeli/empleados/regalo/${empleado.id}">Agregar Regalo</a>
			          			</div>
							</g:if>
			          		<g:else>
			          		<!-- hay parte del if y del else repetida que se puede poner afuera-->
			          	       	<div class="col-md-7">
			          				<h2 class="featurette-heading">${empleado.nombre} ${empleado.apellido} ${empleado.fechaCumpleanios}</h2>
			          				<h2 class="featurette-heading"><span class="text-muted">${empleado.regalo.tituloProducto}</span></h2>
			          				<a class="btn btn-primary btn-lg" style="color: white" href="/cumplesMeli/empleados/regalo/${empleado.id}">Cambiar Regalo</a>
			        			</div>
			          			<div class="col-md-5">	
			          				<img class="featurette-image img-responsive" src="${empleado.regalo.urlFotoProducto}" width="300" alt="Generic placeholder image">
			        			</div>
							</g:else>

			        </div>
			    </g:each>
	      <hr class="featurette-divider">
	    </div>
	</body>
</html>