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
public class GestionAspirante {
    
     BaseDatos bd;
    
    public GestionAspirante(){
        bd = new BaseDatos();
    }
    
    public boolean agregarInstitucion(AspiranteForm af) {
        boolean res = false;
        
        
        String insercion = "INSERT INTO ASPIRANTE VALUES ('"
                +af.getId_usuario()+"','"
                +af.getCedula()+"','"
                +af.getSexo()+"','"
                +af.getEdad()+"','"
                +af.getPais()+"','"
                +af.getEdo_civil()+"','"
                +af.getLugar_nacimiento()+"','"
                +af.getNacionalidad()
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
            System.out.println("Error al registrar Aspirante.");
        }
        return res;
    }
    
     public boolean modificarAspirante(AspiranteForm af) {
        
        boolean res = false;
        
        String update = "UPDATE ASPIRANTE SET SEXO='"
                + af.getSexo()+"' ,EDAD='"
                + af.getEdad()+"',PAIS='"
                + af.getPais()+"', ESTADO_CIVIL='"
                + af.getEdo_civil()+"',LUGAR_NACIMIENTO='"
                + af.getLugar_nacimiento()+"',NACIONALIDAD='"
                + af.getNacionalidad()+" WHERE CEDULA='"+af.getCedula()+"';";

        try {
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            st.execute(update);
            st.close();
            res = true;
            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            System.out.println("Error al modificar aspirante.");
        }
        return res;
        
    }
     
     
    public boolean existeAspirante(String cedula) {
        
        String consulta = "SELECT Count(*) FROM ASPIRANTE WHERE "+
                          "CEDULA ='"+ cedula +"')";
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
     
      public boolean eliminarAspirante(AspiranteForm af) {
        
        boolean res = false;
        
        String delete = "DELETE FROM ASPIRANTE WHERE ("+
                        "cedula='"+af.getCedula()+
                        "')";
        boolean existe = existeAspirante(af.getCedula());
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
                System.out.println("Error al eliminar Aspirante.");
            }
        }
        return res;
        
    }
}