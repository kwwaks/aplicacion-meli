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
	          <ul class="nav navbar-nav navbar-right">
	            <li class="active"><a href="./">Home<span class="sr-only">(current)</span></a></li>
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
  			<div id="respuesta_busqueda">
  			</div>
  		</div>

  		<script type="text/javascript">
  			$("#botonBuscar").click(funcionBuscar);
  			$("#inputBuscar").keypress(funcionBuscar);
  			function funcionBuscar() {
				var search = $.get("https://api.mercadolibre.com/sites/MLA/search", {q: $("#inputBuscar").val(), offset: 0, limit: 5});
				search.done(mostrarResultado);
				search.fail(mostrarError);
			}

			function mostrarResultado(data) {
				$.each(data.results, agregarResultado);
			}
			
			function agregarResultado (index, item) {
				var search_item = $.get("https://api.mercadolibre.com/items/"+item.id);
				search_item.done(mostrarItem);
			}
			
			function mostrarItem (item) {
				$("#respuesta_busqueda").append('<div class="container marketing">');	
				$("#respuesta_busqueda").append('<hr class="featurette-divider">');
			    $("#respuesta_busqueda").append('<div class="row featurette">');
			    $("#respuesta_busqueda").append('<div class="col-md-7">');
				$("#respuesta_busqueda").append('<h2 class="featurette-heading">' + item.title + '<span class="text-muted">' + ' $' + item.price  + '</span></h2>');
				$("#respuesta_busqueda").append('</div>');
				$("#respuesta_busqueda").append('<div class="col-md-5">	');
				$("#respuesta_busqueda").append('<img class="featurette-image img-responsive" src=' + item.pictures[0].url  + 'alt="Generic placeholder image"/>');
				$("#respuesta_busqueda").append('</div>');
				$("#respuesta_busqueda").append('</div>');
				$("#respuesta_busqueda").append('</div>');
			}
			
			function mostrarError() {
				$("#respuesta_busqueda").html( "<li>Se produjo un errors</li>" );
			}

		</script>

	</body>
</html>