/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package frijoles;
import org.apache.struts.action.*;

/**
 *
 * @author arturo
 */


/* Clase para el formulario de las asignaturas */
public class AsignaturaForm extends ActionForm {
    
    private String codigoInstitucion;
    private String nombreAsignatura;
    private String codigoAsignatura;
    private int creditos;
    
    
    /* Metodo para obtener el codigo de la institucion que ofrece
       la carrera que requiere la asignatura*/
    public String getCodigoInstitucion() {
        return this.codigoInstitucion;
    }
    
    /* Metodo para obtener el nombre de la asignatura */
    public String getNombreAsignatura() {
        return this.nombreAsignatura;
    }
    
    /* Metodo para obtener el codigo de la asignatura */
    public String getCodigoAsignatura() {
        return this.codigoAsignatura;
    }
    
    /* Metodo para obtener el numero de creditos de la carrera */
    public int getCreditos() {
        return this.creditos;
    }
    
    /* Metodo para fijar el nombre de la asignatura */
    public void setNombreAsignatura(String nombre) {
        this.nombreAsignatura = nombre;
    }
    
    /* Metodo para fijar el codigo de la asignatura */
    public void setCodigoAsignatura(String codigo) {
        this.codigoAsignatura = codigo;
    }
    
    /* Metodo para fijar el numero de creditos de la asignatura */
    public void setCreditos(int creditos) {
        this.creditos = creditos;
    }
    
    /* Metodo para fijar el codigo de la institucion que ofrece la carrera
       que requiere la asignatura*/
    public void setCodigoInstitucion(String nomIns) {
        this.codigoInstitucion=nomIns;
    }
    
}
