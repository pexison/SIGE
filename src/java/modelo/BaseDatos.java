/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.sql.*;

/**
 *
 * @author fertaku
 */

/* Clase para conectarse y desconectarse de la base de datos */
public class BaseDatos {
    
    /* Constructor */
    public void BaseDatos(){
    }
    
    /* Metodo para conectarse a la base de datos */
    public Connection establecerConexion() {
        
        Connection conexion = null;
        
        String url = "Jdbc:postgresql://localhost:5432/equivalencia";
        
        try {
           Class.forName("org.postgresql.Driver");
           conexion = 
           DriverManager.getConnection(url, "postgres", "postgres");
           
           if (conexion != null) {
               System.out.println("...Conectando a la base de datos...");
           }
           
        } catch(Exception e){
            System.out.println("Problema al conectarse a la base de datos.");
        }
        
        return conexion;
    }
    
    /* Metodo para desconectarse a la base de datos */
    public void terminarConexion(Connection conexion) {
        try {
            conexion.close();
        } catch(Exception e) {
            System.out.println("Problema al desconectarse de la base de datos");
        }
    }
}
