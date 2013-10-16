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
public class GestionInstitucion {
       
    BaseDatos bd;
    
    public GestionInstitucion(){
        bd = new BaseDatos();
    }
    
    public boolean agregarInstitucion(InstitucionForm rf) {
        boolean res = false;
        
        String insercion = "INSERT INTO INSTITUCION VALUES ('"+
                           rf.getCodigoInstitucion()+"','"+
                           rf.getNombreInstitucion()+"','"+
                           rf.getDireccionInstitucion()+"','"+
                           rf.getPaisInstitucion()+"');";
                
        try {
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            st.execute(insercion);
            st.close();
            res = true;
            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            System.out.println("Error al registrar institucion.");
        }
        return res;
        
    }
    
    public boolean existeInstitucion(String codigoInst) {
        
        String consulta = "SELECT Count(*) FROM INSTITUCION WHERE ("+
                          "codigo_institucion='"+codigoInst +"')";
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
    
    public ArrayList<InstitucionForm> mostrarInstitucion() {
        
        String consulta = "SELECT * FROM INSTITUCION";
        ArrayList listaInst = new ArrayList();
                
        try {
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery(consulta);
            
            InstitucionForm InstF;
            
            while (rs.next()) {
                InstF = new InstitucionForm();
                InstF.setCodigoInstitucion(rs.getString(1));
                InstF.setNombreInstitucion(rs.getString(2));
                InstF.setDireccionInstitucion(rs.getString(3));
                InstF.setPaisInstitucion(rs.getString(4));
                listaInst.add(InstF);
            }

            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            System.out.println("Error al obtener lista institucion.");
        }
        return listaInst; 
    }
    
    public boolean eliminarInstitucion(InstitucionForm rf) {
        
        boolean res = false;
        
        String delete = "DELETE FROM INSTITUCION WHERE ("+
                        "codigo_institucion='"+rf.getCodigoInstitucion()+
                        "')";
        boolean existe = existeInstitucion(rf.getCodigoInstitucion());
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
                System.out.println("Error al eliminar institucion.");
            }
        }
        return res;
        
    }
    
    public boolean modificarInstitucion(InstitucionForm rf) {
        
        boolean res = false;
        
        String update = "UPDATE INSTITUCION SET NOMBRE_INSTITUCION='"+
                        rf.getNombreInstitucion()+ "',DIRECCION='"+
                        rf.getDireccionInstitucion()+"', PAIS='"+
                        rf.getPaisInstitucion()+"' WHERE (CODIGO_INSTITUCION='"+
                        rf.getCodigoInstitucion()+"');";

        try {
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            st.execute(update);
            st.close();
            res = true;
            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            System.out.println("Error al modificar institucion.");
        }
        return res;
        
    }
    
    public InstitucionForm obtenerInstitucion(String codigoInst) {
        
        String consulta = "SELECT * FROM INSTITUCION WHERE (CODIGO_INSTITUCION"+
                          "='"+codigoInst+"')";
        
        InstitucionForm InstF = null;
                
        try {
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery(consulta);
            
            
            
            while (rs.next()) {
                InstF = new InstitucionForm();
                InstF.setCodigoInstitucion(rs.getString(1));
                InstF.setNombreInstitucion(rs.getString(2));
                InstF.setDireccionInstitucion(rs.getString(3));
                InstF.setPaisInstitucion(rs.getString(4));
            }

            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            System.out.println("Error al obtener lista institucion.");
        }
        return InstF; 
    }
    
    public ArrayList<CarreraForm> mostrarCarreras(String codigoInst) {
        
        String consulta = "SELECT * FROM CARRERA WHERE CODIGO_INSTITUCION='"+
                           codigoInst+"'";
        ArrayList listaCarr = new ArrayList();
                
        try {
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery(consulta);
            
            CarreraForm CarrF;
            
            while (rs.next()) {
                CarrF = new CarreraForm();
                CarrF.setCodigoCarrera(rs.getString(1));
                CarrF.setCodigoInstitucion(rs.getString(2));
                CarrF.setNombreCarrera(rs.getString(3));
                listaCarr.add(CarrF);
            }

            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            System.out.println("Error al obtener lista de carreras de "+
                               codigoInst);
        }
        return listaCarr; 
    }
    
     public ArrayList<String> mostrarPaises() {
        
        String consulta = "SELECT * FROM PAIS";
        ArrayList listaPaises = new ArrayList();
                
        try {
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery(consulta);
            
            String Pais;
            
            while (rs.next()) {
                Pais = rs.getString(1);
                listaPaises.add(Pais);
                System.out.println(Pais);
            }

            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            System.out.println("Error al obtener lista de paises.");
        }
        return listaPaises; 
    }
    
}
