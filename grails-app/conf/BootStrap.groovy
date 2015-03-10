import cumples.Empleado;
import cumples.Regalo;
import java.util.Date;

class BootStrap {

    def init = { servletContext ->
    

    //Empleados Prueba
    Empleado e1 = new Empleado(nombre: "Alberto", apellido: "Ramirez", fechaNacimiento: Date.parse("yyyy/MM/dd", "1975/7/06"));
    Empleado e2 = new Empleado(nombre: "Carlos", apellido: "Rossi", fechaNacimiento: Date.parse("yyyy/MM/dd", "1965/10/12"));
    Empleado e3 = new Empleado(nombre: "Rodolfo", apellido: "Pert", fechaNacimiento: new Date());
    Empleado e4 = new Empleado(nombre: "Juan", apellido: "Perez", fechaNacimiento: new Date());
    Empleado e5 = new Empleado(nombre: "Mario", apellido: "Lerva", fechaNacimiento: new Date());
	
    e1.save();
    e2.save();
    e3.save();
    e4.save();
    e5.save();


    }

    def destroy = {
    }
}
