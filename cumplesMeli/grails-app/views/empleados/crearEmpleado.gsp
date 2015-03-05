<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/bootstrap/css/bootstrap.css">
        
        <link href="${request.contextPath}/calendario_dw/calendario_dw-estilos.css" type="text/css" rel="STYLESHEET"> 
        
		<script type="text/javascript" src="${request.contextPath}/js/jquery-2.1.3.js"></script>
		<script type="text/javascript" src="${request.contextPath}/bootstrap/js/bootstrap.js"></script>
		<link rel="icon" type="image/png" href="http://developers.mercadolibre.com/wp-content/uploads/logo_puzzle_slider.png" />
		
		<!-- <script type="text/javascript" src="${request.contextPath}/calendario_dw/jquery-1.4.4.min.js"></script> -->
        <script type="text/javascript" src="${request.contextPath}/calendario_dw/calendario_dw.js"></script> 
		<script type="text/javascript">
         $(document).ready(function(){
         $(".campofecha").calendarioDW();
          })
        </script> 
		
		
		<title>Crear Empleado</title>
	</head>
	<body>
		<div>
		    <nav class="navbar navbar-default">
		      <div class="container">
		        <div id="navbar" class="navbar-collapse collapse">
		          <ul class="nav navbar-nav navbar-right">
		            <li class="active"><a href="/cumplesMeli/empleados/index"> Home <span class="sr-only">(current)</span></a></li>
		          </ul>
		        </div><!--/.nav-collapse -->
		      </div>
		    </nav>
		    <div class="container">
			<div style = "text-align: center" class="jumbotron">
				<p style = "font-size: 30px">Crear Empleado</p>
			</div>
	    </div>
			
			<div class="container marketing">	
				<hr class="featurette-divider">

		     	<div class="row featurette">
		        	<!--  <div class="col-md-7">-->
		          		
		          	<g:form method="post" controller="empleados" action="agregarEmpleado">
                        <h2 class="featurette-heading">Nombre:</h2>
                        <g:textField name="nombre" value="${myValue}" />
                        <h2 class="featurette-heading">Apellido:</h2>
                        <g:textField name="apellido" value="${myValue}" />
                        <h2 class="featurette-heading">Fecha: </h2>
                        <g:textField name="fecha" value="${myValue}" class="campofecha" /> 
                      
                        <br>
                        <br>
                       <button class="btn btn-primary btn-lg"><a style="color: white">Agregar Empleado</a> </button> 

                    </g:form>
		          			
		        <!--  	</div>  -->
		 
		    </div>
	      <hr class="featurette-divider">
	    </div>
	   </div> 
	</body>
</html>