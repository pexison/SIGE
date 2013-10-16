/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package frijoles;
import java.util.*;
import java.io.*;
import org.apache.struts.action.*;


/**
 *
 * @author fertaku
 */
public class PlanillaForm extends ActionForm{
    
    private String cedula_aspirante;
    private String codigo_planilla;
    private String estado_planilla;
    private String tipo_ingreso;
    private String nombre_institucion_origen;
    private String nombre_institucion_destino;
    private String nombre_carrera_origen;
    private String nombre_carrera_destino;
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

    public String getNombre_institucion_origen() {
        return nombre_institucion_origen;
    }

    public void setNombre_institucion_origen(String nombre_institucion_origen) {
        this.nombre_institucion_origen = nombre_institucion_origen;
    }

    public String getNombre_institucion_destino() {
        return nombre_institucion_destino;
    }

    public void setNombre_institucion_destino(String nombre_institucion_destino) {
        this.nombre_institucion_destino = nombre_institucion_destino;
    }

    public String getNombre_carrera_origen() {
        return nombre_carrera_origen;
    }

    public void setNombre_carrera_origen(String nombre_carrera_origen) {
        this.nombre_carrera_origen = nombre_carrera_origen;
    }

    public String getNombre_carrera_destino() {
        return nombre_carrera_destino;
    }

    public void setNombre_carrera_destino(String nombre_carrera_destino) {
        this.nombre_carrera_destino = nombre_carrera_destino;
    }
    
}

