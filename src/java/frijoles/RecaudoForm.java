/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package frijoles;
import java.io.*;
import org.apache.struts.action.*;
import org.apache.struts.upload.FormFile;

/**
 *
 * @author fertaku
 */
public class RecaudoForm extends ActionForm{
    
    private String   codigo_planilla;
    private String   tipo_recaudo;
    private FormFile datos_recaudo;
    private String   ruta_datos_recaudo;
    
    public String getRuta_datos_recaudo() {
        return ruta_datos_recaudo;
    }

    public void setRuta_datos_recaudo(String ruta_datos_recaudo) {
        this.ruta_datos_recaudo = ruta_datos_recaudo;
    }
    
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

    public FormFile getDatos_recaudo() {
        return datos_recaudo;
    }

    public void setDatos_recaudo(FormFile datos_recaudo) {
        this.datos_recaudo = datos_recaudo;
    }

}