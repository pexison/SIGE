/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package frijoles;
import org.apache.struts.action.*;

/**
 *
 * @author fertaku
 */
/* Clase para manipulacion de datos de la Tabla de Equivalencia*/
public class TablaEquivalenciaForm extends ActionForm {
    
    String codigoInstitucionOrigen;
    String codigoCarreraOrigen;
    String codigoInstitucionDestino;
    String codigoCarreraDestino;
    String fechaModificacion;
    
    /* Metodo para obtener el codigo de la institucion de origen */
    public String getCodigoInstitucionOrigen(){
        return this.codigoInstitucionOrigen;
    }
    /* Metodo para fijar el codigo de la institucion de origen */
    public void setCodigoInstitucionOrigen(String codigo){
        this.codigoInstitucionOrigen = codigo;
    }
    /* Metodo para obtener el codigo de la institucion de Destino */
    public String getCodigoInstitucionDestino(){
        return this.codigoInstitucionDestino;
    }
    /* Metodo para fijar el codigo de la institucion de Destino */
    public void setCodigoInstitucionDestino(String codigo){
        this.codigoInstitucionDestino = codigo;
    }
    /* Metodo para obtener el codigo de la Carrera de Destino */
    public String getCodigoCarreraDestino(){
        return this.codigoCarreraDestino;
    }
    /* Metodo para fijar el codigo de la Carrera de Destino */
    public void setCodigoCarreraDestino(String codigo){
        this.codigoCarreraDestino = codigo;
    }
    /* Metodo para obtener el codigo de la Carrera de Origen */
    public String getCodigoCarreraOrigen(){
        return this.codigoCarreraOrigen;
    }
    /* Metodo para fijar el codigo de la Carrera de Origen */
    public void setCodigoCarreraOrigen(String codigo){
        this.codigoCarreraOrigen = codigo;
    }
    /* Metodo obtener la fecha de modificacion de dicha tabla */
    public String getFechaModificacion(){
        return this.fechaModificacion;
    }
    /* Metodo para fijar la fecha de modificacion de dicha tabla */
    public void setFechaModificacion(String fecha){
        this.fechaModificacion = fecha;
    }
}
