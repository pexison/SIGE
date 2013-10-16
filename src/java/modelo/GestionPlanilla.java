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
    
     public boolean modificarPlanilla(PlanillaForm pf) {
        
        boolean res = false;
        
        String update = "UPDATE PLANILLA SET ESTADO_PLANILLA='"
                +pf.getEstado_planilla()+"',TIPO_INGRESO='"
                +pf.getTipo_ingreso()+"'"
                + "WHERE CODIGO_PLANILLA = '"+pf.getCodigo_planilla()+"';";
        
        try {
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            st.execute(update);
            st.close();
            res = true;
            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            System.out.println("Error al modificar planilla.");
        }
        return res;
        
    }
    
    public boolean existePlanilla(String codigo_planilla) {
        
        String consulta = "SELECT Count(*) FROM PLANILA WHERE "+
                          "CODIGO_PLANILLA ='"+ codigo_planilla +"')";
        System.out.println(consulta);
        int rs = 0;
        try {
            
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            ResultSet result = st.executeQuery(consulta);
            
            if (result.next()) {
               rs = result.getInt(1); 
            }
            st.close();
            bd.terminarConexion(conexion);
        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
        
        return (rs != 0);
 
    }
    
    
      public boolean eliminarPlanilla(PlanillaForm pf) {
        
        boolean res = false;
        
        String delete = "DELETE FROM PLANILLA WHERE ("+
                        "CODIGO_PLANILLA='"+pf.getCodigo_planilla()+
                        "')";
        boolean existe = existePlanilla(pf.getCodigo_planilla());
        if (existe) {        
            try {
                Connection conexion = bd.establecerConexion();
                Statement st = conexion.createStatement();

                st.execute(delete);
                System.out.println(res);
                st.close();
                bd.terminarConexion(conexion);
                res = true;

            } catch(Exception e) {
                System.out.println("Error al eliminar Planilla.");
            }
        }
        return res;
        
    }
    
    
    
    public ArrayList<PlanillaForm> mostrarPlanillas() {
        
        String consulta = "SELECT * FROM PLANILLA";
        ArrayList listaPlanilla = new ArrayList();
                
        try {
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery(consulta);
            
            PlanillaForm PlanillaF;
            
            while (rs.next()) {
                PlanillaF = new PlanillaForm();
                PlanillaF.setCedula_aspirante(rs.getString(1));
                PlanillaF.setCodigo_planilla(rs.getString(2));
                PlanillaF.setEstado_planilla(rs.getString(3));
                PlanillaF.setTipo_ingreso(rs.getString(4));
                listaPlanilla.add(PlanillaF);
            }

            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            System.out.println("Error al obtener lista de planillas.");
        }
        return listaPlanilla; 
    }
      
      
      
}
