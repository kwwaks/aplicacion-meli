import cumples.Empleado;
import cumples.Regalo;
import java.util.Date;

class BootStrap {

    def init = { servletContext ->
    

    //Empleados Prueba
    Empleado e1 = new Empleado(nombre: "Alberto", apellido: "Ramirez", fechaNacimiento: Date.parse("yyyy-MM-dd", "1975-03-25"));
    Empleado e2 = new Empleado(nombre: "Carlos", apellido: "Rossi", fechaNacimiento: Date.parse("yyyy-MM-dd", "1965-10-12"));
    Empleado e3 = new Empleado(nombre: "Rodolfo", apellido: "Pert", fechaNacimiento: Date.parse("yyyy-MM-dd", "1980-07-05"));
    Empleado e4 = new Empleado(nombre: "Juan", apellido: "Perez", fechaNacimiento: Date.parse("yyyy-MM-dd", "1955-09-20"));
    Empleado e5 = new Empleado(nombre: "Mario", apellido: "Lerva", fechaNacimiento: Date.parse("yyyy-MM-dd", "1972-01-13"));
	
    e1.save();
    e2.save();
    e3.save();
    e4.save();
    e5.save();


    }

    def destroy = {
    }
}
