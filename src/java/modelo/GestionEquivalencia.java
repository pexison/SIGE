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
 * @author andreso
 */
public class GestionEquivalencia {
    
    BaseDatos bd;
    
    public GestionEquivalencia(){
        bd = new BaseDatos();
    }
    
    /* Metodo para agregar una asignatura a la base de datos */
    public boolean agregarEquivalencia(EquivalenciaForm eq) {
        
       boolean res = false;

       try {

          /* Se establece la conexion a la base de datos */    
          Connection conexion = bd.establecerConexion();
          Statement st = conexion.createStatement();  
          /* Declaramos una variable para almacenar el resultado final */
        
          /*Obtenemos los arreglos que corresponden a las asignaturas de origen*/
          String[] asigOrig = eq.getSelectedOptionsOrigen();
          String[] asigDest = eq.getSelectedOptionsDestino();


          String insercionIncluye  = "";
          String insercionEquivale = "";
          String codigoInstitucionOrigen  = eq.getCodigoInstitucionOrigen();
          String codigoInstitucionDestino = eq.getCodigoInstitucionDestino();
          String codigoCarreraOrigen      = eq.getCodigoCarreraOrigen();
          String codigoCarreraDestino     = eq.getCodigoInstitucionDestino();
         
          String maximoCodigo = "SELECT max(codigo_equivalencia) FROM equivalencia;";
          st.execute(maximoCodigo);

          String nuevoCodigo = ((Integer)(Integer.getInteger(maximoCodigo) + 1)).toString();
          String insertEquivale = "INSERT INTO EQUIVALENCIA VALUES ('"+
                            codigoInstitucionOrigen + "','" +
                            codigoCarreraOrigen+"','"+
                            codigoInstitucionDestino+"','"+
                            codigoCarreraDestino+"','"+
                            nuevoCodigo +                   
                            "');";
        
          for (int i=0; i<asigOrig.length; i++) {
              insercionIncluye = insercionIncluye + "INSERT INTO INCLUYE VALUES ('"+
                            codigoInstitucionOrigen+"','"+
                            codigoCarreraOrigen+"','"+
                            asigOrig[i]+"','"+
                            codigoInstitucionDestino+"','"+
                            codigoCarreraDestino+"','"+
                            nuevoCodigo+
                            "');";
          }
          System.out.println(insercionIncluye);
                
          for (int j=0; j<asigDest.length; j++) {
              insercionEquivale = "INSERT INTO EQUIVALE VALUES ('"+
                            codigoInstitucionOrigen+"','"+
                            codigoCarreraOrigen+"','"+
                            codigoInstitucionDestino+"','"+
                            codigoCarreraDestino+"','"+
                            asigDest[j]+"','"+
                            nuevoCodigo+
                            "');";
          }
          System.out.println(insercionEquivale);

        

          /* Se inserta la tupla en la base de datos */
          st.execute(insercionEquivale);
          st.execute(insercionIncluye);
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
    
 }
