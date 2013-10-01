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
public class GestionCarreraRequiereAsignatura {
    
    BaseDatos bd;
    
    public GestionCarreraRequiereAsignatura(){
        bd = new BaseDatos();
    }
    
    public boolean agregarRequiere(CarreraRequiereAsignaturaForm cf) {
        
    boolean res = false;
        
        String insercion = "INSERT INTO REQUIERE VALUES ('"+
                           cf.getCodigoAsignatura()+"','"+
                           cf.getCodigoInstitucion()+"','"+
                           cf.getCodigoCarrera()+"');";
                        
        try {
            
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            st.execute(insercion);
            st.close();
            res = true;
            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            System.out.println("ERROR: Problema al asociar carrera y materia.");
        }
        return res;
    }
    
    
    public boolean existeRequiere(CarreraRequiereAsignaturaForm cf) {
        
        String consulta = "SELECT Count(*) FROM REQUIERE WHERE (CODIGO_ASIGNATURA = '"+
                     cf.getCodigoAsignatura()+"') AND (CODIGO_INSTITUCION = '"+
                     cf.getCodigoInstitucion()+"') AND (CODIGO_CARRERA = '"+
                     cf.getCodigoCarrera()+"'); ";
                        
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
    
    
    public boolean eliminarRequiere(CarreraRequiereAsignaturaForm cf) {
        
    boolean res = false;
        
        String query = "DELETE FROM REQUIERE WHERE (CODIGO_ASIGNATURA = '"+
                     cf.getCodigoAsignatura()+"') AND (CODIGO_INSTITUCION = '"+
                     cf.getCodigoInstitucion()+"') AND (CODIGO_CARRERA = '"+
                     cf.getCodigoCarrera()+"'); ";
        
        System.out.println(query);
        
        if (existeRequiere(cf)) {
            
            try {

                Connection conexion = bd.establecerConexion();
                Statement st = conexion.createStatement();
                st.execute(query);
                st.close();
                res = true;
                bd.terminarConexion(conexion);

            } catch(Exception e) {
                System.out.println("ERROR: Problema al eliminar un Requiere.");
            }
            
        }  
        return res;
    }
    
    public ArrayList<AsignaturaForm> listarAsignaturasNoAsociadas(
                                        CarreraRequiereAsignaturaForm cf){
        
        ArrayList<AsignaturaForm> listaAsig = new ArrayList();
        AsignaturaForm af;
        
        String query = "SELECT * FROM ASIGNATURA A WHERE (A.CODIGO_INSTITUCION='" +
                       cf.getCodigoInstitucion() + "') AND A.CODIGO_ASIGNATURA "+
                       "NOT IN (SELECT CODIGO_ASIGNATURA FROM REQUIERE R WHERE"+
                       "(A.CODIGO_INSTITUCION = R.CODIGO_INSTITUCION) AND "+
                       "(R.CODIGO_INSTITUCION ='"+cf.getCodigoInstitucion()+
                       "')AND(R.CODIGO_CARRERA = '"+cf.getCodigoCarrera()+"'))";
        System.out.println(query);
        
        try {
            /* Se establece la conexion con la base de datos */
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            /* Se ejecuta la consulta */
            ResultSet rs = st.executeQuery(query);
            
            /* Mientras hayan mas filas por explorar se crea un nuevo
             * form con los valores de dicha fila y se agrega en la lista
             * de asignaturas para la institucion especificada
             */
            while (rs.next()) {
                af = new AsignaturaForm();
                af.setCodigoInstitucion(rs.getString(1));
                af.setCodigoAsignatura(rs.getString(2));
                af.setNombreAsignatura(rs.getString(3));
                af.setCreditos(rs.getInt(4));
                listaAsig.add(af);
            }

            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            String error = 
                    "ERROR: Problema al obtener lista de asignaturas de la BD";
            System.out.println(error);
        }
        return listaAsig;
    }
    
}
