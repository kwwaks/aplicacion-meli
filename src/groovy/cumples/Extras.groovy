package cumples;
import java.util.Date;

static String obtenerFecha(Date fecha){
    def dia = fecha.date
    def mes = fecha.month
    return "${dia}/${mes}"
}