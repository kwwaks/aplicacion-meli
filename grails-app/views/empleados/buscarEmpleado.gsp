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
	            <li class="active"><a href="/cumplesMeli/empleados/index">Home<span class="sr-only">(current)</span></a></li>
	          </ul>
	        </div><!--/.nav-collapse -->
	      </div>
	    </nav>

	    <div class="container marketing">
		    <g:form method="get" controller="empleados" action="jsonBuscarEmpleados">
				<div>
					<g:select name="userID" from="${listaEmpleados}" optionValue="nombre" optionKey="id" value="${nombre}" noSelection="['':'-Selecciona el empleado-']"/>
				</div>
				<div><a class="btn btn-primary btn-lg" style="color: white" href="/cumplesMeli/empleados/regalo/${empleado.id}">Cambiar Regalo</a>
			        <button class="btn btn-default" id="botonBuscar">Buscar</button>
				</div>
			</g:form>
		</div>

			<div class="container marketing" style="width: 60%">	
  				<div id="template_respuesta_busqueda" style="display: none">
					<hr class="featurette-divider">
			      	<div class="row featurette">
						<div class="col-md-7">
								<h2 class="featurette-heading">${regalo_empleado.tituloProducto}</h2>
								<h2 class="featurette-heading"><span class="text-muted">${regalo_empleado.anioProducto}</span></h2>
						</div>
							<div class="col-md-5">	
								<img class="featurette-image img-responsive" src="${regalo_empleado.urlFotoProducto}" width="300" alt="Generic placeholder image">
						</div>
			        </div>
	      			<hr class="featurette-divider">
	    		</div>
	    		<div id="respuesta_busqueda"></div>
	    	</div>

	    	<script type="text/javascript">
	  			$("#botonBuscar").click(function () {
					$.get("/cumples/empleado.json");
					.done(function(data) {
						$("#respuesta_busqueda").empty();
						$.each(data, mostrarItem);
				});
		});
				
				function mostrarItem () {
					
					var contenido = $("#template_respuesta_busqueda").html();
					contenido = contenido.replace("#regalos_empleados#", empleadoSeleccionado.regalos);
					$("#respuesta_busqueda").append(contenido);
				}
				
				function mostrarError() {
					$("#respuesta_busqueda").html( "<li>Se produjo un errors</li>" );
				}
			</script>
	</body>
</html>
