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
 * @author arturo
 */

/*
 * Clase para la gestion de asignaturas, contiene los metodos que ejecutan
 * las asignaturas
 */
public class GestionAsignatura {
    
    BaseDatos bd;
    
    /* Constructor para la clase */
    public GestionAsignatura(){
        bd = new BaseDatos();
    }
    
    /* Metodo para agregar una asignatura a la base de datos */
    public boolean agregarAsignatura(AsignaturaForm af) {
        
        /* Declaramos una variable para almacenar el resultado final */
        boolean res = false;
        
        String insercion = "INSERT INTO ASIGNATURA VALUES ('"+
                            af.getCodigoInstitucion()+"','"+
                            af.getCodigoAsignatura()+"','"+
                            af.getNombreAsignatura()+"',"+
                            af.getCreditos()+");";
        System.out.println(insercion);
        try {

            /* Se establece la conexion a la base de datos */
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            /* Se inserta la tupla en la base de datos */
            st.execute(insercion);
            res = true;
            st.close();
            bd.terminarConexion(conexion);

        } catch(Exception e) {
            String error = 
                   "ERROR: Problema al agregar asignatura a la Base de Datos.";
            System.out.println(error);
        }
        
        return res;
    }
    
    
    /* Metodo para verificar la existencia de una asignatura en la BD */
    public boolean existeAsignatura(String codigoInstitucion,
                                             String codigoAsignatura ) {
        
        /* Variable para el resultado final */
        int res = 0;
        
        String query = 
               "SELECT COUNT(*) FROM ASIGNATURA WHERE (CODIGO_INSTITUCION = '"+
               codigoInstitucion+"') AND (CODIGO_ASIGNATURA ="+
               "'"+codigoAsignatura+"')";
        
        try {
            /* Se establece la conexion a la base de datos */
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            /* Se ejecuta la consulta */
            ResultSet result = st.executeQuery(query);
            
            if (result.next()) {
               /* Si se extrae el valor 0. No existe la asignatura. */
               /* Si se extrae el valor 1. La asignatura si existe. */
               res = result.getInt(1); 
            }
            /* Se cierran las conexiones a la base de datos */
            st.close();
            bd.terminarConexion(conexion);

        } catch(Exception e) {
            String error = 
                  "ERROR: Problema al ver existencia de una Asignatura.";
            System.out.println(error);
        }
        
        return (res != 0);
    }
    
    /* Metodo para eliminar una asignatura de la base de datos */
    public boolean eliminarAsignatura(AsignaturaForm af) {
        
        /* Declaramos una variable para almacenar el resultado final */
        boolean res = false;
        
        String query = "DELETE FROM ASIGNATURA WHERE (CODIGO_INSTITUCION = '"+
                       af.getCodigoInstitucion()+"') AND (CODIGO_ASIGNATURA ="+
                       "'"+af.getCodigoAsignatura()+"')";
        
        if (existeAsignatura(af.getCodigoInstitucion(), 
                             af.getCodigoAsignatura())) {
            try {

                /* Se establece la conexion a la base de datos */
                Connection conexion = bd.establecerConexion();
                Statement st = conexion.createStatement();
                /* Se inserta la tupla en la base de datos */
                st.execute(query);
                res = true;
                st.close();
                bd.terminarConexion(conexion);

            } catch(Exception e) {
                String error = 
                  "ERROR: Problema al eliminar asignatura a la Base de Datos.";
                System.out.println(error);
            }
        }
        return res;
    }
    
    
    /* Metodo para obtener la informacion de una asignatura */
    public AsignaturaForm obtenerAsignatura(String codigoInstitucion,
                                             String codigoAsignatura ) {
        
        AsignaturaForm af = new AsignaturaForm();
        
        String consulta = 
                "SELECT * FROM ASIGNATURA WHERE (CODIGO_INSTITUCION = '"+
                codigoInstitucion+"') AND (CODIGO_ASIGNATURA ="+
                "'"+codigoAsignatura+"')";
                
        System.out.println(consulta);
        try {
            /* Se establece la conexion a la base de datos*/
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            /* Se ejecuta la consulta*/
            ResultSet rs = st.executeQuery(consulta);
            
            /* Obtenemos y establecemos los valores del Form */
            if (rs.next()) {
                af.setCodigoInstitucion(rs.getString(1));
                af.setCodigoAsignatura(rs.getString(2));
                af.setNombreAsignatura(rs.getString(3));
                af.setCreditos(rs.getInt(4));
            }
            /* Se cierra la conexion a la base de datos */
            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            String error = 
                    "ERROR: Problema al obtener una asignatura de la BD";
            System.out.println(error);
        }
        
        return af; 
    }
    
    /* Metodo para obtener la lista de asignatura de una institucion
       y una carrera */
    public ArrayList<AsignaturaForm> listarAsignaturas(
                                             String codigoInstitucion,
                                             String codigoCarrera    ) {
        
        ArrayList<AsignaturaForm> listaAsig = new ArrayList();
        AsignaturaForm af;
        
        String consulta = 
                "SELECT A.* FROM ASIGNATURA A, REQUIERE R WHERE "+
                "(R.CODIGO_INSTITUCION = '"+codigoInstitucion+
                "')AND(R.CODIGO_CARRERA='"+codigoCarrera+
                "') AND (A.CODIGO_ASIGNATURA = R.CODIGO_ASIGNATURA)"+
                " AND (R.CODIGO_INSTITUCION = A.CODIGO_INSTITUCION)";
        
        try {
            /* Se establece la conexion con la base de datos */
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            /* Se ejecuta la consulta */
            ResultSet rs = st.executeQuery(consulta);
            
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
    
    /* Metodo para obtener la lista de asignatura de una institucion */
    public ArrayList<AsignaturaForm> listarAsignaturas(
                                             String codigoInstitucion) {
        
        ArrayList<AsignaturaForm> listaAsig = new ArrayList();
        AsignaturaForm af;
        
        String consulta = 
                "SELECT * FROM ASIGNATURA WHERE (CODIGO_INSTITUCION = '"+
                codigoInstitucion+"')";
        
        try {
            /* Se establece la conexion con la base de datos */
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            /* Se ejecuta la consulta */
            ResultSet rs = st.executeQuery(consulta);
            
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
    
    /* Metodo para obtener la lista de asignatura de la base de datos */
    public ArrayList<AsignaturaForm> listarAsignaturas() {
        
        ArrayList<AsignaturaForm> listaAsig = new ArrayList();
        AsignaturaForm af;
        
        String consulta = "SELECT * FROM ASIGNATURA";
        
        try {
            /* Se establece la conexion con la base de datos */
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            /* Se ejecuta la consulta */
            ResultSet rs = st.executeQuery(consulta);
              
            /* Mientras hayan mas filas por explorar se crea un nuevo
             * form con los valores de dicha fila y se agrega en la lista
             * de asignaturas de todas las instituciones
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
    
    /* Metodo para modificar una asignatura */
    public boolean modificarAsignatura(AsignaturaForm af) {
        
        /* Variable booleana para el resultdo de la operacion */
        boolean res = false;
        
        String query = "UPDATE ASIGNATURA SET NOMBRE_ASIGNATURA = '"+
                        af.getNombreAsignatura()+"', CREDITOS ="+
                        af.getCreditos()+" WHERE (CODIGO_INSTITUCION = '"+
                        af.getCodigoInstitucion()+"')AND(CODIGO_ASIGNATURA='"+
                        af.getCodigoAsignatura()+"')";
        
        try {
            /* Se establece la conexion con la base de datos */
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            /* Se ejecuta la consultas */
            st.execute(query);
            st.close();
            res = true;
            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            String error = "ERROR: Problema al modificar asignatura";
            System.out.println(error);
        }
        
        return res;
    }
    
}
