package cumples
import java.util.Date
import grails.rest.Resource

@Resource(uri= "/misRegalos")
class Regalo {

    String tituloProducto;
	String urlFotoProducto;
    Date fechaProducto;
    double precioProducto;

    static belongsTo = [empleado: Empleado];
}
