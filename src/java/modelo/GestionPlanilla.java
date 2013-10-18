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
        
        String codigos = "SELECT CODIGO_PLANILLA FROM PLANILLA";
                
        try {
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            
            ArrayList<Integer> listaCodigosString = new ArrayList();
            
            ResultSet rs = st.executeQuery(codigos);
            
            

            while (rs.next()) {
                listaCodigosString.add(rs.getInt(1));
            }
            
            
            int codigoPlanilla = 0;
            int codigoActual;
            
            for (int i = 0; i<listaCodigosString.size(); i++ ) {
                codigoActual = listaCodigosString.get(i);
                if (codigoActual > codigoPlanilla) {
                    codigoPlanilla = codigoActual;
                }
            }
            
            codigoPlanilla = codigoPlanilla + 1;
            
            String insercion = "INSERT INTO PLANILLA VALUES ('"
                +pf.getCedula_aspirante()+"','"
                +codigoPlanilla+"','"
                +pf.getEstado_planilla()+"','"
                +pf.getTipo_ingreso() + "','"
                +pf.getNombre_institucion_origen() + "','"
                +pf.getNombre_institucion_destino() + "','"
                +pf.getNombre_carrera_origen() + "','"
                +pf.getNombre_carrera_destino()
                + "');";
            
            pf.setCodigo_planilla(codigoPlanilla+"");
            
            System.out.println(insercion);
            
            st = conexion.createStatement();
            
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
        
        String consulta = "SELECT Count(*) FROM PLANILLA WHERE "+
                          "CODIGO_PLANILLA ='"+ codigo_planilla +"';";
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
    
    public PlanillaForm obtenerPlanilla(String codigo_planilla) {
        
        String consulta = "SELECT * FROM PLANILLA WHERE "+
                          "CODIGO_PLANILLA ='"+ codigo_planilla +"';";
        int rs = 0;
        
        PlanillaForm planilla = null;
        
        System.out.println(codigo_planilla);
        
        try {
            
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            ResultSet result = st.executeQuery(consulta);
            
            if (result.next()) {
               planilla = new PlanillaForm();
               planilla.setCedula_aspirante(result.getString(1));
               planilla.setCodigo_planilla(result.getString(2));
               planilla.setEstado_planilla(result.getString(3));
               planilla.setTipo_ingreso(result.getString(4));
               planilla.setNombre_institucion_origen(result.getString(5));
               planilla.setNombre_institucion_destino(result.getString(6));
               planilla.setNombre_carrera_origen(result.getString(7));
               planilla.setNombre_carrera_destino(result.getString(8));
            }
            
            st.close();
            bd.terminarConexion(conexion);
            
            return planilla;
            
        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
        
        return planilla;
 
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
            System.out.println("Conexion en GP");
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery(consulta);
            
            PlanillaForm PlanillaF;
            
            while (rs.next()) {
                PlanillaF = new PlanillaForm();
                PlanillaF.setCedula_aspirante(rs.getString(1));
                PlanillaF.setCodigo_planilla(rs.getString(2));
                PlanillaF.setEstado_planilla(rs.getString(3));
                PlanillaF.setTipo_ingreso(rs.getString(4));
                PlanillaF.setNombre_institucion_origen(rs.getString(5));
                PlanillaF.setNombre_institucion_destino(rs.getString(6));
                PlanillaF.setNombre_carrera_origen(rs.getString(7));
                PlanillaF.setNombre_carrera_destino(rs.getString(8));
                listaPlanilla.add(PlanillaF);
            }

            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            System.out.println("Error al obtener lista de planillas.");
        }
        return listaPlanilla; 
    }
    
    public ArrayList<PlanillaForm> mostrarPlanillasPendientes() {
        
        String consulta = "SELECT * FROM PLANILLA WHERE ESTADO_PLANILLA = 'Pendiente'";
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
                PlanillaF.setNombre_institucion_origen(rs.getString(5));
                PlanillaF.setNombre_institucion_destino(rs.getString(6));
                PlanillaF.setNombre_carrera_origen(rs.getString(7));
                PlanillaF.setNombre_carrera_destino(rs.getString(8));
                listaPlanilla.add(PlanillaF);
            }

            
            
            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            System.out.println("Error al obtener lista de planillas.");
        }
        return listaPlanilla; 
    }
    
    public ArrayList<PlanillaForm> mostrarPlanillasAprobadas() {
        
        String consulta = "SELECT * FROM PLANILLA WHERE ESTADO_PLANILLA = 'Aprobada'";
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
                PlanillaF.setNombre_institucion_origen(rs.getString(5));
                PlanillaF.setNombre_institucion_destino(rs.getString(6));
                PlanillaF.setNombre_carrera_origen(rs.getString(7));
                PlanillaF.setNombre_carrera_destino(rs.getString(8));
                listaPlanilla.add(PlanillaF);
            }

            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            System.out.println("Error al obtener lista de planillas.");
        }
        return listaPlanilla; 
    }
      
    public ArrayList<PlanillaForm> mostrarPlanillasRechazadas() {
        
        String consulta = "SELECT * FROM PLANILLA WHERE ESTADO_PLANILLA = 'Rechazada'";
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
                PlanillaF.setNombre_institucion_origen(rs.getString(5));
                PlanillaF.setNombre_institucion_destino(rs.getString(6));
                PlanillaF.setNombre_carrera_origen(rs.getString(7));
         
                PlanillaF.setNombre_carrera_destino(rs.getString(8));
                listaPlanilla.add(PlanillaF);
            }

            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            System.out.println("Error al obtener lista de planillas.");
        }
        return listaPlanilla; 
    }
    
    public boolean aceptarPlanilla(PlanillaForm pf) {
        
        
        String update = "UPDATE PLANILLA SET ESTADO_PLANILLA='Aprobada' WHERE "
                + "CODIGO_PLANILLA = '" + pf.getCodigo_planilla() +"';";
        System.out.println(update);
        boolean res = false;
        
        try {
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            st.execute(update);
            st.close();
            res = true;
            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            System.out.println("Error al aceptar planilla.");
        }
        return res;
        
        
    }
    
    public boolean rechazarPlanilla(PlanillaForm pf) {
        
        
        String update = "UPDATE PLANILLA SET ESTADO_PLANILLA='Rechazada' WHERE "
                + "CODIGO_PLANILLA = '" + pf.getCodigo_planilla() +"';";
        boolean res = false;
        
        try {
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            st.execute(update);
            st.close();
            res = true;
            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            System.out.println("Error al rechazar planilla.");
        }
        return res;
        
        
    }
      
}
