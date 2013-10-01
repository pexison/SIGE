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
        
        
        /* Declaramos una variable para almacenar el resultado final */
        boolean res = false;
        
        /*Obtenemos los arreglos que corresponden a las asignaturas de origen*/
        String[] asigOrig = eq.getSelectedOptionsOrigen();
        String[] asigDest = eq.getSelectedOptionsDestino();
        
       //  incluye son las d eorigen
       //  equivalen las de destino
        
        
        //ORDEN: 
//                     Table "public.equivalencia"
//         Column          |     Type      | Modifiers 
//-------------------------+---------------+-----------
// codigo_institucion_orig | character(12) | not null
// codigo_carrera_orig     | character(12) | not null
// codigo_institucion_dest | character(12) | not null
// codigo_carrera_dest     | character(12) | not null
// codigo_equivalencia     | character(12) | not null

        String insercionIncluye  = "";
        String insercionEquivale = "";
        String codigoInstitucionOrigen  = eq.getCodigoInstitucionOrigen();
        String codigoInstitucionDestino = eq.getCodigoInstitucionDestino();
        String codigoCarreraOrigen      = eq.getCodigoCarreraOrigen();
        String codigoCarreraDestino     = eq.getCodigoInstitucionDestino();
        //Sacar el maximo codigo de la bd, usarlo pa insertar la nueva equivalencia
        // y luego usarlo para hacer los insert de equivale e incluye.
        String insertEquivale = "INSERT INTO EQUIVALENCIA VALUES ('"+
                            
                            "');";
        
        for (int i=0; i<asigOrig.length; i++) {
            insercionIncluye = insercionIncluye + "INSERT INTO INCLUYE VALUES ('"+
                            codigoInstitucionOrigen+"','"+
                            codigoCarreraOrigen+"','"+
                            asigOrig[i]+"','"+
                            codigoInstitucionDestino+"','"+
                            codigoCarreraDestino+"','"+
                            i+
                            "');";
        }
        System.out.println(insercionIncluye);
        
//         Column          |     Type      | Modifiers 
//-------------------------+---------------+-----------
// codigo_institucion_orig | character(12) | not null
// codigo_carrera_orig     | character(12) | not null
// codigo_institucion_dest | character(12) | not null
// codigo_carrera_dest     | character(12) | not null
// codigo_asignatura       | character(12) | not null
// codigo_equivalencia     | character(12) | not null
        
        for (int j=0; j<asigDest.length; j++) {
            insercionEquivale = "INSERT INTO EQUIVALE VALUES ('"+
                            codigoInstitucionOrigen+"','"+
                            codigoCarreraOrigen+"','"+
                            codigoInstitucionDestino+"','"+
                            codigoCarreraDestino+"','"+
                            asigDest[j]+"','"+
                            j+
                            "');";
        }
        System.out.println(insercionEquivale);

        
        try {

            /* Se establece la conexion a la base de datos */
            Connection conexion = bd.establecerConexion();
            Statement st = conexion.createStatement();
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
