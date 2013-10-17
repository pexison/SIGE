/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package frijoles;
import java.io.*;
import org.apache.struts.action.*;

/**
 *
 * @author fertaku
 */
public class RecaudoForm extends ActionForm{
    
    private String codigo_planilla;
    private String tipo_recaudo;
    private File datos_recaudo;

    public String getCodigo_planilla() {
        return codigo_planilla;
    }

    public void setCodigo_planilla(String codigo_planilla) {
        this.codigo_planilla = codigo_planilla;
    }

    public String getTipo_recaudo() {
        return tipo_recaudo;
    }

    public void setTipo_recaudo(String tipo_recaudo) {
        this.tipo_recaudo = tipo_recaudo;
    }

    public File getDatos_recaudo() {
        return datos_recaudo;
    }

    public void setDatos_recaudo(File datos_recaudo) {
        this.datos_recaudo = datos_recaudo;
    }

}