/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package frijoles;
import java.util.*;
import java.io.*;


/**
 *
 * @author fertaku
 */
public class PlanillaForm {
    
    private String cedula_aspirante;
    private String codigo_planilla;
    private String estado_planilla;
    private String tipo_ingreso;
    private ArrayList<RecaudoForm> recaudos;

    public String getCedula_aspirante() {
        return cedula_aspirante;
    }

    public void setCedula_aspirante(String cedula_aspirante) {
        this.cedula_aspirante = cedula_aspirante;
    }

    public String getCodigo_planilla() {
        return codigo_planilla;
    }

    public void setCodigo_planilla(String codigo_planilla) {
        this.codigo_planilla = codigo_planilla;
    }

    public String getEstado_planilla() {
        return estado_planilla;
    }

    public void setEstado_planilla(String estado_planilla) {
        this.estado_planilla = estado_planilla;
    }

    public String getTipo_ingreso() {
        return tipo_ingreso;
    }

    public void setTipo_ingreso(String tipo_ingreso) {
        this.tipo_ingreso = tipo_ingreso;
    }

    public ArrayList<RecaudoForm> getRecaudos() {
        return recaudos;
    }

    public void setRecaudos(ArrayList<RecaudoForm> recaudos) {
        this.recaudos = recaudos;
    }
    
    
}

