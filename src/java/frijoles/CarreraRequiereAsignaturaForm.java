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
public class CarreraRequiereAsignaturaForm extends ActionForm {
    
    private String codigoInstitucion;
    private String codigoCarrera;
    private String codigoAsignatura;
    
    
    /* Metodo para obtener el codigo de la carrera */
    public String getCodigoCarrera() {
        return this.codigoCarrera;
    }
    
    /* Metodo para obtener el codigo de la institucion que ofrece la carrera */
    public String getCodigoInstitucion() {
        return this.codigoInstitucion;
    }
    
    /* Metodo para obtener el codigo de la asignatura que ofrece la carrera */
    public String getCodigoAsignatura() {
        return this.codigoAsignatura;
    }
    
    /* Metodo para fijar el codigo de la carrera */
    public void setCodigoCarrera(String codCar) {
        this.codigoCarrera=codCar;
    }
    
    /* Metodo para fijar el nombre de la institucion que ofrece la carrera */
    public void setCodigoInstitucion(String codIns) {
        this.codigoInstitucion=codIns;
    }
    
    /* Metodo para fijar el codigo de la asignatura que ofrece la carrera */
    public void setCodigoAsignatura(String codAsig) {
        this.codigoAsignatura=codAsig;
    }
    
}
