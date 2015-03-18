<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/bootstrap/css/bootstrap.css">
		<link rel="stylesheet" type="text/css" href="${request.contextPath}/css/validacion.css">
		<script type="text/javascript" src="${request.contextPath}/js/jquery-2.1.3.js"></script>
		<script type="text/javascript" src="${request.contextPath}/bootstrap/js/bootstrap.js"></script>
		<link rel="icon" type="image/png" href="http://developers.mercadolibre.com/wp-content/uploads/logo_puzzle_slider.png" />
		<title>Administradores</title>
	</head>
	
	<body>
	    <nav class="navbar navbar-default">
	      <div class="container">
	        <div id="navbar" class="navbar-collapse collapse">
	        <ul class="nav navbar-nav navbar-left">
	          <li class="active"><h4><strong>${session["empresa"].nombre}</strong></h4></li>
	          </ul>
	          <ul class="nav navbar-nav navbar-right">
	          	<li><a href="/cumplesMeli/abm_empleados.html">ABM Empleados<span class="sr-only">(current)</span></a></li>
	          	<li><a href="/cumplesMeli/reporte_regalos_del_mes">Envio Reporte<span class="sr-only">(current)</span></a></li>
	            <li><a href="/cumplesMeli/empleados/buscarEmpleado">Buscar Empleado<span class="sr-only">(current)</span></a></li>
	            <li ><a href="#" data-toggle="modal" data-target="#myModal">Crear Empleado <span class="sr-only">(current)</span></a></li>
	            	
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
	            		<sec:ifAnyGranted roles="ROLE_SUPERADMIN"> 
	            			<li class="active"><a href="/cumplesMeli/empresas/verAdmins">Administradores<span class="sr-only">(current)</span></a></li>
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
			<div style = "text-align: center" class="jumbotron">
				<p style = "font-size: 30px">Administradores de la empresa ${session["empresa"].nombre}</p>
			</div>
	    </div>
			<g:each in="${admins}" var="admin">
				<div style="border: 1px solid FFD700">
					<h2> <center>${admin.username}</center></h2>
				</div>
			</g:each>
	</body>
</html>
