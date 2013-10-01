/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package frijoles;
//import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.*;

/**
 *
 * @author fertaku
 */

/* Clase para el formulario de validaciones */
public class ValidacionForm extends ActionForm {
    
    private String usuario;
    private String clave;
    
    /* Metodo para obtener el ID del usuario */
    public String getUsuario() {
        return this.usuario;
    }
    
    /* Metodo para fijar del usuario */
    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }
    
    /* Metodo para obtener la clave del usuario */
    public String getClave() {
        return this.clave;
    }
    
    /* Metodo para fijar la clave del usuario */
    public void setClave(String clave) {
        this.clave = clave;
    }
    
}
