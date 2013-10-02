/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package modelo;
import java.sql.*;
import frijoles.*;
import java.util.ArrayList;
import java.lang.Integer;

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
          String codigoCarreraDestino     = eq.getCodigoCarreraDestino();

          String maximoCodigo = "SELECT max(codigo_equivalencia) FROM equivalencia;";
          ResultSet codigoMaximo = st.executeQuery(maximoCodigo);

          int codigoAnterior;
          
          System.out.println(codigoMaximo);
          
          if (codigoMaximo.next()) {
            codigoAnterior = codigoMaximo.getInt(1);
          } else {
            codigoAnterior = 0;  
          }         

          int codigoNuevo =  codigoAnterior + 1;
          
          String codigoNuevoString = ""+codigoNuevo;
          eq.setCodigoEquivalencia(codigoNuevoString);

          
          String insertEquivalencia = "INSERT INTO EQUIVALENCIA VALUES ('"+
                            codigoInstitucionOrigen + "','" +
                            codigoCarreraOrigen+"','"+
                            codigoInstitucionDestino+"','"+
                            codigoCarreraDestino+"','"+
                            codigoNuevoString +                   
                            "');";
       
          System.out.println("equivalePrimario: "+insertEquivalencia);

        
          for (int i=0; i<asigOrig.length; i++) {
              insercionIncluye = insercionIncluye + "INSERT INTO INCLUYE VALUES ('"+
                            codigoInstitucionOrigen+"','"+
                            codigoCarreraOrigen+"','"+
                            asigOrig[i]+"','"+
                            codigoInstitucionDestino+"','"+
                            codigoCarreraDestino+"','"+
                            codigoNuevoString+
                            "');";
          }
          System.out.println("incluye: "+insercionIncluye);
          
          insercionEquivale = "";
          
          for (int j=0; j<asigDest.length; j++) {
              insercionEquivale = insercionEquivale + " INSERT INTO EQUIVALE VALUES ('"+
                            codigoInstitucionOrigen+"','"+
                            codigoCarreraOrigen+"','"+
                            codigoInstitucionDestino+"','"+
                            codigoCarreraDestino+"','"+
                            asigDest[j]+"','"+
                            codigoNuevoString+
                            "');";
          }
          System.out.println("equivale: "+insercionEquivale);

        

          /* Se inserta la tupla en la base de datos */
          st = conexion.createStatement();
          st.execute(insertEquivalencia);
          st = conexion.createStatement();
          st.execute(insercionIncluye);
          st = conexion.createStatement();
          st.execute(insercionEquivale);
          
          res = true;
          st.close();
          bd.terminarConexion(conexion);

        } catch(Exception e) {
            String error = 
                   "ERROR: Problema al agregar equivalencia a la Base de Datos.";
            System.out.println(error);
        }
        
        return res;
    }
    
    public boolean eliminarEquivalencia(EquivalenciaForm ef) {
        
       boolean res = false;
       
       String codEquiv = ef.getCodigoEquivalencia();
        
       String query = "DELETE FROM INCLUYE WHERE (CODIGO_EQUIVALENCIA = '"+codEquiv+"'); ";
       query = query + "DELETE FROM EQUIVALE WHERE (CODIGO_EQUIVALENCIA = '"+codEquiv+"'); ";
       query = query + "DELETE FROM EQUIVALENCIA WHERE (CODIGO_EQUIVALENCIA = '"+codEquiv+"');";
       
       try {
           
           /* Se establece la conexion a la base de datos */    
          Connection conexion = bd.establecerConexion();
          Statement st = conexion.createStatement();  
          st.execute(query);
          res = true;
          st.close();
          bd.terminarConexion(conexion);
           
       } catch(Exception e) {
            String error = 
                   "ERROR: Problema al eliminar equivalencia a la Base de Datos.";
            System.out.println(error);
        }
     
       return res;
    }
    
    
    
    public boolean modificarEquivalencia(EquivalenciaForm eq) {
        
        boolean res = false;
        
        
        try {
            /* Se establece la conexion a la base de datos */    
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();  

            String codigoEquivalencia = eq.getCodigoEquivalencia();

            /* Borramos todas las instancias de las tablas Incluye y Equivale
             * cuyo codigoEq sea el codigo de Equivalencia en cuestion
             */
            String remove = "DELETE FROM INCLUYE WHERE (CODIGO_EQUIVALENCIA = '"+codigoEquivalencia+"'); ";
            remove = remove + "DELETE FROM EQUIVALE WHERE (CODIGO_EQUIVALENCIA = '"+codigoEquivalencia+"'); ";

            System.out.print("se remueve: "+remove);
            /*Agregamos las nuevas instancias indicadas en los selectedOptions de
             * origen y destino del EquivalenciaForm entrante
             */

              /*Obtenemos los arreglos que corresponden a las asignaturas de origen*/
              String[] asigOrig = eq.getSelectedOptionsOrigen();
              String[] asigDest = eq.getSelectedOptionsDestino();

              String insercionIncluye  = "";
              String insercionEquivale = "";
              String codigoInstitucionOrigen  = eq.getCodigoInstitucionOrigen();
              String codigoInstitucionDestino = eq.getCodigoInstitucionDestino();
              String codigoCarreraOrigen      = eq.getCodigoCarreraOrigen();
              String codigoCarreraDestino     = eq.getCodigoCarreraDestino();


              /*Insertamos en INCLUYE*/
              for (int i=0; i<asigOrig.length; i++) {
                  insercionIncluye = insercionIncluye + "INSERT INTO INCLUYE VALUES ('"+
                                codigoInstitucionOrigen+"','"+
                                codigoCarreraOrigen+"','"+
                                asigOrig[i]+"','"+
                                codigoInstitucionDestino+"','"+
                                codigoCarreraDestino+"','"+
                                codigoEquivalencia+
                                "');";
              }
              System.out.println("incluye: "+insercionIncluye);

              insercionEquivale = "";

              /*Insertamos en EQUIVALE*/
              for (int j=0; j<asigDest.length; j++) {
                  insercionEquivale = insercionEquivale + " INSERT INTO EQUIVALE VALUES ('"+
                                codigoInstitucionOrigen+"','"+
                                codigoCarreraOrigen+"','"+
                                codigoInstitucionDestino+"','"+
                                codigoCarreraDestino+"','"+
                                asigDest[j]+"','"+
                                codigoEquivalencia+
                                "');";
              }
              System.out.println("equivale: "+insercionEquivale);



              /* Se inserta la tupla en la base de datos */
              st = conexion.createStatement();
              st.execute(remove);
              st = conexion.createStatement();
              st.execute(insercionIncluye);
              st = conexion.createStatement();
              st.execute(insercionEquivale);
              
              res = true;
              st.close();
              bd.terminarConexion(conexion);
              
            } catch(Exception e) {
                System.out.println("Error al modificar Equivalencia.");
            }
            return res;

        }
 }
