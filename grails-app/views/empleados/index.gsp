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
	            <li ><a href="/cumplesMeli/empleados/buscarEmpleado">Buscar Empleado<span class="sr-only">(current)</span></a></li>
	            <li ><a href="#" data-toggle="modal" data-target="#myModal">Gastos Mesuales<span class="sr-only">(current)</span></a></li>
	            <li class="active"><a href="/cumplesMeli/empleados/crearEmpleado">Crear Empleado<span class="sr-only">(current)</span></a></li>
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
			          		<h2 class="featurette-heading">${empleado.nombre} ${empleado.apellido} ${empleado.fechaCumpleanios}</h2>
			          		 <g:if test="${empleado.regalo == null}">
			          		 	<div class="col-md-7">
			          				<a class="btn btn-primary btn-lg" style="color: white"href="/cumplesMeli/empleados/regalo/${empleado.id}">Agregar Regalo</a>
			          			</div>
							</g:if>
			          		<g:else>
			          	       	<div class="col-md-7">
			          				<h2 class="featurette-heading"><span class="text-muted">${empleado.regalo.tituloProducto}</span></h2>
			          				<a class="btn btn-primary btn-lg" style="color: white" href="/cumplesMeli/empleados/regalo/${empleado.id}">Cambiar Regalo</a>
			          				<a class="btn btn-primary btn-lg" style="color: white" href="/cumplesMeli/empleados/cancelar/${empleado.id}">Cancelar Regalo</a>			          				
			        			</div>
			          			<div class="col-md-5">	
			          				<img class="featurette-image img-responsive" src="${empleado.regalo.urlFotoProducto}" width="300" alt="Generic placeholder image">
			        			</div>
							</g:else>

			        </div>
			    </g:each>
	      <hr class="featurette-divider">
	    </div>

	    <!-- Modal -->
		<div class="modal fade bs-example-modal-sm" id="myModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title"  style="text-align: center" id="myModalLabel">Envio de Gastos Mesuales</h4>
		      </div>
		    <div class="modal-body">
		        <div class="container marketing" style="width: 60%">	
			     	<div class="row featurette" >
	                    <g:form controller="envioMails" action="mandarMail">
			                <div class="input-group">
							  <span class="input-group-addon" id="basic-addon1">Enviar a:</span>
							  <input type="text" class="form-control" placeholder="ejemplo@ejemplo.com" name="mail">
							</div>
			                <br>
			               <button class="btn btn-primary btn-lg"><a style="color: white">Enviar</a> </button> 
                    </g:form>
		         	</div>  
		      	</div>
		    </div>
		  </div>
		</div>

	</body>
</html>