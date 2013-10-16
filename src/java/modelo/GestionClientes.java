/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.sql.*;
import frijoles.*;
import java.util.ArrayList;

/**
 *
 * @author fertaku
 */
public class GestionClientes {
    
    BaseDatos bd;
    
    public GestionClientes(){
        bd = new BaseDatos();
    }
    
    public boolean validar(ValidacionForm vf) {
        
        boolean resultado = false;
        
        try {
            
            Connection conexion = bd.establecerConexion();
            
            String consulta = "SELECT * FROM USUARIO "+
                              "WHERE (ID_USUARIO ='"+vf.getUsuario()+"') AND "+
                              "(CLAVE ='"+vf.getClave()+"')";
            
            System.out.println(consulta);
            
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery(consulta);
            resultado = rs.next();
            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            System.out.println("Error al validar usuario.");
        }
        return resultado;
    }
    
    
    public boolean registrar(RegistroForm rf) {
        String insercion = "INSERT INTO USUARIO VALUES ('"+
                           rf.getUsuario()+ "','"+rf.getClave()+"','"+
                           rf.getNombre()+"','"+rf.getApellido()+"','"+
                           rf.getEmail()+"','"+ rf.getTipoUsuario()+"');";
        
        System.out.println(insercion);
        
        try {
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            st.execute(insercion);
            st.close();
            bd.terminarConexion(conexion);
            //System.out.println("Insertao");
            
        } catch(Exception e) {
            System.out.println("Error al registrar usuario.");
            return false;
        }
        return true;
    }
    
     public ArrayList<String> mostrarTipoUsuario() {
        
        String consulta = "SELECT * FROM TIPO_USUARIO";
        ArrayList listaTipos = new ArrayList();
                
        try {
            Connection conexion = bd.establecerConexion();           
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery(consulta);
            
            String tipoUsuario;
            
            while (rs.next()) {
                tipoUsuario = rs.getString(1);
                listaTipos.add(tipoUsuario);
                System.out.println(tipoUsuario);
            }

            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            System.out.println(e.getMessage());
            System.out.println("Error al obtener lista tipo usuario.");
        }
        System.out.println(listaTipos);
        return listaTipos; 
    }
     
    
    public RegistroForm obtenerCliente(String id_usuario) {
        
        String consulta = "SELECT * FROM USUARIO WHERE (ID_USUARIO"+
                          "='"+id_usuario+"')";
        
        RegistroForm RegF = null;
                
        try {
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery(consulta);
            
            
            
            while (rs.next()) {
                RegF = new RegistroForm();
                RegF.setUsuario(rs.getString(1));
                RegF.setClave(rs.getString(2));
                RegF.setNombre(rs.getString(3));
                RegF.setApellido(rs.getString(4));
                RegF.setEmail(rs.getString(5));
                RegF.setTipoUsuario(rs.getString(6));
            }

            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            System.out.println("Error al obtener el cliente.");
        }
        return RegF; 
    } 
     
}
