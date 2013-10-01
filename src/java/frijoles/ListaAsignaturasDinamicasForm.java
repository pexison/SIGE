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
 * @author arturo
 */
public class ListaAsignaturasDinamicasForm extends ActionForm {
    
    private LabelValueBean[] possibleOptionsOrigen;
    private LabelValueBean[] possibleOptionsDestino;
    private String[] selectedOptionsOrigen;
    private String[] selectedOptionsDestino;

    public ListaAsignaturasDinamicasForm(ArrayList<AsignaturaForm> asigReqOrigen, ArrayList<AsignaturaForm> asigReqDestino) {
    // Initialise the LabelValueBeans in the possibleOptions array.
    LabelValueBean[] lvBeansOrigen = new LabelValueBean[asigReqOrigen.size()];
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
    
}
