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
/* Clase para insertar, consultar, modificar, eliminar
 * tablas de equivalencia en la base de datos
 */
public class GestionTablaEquivalencia {
    
    BaseDatos bd;
    
    /* Constructor de clase */
    public GestionTablaEquivalencia() {
        bd = new BaseDatos();
    }
    
    /* Metodo para agregar una tabla de equivalencia a la base de datos */
    public boolean agregarTablaEquivalencia(TablaEquivalenciaForm tf){
        
        /* Creamos una variable donde se almacena el resultado */
        boolean res = false;
        /* Creamos el string con el query en sql */
        String insercion = "INSERT INTO TABLA_EQUIVALENCIA VALUES('"+
                            tf.getCodigoInstitucionOrigen()+"','"+
                            tf.getCodigoCarreraOrigen()+"','"+
                            tf.getCodigoInstitucionDestino()+"','"+
                            tf.getCodigoCarreraDestino()+
                            "', CURRENT_DATE)";
        System.out.print(insercion);
        try {
            /* Se establece conexion con la base de datos */
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            /* Se ejecuta el query */
            st.execute(insercion);
            st.close();
            /* Se tuvo exito al ejecutar el query, cambiamos resultado a true */
            res = true;
            /* Se cierra la conexion con la base de datos */
            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            String error = 
                    "ERROR: No se pudo registrar la tabla de equivalencia.";
            System.out.println(error);
        }
        return res;
    }
    
    
    /* Metodo para modificar una tabla de equivalencia existente */
    public boolean modificarTablaEquivalencia(TablaEquivalenciaForm tf) {
        
        /* Creamos una variable para almacenar el resultado final */
        boolean res = false;
        return res;
    }
    
    
    public boolean eliminarTablaEquivalencia(TablaEquivalenciaForm tf) {
        
        /* Creamos una variable para almacenar el resultado final */
        boolean res = false;
        String query = "DELETE FROM TABLA_EQUIVALENCIA WHERE"+
                       " (CODIGO_INSTITUCION_ORIG = '"+
                       tf.getCodigoInstitucionOrigen()+
                       "') AND (CODIGO_CARRERA_ORIG = '"+
                       tf.getCodigoCarreraOrigen()+
                       "') AND (CODIGO_INSTITUCION_DEST = '"+
                       tf.getCodigoInstitucionDestino()+
                       "') AND (CODIGO_CARRERA_DEST = '"+
                       tf.getCodigoCarreraDestino()+"')";
        
        try {
            /* Se establece conexion con la base de datos */
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            /* Se ejecuta el query */
            st.execute(query);
            st.close();
            /* Se tuvo exito al ejecutar el query, cambiamos resultado a true */
            res = true;
            /* Se cierra la conexion con la base de datos */
            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            String error = 
                    "ERROR: No se pudo eliminar la tabla de equivalencia.";
            System.out.println(error);
        }
        return res;
    }
    
    /* Metodo para verificar la existencia de una tabla de equivalencia */
    public boolean existeTablaEquivalencia(String codigoInstitucionOrigen,
                                           String codigoCarreraOrigen,
                                           String codigoInstitucionDestino,
                                           String codigoCarreraDestino) {
        
        /* Generamos un string con la consulta */
        String consulta = "SELECT Count(*) FROM TABLA_EQUIVALENCIA WHERE"+
                          " (CODIGO_INSTITUCION_ORIG = '"+
                          codigoInstitucionOrigen+
                          "') AND (CODIGO_CARRERA_ORIG = '"+
                          codigoCarreraOrigen+
                          "') AND (CODIGO_INSTITUCION_DEST = '"+
                          codigoInstitucionDestino+
                          "') AND (CODIGO_CARRERA_DEST = '"+
                          codigoCarreraDestino+"')";
        
        /* Variable donde se almacena el resultado de la consulta */
        int rs = 0;
        
        try {
            
            /* Se realiza la conexion a la base de datos */
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            
            /* Se ejecuta la consulta */
            ResultSet result = st.executeQuery(consulta);
            
            /* Se extrae de la consulta el resultado del count */
            if (result.next()) {
               rs = result.getInt(1); 
            }
            
            /* Se cierra la conexion a la base de datos */
            st.close();
            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
        /* Devuelve TRUE si se consiguio una fila. FALSE si no. */
        return (rs != 0);
    }
    
    /* Metodo para obtener toda la informacion de una tabla de equivalencia*/
    public TablaEquivalenciaForm obtenerTablaEquivalencia(
                                           String codigoInstitucionOrigen,
                                           String codigoCarreraOrigen,
                                           String codigoInstitucionDestino,
                                           String codigoCarreraDestino) {
        
        /* Declaramos variable donde almacenar el resultado */
        TablaEquivalenciaForm tf = new TablaEquivalenciaForm();
        
        /* Creamos el String con la consulta */
        String consulta = "SELECT * FROM TABLA_EQUIVALENCIA WHERE"+
                          " (CODIGO_INSTITUCION_ORIG = '"+
                          codigoInstitucionOrigen+
                          "') AND (CODIGO_CARRERA_ORIG = '"+
                          codigoCarreraOrigen+
                          "') AND (CODIGO_INSTITUCION_DEST = '"+
                          codigoInstitucionDestino+
                          "') AND (CODIGO_CARRERA_DEST = '"+
                          codigoCarreraDestino+"')";
        
        try {
            /* Se establece conexion con la base de datos */
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            /* Se ejecuta la consulta */
            ResultSet rs = st.executeQuery(consulta);
            /* Se almacena el resultado de la consulta en la variable */
            if (rs.next()) {
                tf.setCodigoInstitucionOrigen(rs.getString(1));
                tf.setCodigoCarreraOrigen(rs.getString(2));
                tf.setCodigoInstitucionDestino(rs.getString(3));
                tf.setCodigoCarreraDestino(rs.getString(4));
                tf.setFechaModificacion(rs.getString(5));
            }
            /* Se cierra la conexion */
            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            String error =
                    "ERROR: Problema al obtener una tabla de equivalencia.";
            System.out.println(error);
        }
        /* Se devuelve el resultado de la consulta */
        return tf;
    }
    
    /* Lista las tablas de equivalencia de TODAS las carreras */
    public ArrayList<TablaEquivalenciaForm> listarTablasEquivalencia() {
        
        String consulta = "SELECT * FROM TABLA_EQUIVALENCIA";
        ArrayList<TablaEquivalenciaForm> listaTablas = new ArrayList();
                
        try {
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery(consulta);
            
            TablaEquivalenciaForm tf;
            
            while (rs.next()) {
                tf = new TablaEquivalenciaForm();
                tf.setCodigoInstitucionOrigen(rs.getString(1));
                tf.setCodigoCarreraOrigen(rs.getString(2));
                tf.setCodigoInstitucionDestino(rs.getString(3));
                tf.setCodigoCarreraDestino(rs.getString(4));
                tf.setFechaModificacion(rs.getString(5));
                listaTablas.add(tf);
            }

            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            String error =
                    "ERROR: Problema al listar las tablas de equivalencia.";
            System.out.println(error);
        }
        return listaTablas; 
    }
    
    /* Lista las tablas de equivalencia de una carrera en especifico */
    public ArrayList<TablaEquivalenciaForm> listarTablasEquivalencia(
                                            String codigoInstitucionOrigen, 
                                            String codigoInstitucionDestino) {
        
        String consulta = "SELECT * FROM TABLA_EQUIVALENCIA WHERE"+
                          " (CODIGO_INSTITUCION_ORIG = '"+
                          codigoInstitucionOrigen+
                          "') AND (CODIGO_INSTITUCION_DEST = '"+
                          codigoInstitucionDestino+"');";
        
        ArrayList<TablaEquivalenciaForm> listaTablas = new ArrayList();
        
        try {
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            ResultSet rs = st.executeQuery(consulta);
            
            TablaEquivalenciaForm tf;
            
            while (rs.next()) {
                tf = new TablaEquivalenciaForm();
                tf.setCodigoInstitucionOrigen(rs.getString(1));
                tf.setCodigoCarreraOrigen(rs.getString(2));
                tf.setCodigoInstitucionDestino(rs.getString(3));
                tf.setCodigoCarreraDestino(rs.getString(4));
                tf.setFechaModificacion(rs.getString(5));
                listaTablas.add(tf);
            }

            bd.terminarConexion(conexion);
            
        } catch(Exception e) {
            String error =
                    "ERROR: Problema al listar las tablas de equivalencia.";
            System.out.println(error);
        }
        return listaTablas;
    }
    
    public ArrayList<EquivalenciaForm> obtenerEquivalencias(TablaEquivalenciaForm tablaEquiv) {
        
        String codigoInstOrigen = tablaEquiv.getCodigoInstitucionOrigen();
        String codigoInstDestino = tablaEquiv.getCodigoInstitucionDestino();
        String codigoCarreraOrigen = tablaEquiv.getCodigoCarreraOrigen();
        String codigoCarreraDestino = tablaEquiv.getCodigoCarreraDestino();
        
        String consulta = "SELECT * FROM EQUIVALENCIA WHERE "
                        + "(CODIGO_INSTITUCION_ORIG = '"
                        +codigoInstOrigen+"')AND"
                        + "(CODIGO_INSTITUCION_DEST = '"
                        +codigoInstDestino+"')AND"
                        + "(CODIGO_CARRERA_ORIG = '"
                        +codigoCarreraOrigen+"')AND"
                        + "(CODIGO_CARRERA_DEST = '"
                        +codigoCarreraDestino+"');";
        
        ArrayList<EquivalenciaForm> listaEquivalencias = new ArrayList();
        
        try {
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
            ResultSet rsEquiv = st.executeQuery(consulta);
            GestionAsignatura gestionAsignatura = new GestionAsignatura();
            
            EquivalenciaForm equivActual;
            
            ResultSet rsOrigen;
            ResultSet rsDestino;

            String codigoEquivalencia;
            
            ArrayList<AsignaturaForm> asignaturasOrigen;
            ArrayList<AsignaturaForm> asignaturasDestino;
            
            while (rsEquiv.next()) {
                                
                equivActual = new EquivalenciaForm();
                equivActual.setTablaPadre(tablaEquiv);
                
                codigoEquivalencia = rsEquiv.getString("codigo_equivalencia");
                equivActual.setCodigoEquivalencia(codigoEquivalencia);
                
                String consultaAsignaturasOrigen = "SELECT * FROM INCLUYE WHERE "
                        + "(CODIGO_INSTITUCION_ORIG='"+codigoInstOrigen+"')AND"
                        + "(CODIGO_CARRERA_ORIG='"+codigoCarreraOrigen+"')AND"
                        + "(CODIGO_INSTITUCION_DEST='"+codigoInstDestino+"')AND"
                        + "(CODIGO_CARRERA_DEST='"+codigoCarreraDestino+"')AND"
                        + "(CODIGO_EQUIVALENCIA='"+codigoEquivalencia+"');";
                
                st = conexion.createStatement();
                rsOrigen = st.executeQuery(consultaAsignaturasOrigen);
                
                asignaturasOrigen = new ArrayList();
                                
                while (rsOrigen.next()){
                    
                    asignaturasOrigen.add(
                            gestionAsignatura.obtenerAsignatura(
                            codigoInstOrigen, rsOrigen.getString("codigo_asignatura")));
                    
                }
                
                equivActual.setAsignaturasOrigen(asignaturasOrigen);

                String consultaAsignaturasDestino = "SELECT * FROM EQUIVALE WHERE "
                        + "(CODIGO_INSTITUCION_ORIG='"+codigoInstOrigen+"')AND"
                        + "(CODIGO_CARRERA_ORIG='"+codigoCarreraOrigen+"')AND"
                        + "(CODIGO_INSTITUCION_DEST='"+codigoInstDestino+"')AND"
                        + "(CODIGO_CARRERA_DEST='"+codigoCarreraDestino+"')AND"
                        + "(CODIGO_EQUIVALENCIA='"+codigoEquivalencia+"');";
                
                st = conexion.createStatement();
                rsDestino = st.executeQuery(consultaAsignaturasDestino);
                
                asignaturasDestino = new ArrayList();
                
                AsignaturaForm actual;
                
                while (rsDestino.next()){

                    actual = gestionAsignatura.obtenerAsignatura(
                             codigoInstDestino, rsDestino.getString("codigo_asignatura"));
                    
                    asignaturasDestino.add(actual);
                    
                }
                
                equivActual.setAsignaturasDestino(asignaturasDestino);
                
                listaEquivalencias.add(equivActual);

           }
     
           bd.terminarConexion(conexion);
          
            
        } catch(Exception e) {
            String error =
                    "ERROR: Problema al listar las equivalencias de una tabla";
            System.out.println(error);
            
        }
        return listaEquivalencias;
    }
}
