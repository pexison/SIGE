/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.sql.*;
import frijoles.*;
import java.util.*;

/**
 *
 * @author fertaku
 */
public class GestionPlanilla {
    
    BaseDatos bd;
    
    public GestionPlanilla(){
        bd = new BaseDatos();
    }
    
    public boolean agregarPlanilla(PlanillaForm pf) {
        boolean res = false;
        
        String insercion = "INSERT INTO PLANILLA VALUES ('"
                +pf.getCedula_aspirante()+"','"
                +pf.getCodigo_planilla()+"','"
                +pf.getEstado_planilla()+"','"
                +pf.getTipo_ingreso()
                + "');";
        
        System.out.print(insercion);
        
        try {
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            st.execute(insercion);
            st.close();
            res = true;
            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            System.out.println("Error al registrar Planilla.");
        }
        return res;   
    }
    
}
