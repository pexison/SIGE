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
public class GestionCarrera {
    
    BaseDatos bd;
    
    public GestionCarrera(){
        bd = new BaseDatos();
    }
    
    public boolean agregarCarrera(CarreraForm cf) {
    boolean res = false;
        
        String insercion = "INSERT INTO CARRERA VALUES ('"+
                           cf.getCodigoCarrera()+"','"+
                           cf.getCodigoInstitucion()+"','"+
                           cf.getNombreCarrera()+"');";
                        
        try {
            
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            st.execute(insercion);
            st.close();
            res = true;
            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            System.out.println("Error al registrar carrera.");
        }
        return res;
    }

    
    public boolean modificarCarrera(CarreraForm cf) {
        
        boolean res = false;
        
        String update = "UPDATE CARRERA SET NOMBRE_CARRERA='"+
                        cf.getNombreCarrera()+"' WHERE (CODIGO_INSTITUCION='"+
                        cf.getCodigoInstitucion()+"') AND (CODIGO_CARRERA='"+
                        cf.getCodigoCarrera()+"')";
        try {
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            st.execute(update);
            st.close();
            res = true;
            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            System.out.println("Error al modificar carrera.");
        }
        return res;
        
    }
    
    public CarreraForm obtenerCarrera(String codigoInst, String codCarr) {
        
        String consulta = "SELECT * FROM CARRERA WHERE (CODIGO_INSTITUCION"+
                          "='"+codigoInst+"') AND (CODIGO_CARRERA='"+
                           codCarr+"')";
        
        CarreraForm CarrF = new CarreraForm();
        System.out.println(consulta);
        
        try {
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery(consulta);
            
            
            
            while (rs.next()) {
                CarrF.setCodigoCarrera(rs.getString(1));
                CarrF.setCodigoInstitucion(rs.getString(2));
                CarrF.setNombreCarrera(rs.getString(3));
            }

            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            System.out.println("ERROR: Problema al obtener una carrera de la BD.");
        }
        return CarrF; 
    }
        
    public boolean existeCarrera(String codigoInst, String codCarr) {
        
        String consulta = "SELECT Count(*) FROM CARRERA WHERE ("+
                          "codigo_institucion='"+codigoInst+"')"+
                          " AND (codigo_carrera ='"+codCarr+"')";
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
    
    public boolean eliminarCarrera(CarreraForm cf) {
        
        boolean res = false;
        
        String delete = "DELETE FROM CARRERA WHERE ("+
                        "codigo_institucion='"+cf.getCodigoInstitucion()+
                        "') AND (CODIGO_CARRERA ='"+cf.getCodigoCarrera()+"')";
                
        boolean BULEANO = existeCarrera(cf.getCodigoInstitucion(),cf.getCodigoCarrera());
        
        try {
            if (BULEANO) {                
                //System.out.println("ENTRE EN EL IF");
                Connection conexion = bd.establecerConexion();
                Statement st = conexion.createStatement();
                st.execute(delete);
                res = true;
                st.close();
                bd.terminarConexion(conexion);
            } 
            
        } catch(Exception e) {
            System.out.println("Error al eliminar carrera.");
        }
        return res;
        
    }
    
}
