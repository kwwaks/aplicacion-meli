<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/bootstrap/css/bootstrap.css">

		<script type="text/javascript" src="${request.contextPath}/js/jquery-2.1.3.js"></script>
		<script type="text/javascript" src="${request.contextPath}/bootstrap/js/bootstrap.js"></script>
		<link rel="icon" type="image/png" href="http://developers.mercadolibre.com/wp-content/uploads/logo_puzzle_slider.png" />
		<title>Agregar Regalo</title>
	</head>
	<body>
	    <nav class="navbar navbar-default">
	      <div class="container">
	        <div id="navbar" class="navbar-collapse collapse">
	        <ul class="nav navbar-nav navbar-left">
	          <li class="active"><h4><strong>${session["empresa"].nombre}</strong></h4></li>
	          </ul>
	          <ul class="nav navbar-nav navbar-right">
	           <li class="active"><a href="/cumplesMeli/cumples-de-hoy/${session["empresa"].nombre}">Home<span class="sr-only">(current)</span></a></li>
	            	<sec:ifLoggedIn>
	            		<sec:ifAnyGranted roles="ROLE_SUPERADMIN"> 
	            			<li><a href="/cumplesMeli/empresas/newEmpresa">Crear Empresa<span class="sr-only">(current)</span></a></li>
	            		</sec:ifAnyGranted>
	            	</sec:ifLoggedIn>
	            	
	            	<sec:ifLoggedIn>
	            		<sec:ifAnyGranted roles="ROLE_SUPERADMIN"> 
	            			<li><a href="/cumplesMeli/empresas/newAdmin">Crear Administrador<span class="sr-only">(current)</span></a></li>
	            		</sec:ifAnyGranted> 
	             	</sec:ifLoggedIn>
	             	
	             	<sec:ifLoggedIn>
	            		<li><a href="/cumplesMeli/j_spring_security_logout">Desloguearme!<span class="sr-only">(current)</span></a></li>
	            	</sec:ifLoggedIn>
	            
	            	<sec:ifNotLoggedIn>
	            		<li><a href="/cumplesMeli/login/auth">Loguearme!<span class="sr-only">(current)</span></a></li>
	            	</sec:ifNotLoggedIn>	          
	          </ul>
	        </div><!--/.nav-collapse -->
	      </div>
	    </nav>
	    
	    <div class="container">
		    <div class="row">
			    <div class="input-group">
			      <input type="text" class="form-control" placeholder="Buscar regalo..." id="inputBuscar">
			      <span class="input-group-btn">
			        <button class="btn btn-default" id="botonBuscar">Buscar</button>
			      </span>
	  		  	</div><!-- /input-group -->
	  		</div>
  		</div>
  		
  		<div class="container marketing">
  			<div id="template_respuesta_busqueda" style="display: none">
				<div class="container marketing">
					<hr class="featurette-divider">
					<div class="row featurette">
						<div class="col-md-7">
							<h2 class="featurette-heading"> #tituloItem# <span class="text-muted"> $ #precioItem#</span></h2>
							<form action="${createLink(action: 'agregarProducto', controller: 'empleados')}" method="post">
								<input type="hidden" name="idEmpleado" value="${idEmpleado}"/>
								<input type="hidden" name="nombreProducto" value="#tituloItem#"/>
								<input type="hidden" name="urlFotoProducto" value="#urlImagen#"/>
								<input type="hidden" name="precioProducto" value="#precioItem#"/>
								<button class="btn btn-primary" style="color: white">Regalar</button>
							</form>
						</div>
						<div class="col-md-5">
							<img class="featurette-image img-responsive" src="#urlImagen#" alt="Generic placeholder image" width="300"/>
						</div>
					</div>
				</div>'
  			</div>
  			<div id="respuesta_busqueda"></div>
  		</div>

  		<script type="text/javascript">
  			$("#botonBuscar").click(funcionBuscar);
  			$("#inputBuscar").keypress(funcionBuscarEnter);
  			
  			function funcionBuscarEnter(param) {
  				if (param.keyCode == 13) {
  					funcionBuscar();
  				}
  			}

  			function funcionBuscar() {
				var search = $.get("https://api.mercadolibre.com/sites/MLA/search", {q: $("#inputBuscar").val(), offset: 0, limit: 5});
				search.done(mostrarResultado);
				search.fail(mostrarError);
			}

			function mostrarResultado(data) {
				$.each(data.results, agregarResultado);
			}
			
			function agregarResultado (index, item) {
				$("#respuesta_busqueda").empty();
				var search_item = $.get("https://api.mercadolibre.com/items/"+item.id);
				search_item.done(mostrarItem);
			}
			
			function mostrarItem (item) {
				var contenido = $("#template_respuesta_busqueda").html();
				contenido = contenido.replace("#tituloItem#", item.title);
				contenido = contenido.replace("#tituloItem#", item.title);
				contenido = contenido.replace("#precioItem#", item.price);
				contenido = contenido.replace("#precioItem#", item.price);
				contenido = contenido.replace("#urlImagen#", item.pictures[0].url);
				contenido = contenido.replace("#urlImagen#", item.pictures[0].url);
				$("#respuesta_busqueda").append(contenido);
			}
			
			function mostrarError() {
				$("#respuesta_busqueda").html( "<li>Se produjo un errors</li>" );
			}

		</script>

	</body>
</html>