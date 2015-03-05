package cumples

class Empleado {

	String nombre;
	String apellido;
	Date fechaNacimiento;
    String nombreProducto;
	String urlFotoProducto;
    
    static constraints = {
    	nombre nullable: false;
    	apellido nullable: false;
        nombreProducto nullable: true;
    	urlFotoProducto nullable: true;
    }

    String obtenerFecha(){
    	String res = this.fechaNacimiento.toString();
    	return res.substring(8,10)  + "/" + res.substring(5,7);
    }
}
