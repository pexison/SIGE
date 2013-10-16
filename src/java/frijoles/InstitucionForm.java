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

/* Clase para el formulario de las instituciones */
public class InstitucionForm extends ActionForm{
   
    private String codigoInstitucion;
    private String nombreInstitucion;
    private String direccionInstitucion;
    private String paisInstitucion;
    
    /* Metodo para obtener el codigo de la institucion */
    public String getCodigoInstitucion() {
        return this.codigoInstitucion;    
    }
    
    /* Metodo para obtener el nombre de la institucion */
    public String getNombreInstitucion() {
        return this.nombreInstitucion;
    }
    
    /* Metodo para obtener la direccion de la institucion */
    public String getDireccionInstitucion() {
        return this.direccionInstitucion;
    }
    
    /* Metodo para obtener el pais de la institucion */
    public String getPaisInstitucion() {
        return this.paisInstitucion;
    }
    
    /* Metodo para fijar el codigo de la institucion */
    public void setCodigoInstitucion(String codigo){
        this.codigoInstitucion=codigo;
    }

    /* Metodo para fijar el nombre de la institucion */    
    public void setNombreInstitucion(String nombre) {
        this.nombreInstitucion=nombre;
    }
    
    /* Metodo para fijar la direccion de la institucion */
    public void setDireccionInstitucion(String direccion) {
        this.direccionInstitucion=direccion;
    }
    
    /* Metodo para fijar el pais de la institucion */
    public void setPaisInstitucion(String pais) {
        this.paisInstitucion=pais;
    }
    
    /* Metodo para reiniciar los atributos de la institucion */
    public void resetInstitucion() {
        this.codigoInstitucion = "";
        this.nombreInstitucion = "";
        this.direccionInstitucion = "";
        this.paisInstitucion = "";
    }
    
}
