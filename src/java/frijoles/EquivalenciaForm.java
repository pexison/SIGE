/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package frijoles;
import java.util.*;
import org.apache.struts.action.*;


/**
 *
 * @author fertaku
 */
public class EquivalenciaForm extends ActionForm {
    
    private String codigoEquivalencia;
    private TablaEquivalenciaForm tablaPadre;
    private ArrayList<AsignaturaForm> asignaturasOrigen;
    private ArrayList<AsignaturaForm> asignaturasDestino;
    
    
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
}
