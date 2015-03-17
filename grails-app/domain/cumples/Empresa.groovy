package cumples

class Empresa {
	String nombre;
	String mail;
	
	static hasMany = [empleados:Empleado];

}
