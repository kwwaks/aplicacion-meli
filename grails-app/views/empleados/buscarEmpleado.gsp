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
				<div>
			        <button type="button" class="btn btn-default" id="botonBuscar">Buscar</button>
				</div>
			</g:form>
		</div>

		<div class="container marketing">
		  			<div id="template_respuesta_busqueda" style="display: none">
						<div class="container marketing">
							<hr class="featurette-divider">
							<div class="row featurette">
								<div class="col-md-7">
									<h2 class="featurette-heading"> #tituloItem# <span class="text-muted"> Año #anioItem#</span></h2>
								</div>
								<div class="col-md-5">
									<img class="featurette-image img-responsive" src="#urlImagen#" alt="Generic placeholder image" width="300"/>
								</div>
							</div>
						</div>'
		  			</div>
			<div class="jumbotron" id="nombre_buscado_template" style="display: none">
				<h2>#nombreUsuario# #apellidoUsuario#</h2>
				<p>Fecha de nacimiento: #diaNacimiento# #mesNacimiento# #anioNacimiento#</p>
				<a class="btn btn-danger" style="color: white" href="/cumplesMeli/empleados/eliminarEmpleado/#idEmpleado#">Eliminar Empleado</a>
			</div>
		  	<div id="respuesta_nombre_buscado"></div>
		  	<div id="respuesta_busqueda"></div>
		</div>

	    	<script type="text/javascript">
	  			$("#botonBuscar").click(function () {
					$.get("/cumplesMeli/empleado/" + $("#userID").val() + ".json")
					.done(function(data) {
						$("#respuesta_busqueda").empty();
						$("#respuesta_nombre_buscado").empty();
						var contenido = $("#nombre_buscado_template").html();
						contenido = contenido.replace("#nombreUsuario#", data.nombre);
						contenido = contenido.replace("#apellidoUsuario#", data.apellido);
						contenido = contenido.replace("#idEmpleado#", data.id);
						contenido = contenido.replace("#anioNacimiento#", data.fechaNacimiento.substring(0,4));
						contenido = contenido.replace("#mesNacimiento#", data.fechaNacimiento.substring(5,7));
						contenido = contenido.replace("#diaNacimiento#", data.fechaNacimiento.substring(8,10));
						$("#respuesta_nombre_buscado").append(contenido);
						$.each(data.regalos, mostrarRegalo);
				});
		});
				
				function mostrarRegalo (index, dato) {
					$.get("/cumplesMeli/misRegalos/" + dato.id + ".json")
					.done(function(dato){
					var contenido = $("#template_respuesta_busqueda").html();
					contenido = contenido.replace("#tituloItem#", dato.tituloProducto);
					contenido = contenido.replace("#anioItem#", dato.fechaProducto.substring(0,4));
					contenido = contenido.replace("#urlImagen#", dato.urlFotoProducto);
					$("#respuesta_busqueda").append(contenido);
					});
					
				}

				function mostrarError() {
					$("#respuesta_busqueda").html( "<li>Se produjo un errors</li>" );
				}
			</script>
	</body>
</html>
