package cumples
import java.util.Date

class Regalo {

    String tituloProducto;
	String urlFotoProducto;
    Date fechaProducto;
    double precioProducto;

    static belongTo = Empleado;
}
