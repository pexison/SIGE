/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package frijoles;
import java.util.*;
import org.apache.struts.action.*;
import org.apache.struts.util.LabelValueBean;


/**
 *
 * @author fertaku
 */
public class EquivalenciaForm extends ActionForm {
    
    private String codigoEquivalencia;
    private TablaEquivalenciaForm tablaPadre;
    private ArrayList<AsignaturaForm> asignaturasOrigen;
    private ArrayList<AsignaturaForm> asignaturasDestino;
    private String codigoInstitucionOrigen;
    private String codigoCarreraOrigen;
    private String codigoInstitucionDestino;
    private String codigoCarreraDestino;
    
    private LabelValueBean[] possibleOptionsOrigen;
    private LabelValueBean[] possibleOptionsDestino;
    private String[] selectedOptionsOrigen;
    private String[] selectedOptionsDestino;

    public EquivalenciaForm() {
        super();
    }
    
    /* se agregan en possibleOptionsOrigen las asignaturas de origen
     * y en possibleOptionDesitno las asignaturas de destino
     */
    public void AdjuntarListasAsignaturas(ArrayList<AsignaturaForm> asigReqOrigen, ArrayList<AsignaturaForm> asigReqDestino) {
        // Initialise the LabelValueBeans in the possibleOptions array.
        LabelValueBean[] lvBeansOrigen  = new LabelValueBean[asigReqOrigen.size()];
        LabelValueBean[] lvBeansDestino = new LabelValueBean[asigReqDestino.size()];

        AsignaturaForm asigActual;
        String codAsigActual;
        String nombreAsigActual;

        for (int i=0; i<asigReqOrigen.size(); i++) {
            asigActual = asigReqOrigen.get(i);
            codAsigActual = asigActual.getCodigoAsignatura();
            nombreAsigActual = asigActual.getNombreAsignatura();

            lvBeansOrigen[i] = new LabelValueBean(nombreAsigActual,codAsigActual);
        }

        for (int i=0; i<asigReqDestino.size(); i++) {
            asigActual = asigReqDestino.get(i);
            codAsigActual = asigActual.getCodigoAsignatura();
            nombreAsigActual = asigActual.getNombreAsignatura();

            lvBeansDestino[i] = new LabelValueBean(nombreAsigActual,codAsigActual);
        }

        this.possibleOptionsOrigen = lvBeansOrigen;
        this.possibleOptionsDestino = lvBeansDestino;
    
    }
    
    public LabelValueBean[] getPossibleOptionsOrigen() {
    return possibleOptionsOrigen;
    }
    
    public LabelValueBean[] getPossibleOptionsDestino() {
    return possibleOptionsDestino;
    }

    public String[] getSelectedOptionsOrigen() {
    return selectedOptionsOrigen;
    }
    
    public String[] getSelectedOptionsDestino() {
    return selectedOptionsDestino;
    }

    public void setSelectedOptionsOrigen(String[] selectedOptionsOrigen) {
    this.selectedOptionsOrigen = selectedOptionsOrigen;
    }
    
    public void setSelectedOptionsDestino(String[] selectedOptionsDestino) {
    this.selectedOptionsDestino = selectedOptionsDestino;
    }
    
    public void setTablaPadre(TablaEquivalenciaForm tablaPadre) {
        this.tablaPadre = tablaPadre;
    }
    
    public void setAsignaturasOrigen(ArrayList<AsignaturaForm> asignaturasOrigen) {
        this.asignaturasOrigen = asignaturasOrigen;
    }
    
    public void setAsignaturasDestino(ArrayList<AsignaturaForm> asignaturasDestino) {
        this.asignaturasDestino = asignaturasDestino;
    }
    
    public void setCodigoEquivalencia(String codigo) {
        this.codigoEquivalencia = codigo;
    }
    
    public TablaEquivalenciaForm getTablaPadre() {
        return this.tablaPadre;
    }
    
    public ArrayList<AsignaturaForm> getAsignaturasOrigen() {
        return this.asignaturasOrigen;
    }
    
    public ArrayList<AsignaturaForm> getAsignaturasDestino() {
        return this.asignaturasDestino;
    }
    
    public String getCodigoEquivalencia() {
        return this.codigoEquivalencia;
    }
    
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
}
