/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.sql.*;
import frijoles.*;
import java.io.*;

/**
 *
 * @author andreso
 */
public class GestionRecaudo {
    
    BaseDatos bd;
    
    public GestionRecaudo(){
        bd = new BaseDatos();
    }
    
    public boolean agregarRecaudo(RecaudoForm rf) {
        boolean res = false;
                
        try {
            String insercion = "INSERT INTO RECAUDO VALUES ('"
                    +rf.getCodigo_planilla()+"','"
                    +rf.getTipo_recaudo()
                    +"',?);";

            System.out.print(insercion);
            
            File file = new File("PreguntaDeRecuperacion.pdf");
            FileInputStream fis = new FileInputStream(file);

            System.out.println("ACA ESTA EL FIS: "+fis);
            
            int fileLength = (int) file.length();
            
            Connection conexion = bd.establecerConexion();
            PreparedStatement ps = conexion.prepareStatement(insercion);
            ps.setBinaryStream(1, fis, fileLength);
            System.out.println("Kaboom");
            ps.executeUpdate();
            ps.close();
            res = true;
            bd.terminarConexion(conexion);

            fis.close();
            
        } catch(Exception e) {
            System.out.println("Error al registrar Recaudo.");
        }
        return res;
    }
    
    public boolean existeRecaudo(String codigo_planilla, String tipo_recaudo) {
        
        String consulta = "SELECT Count(*) FROM RECAUDO WHERE "+
                          "CODIGO_PLANILLA ='"  + codigo_planilla +"'"+
                         "AND TIPO_RECAUDO = '" + tipo_recaudo+"';";
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
    
    
    public boolean eliminarRecaudo(RecaudoForm rf) {
        
        boolean res = false;
        
        String delete = "DELETE FROM RECAUDO WHERE ("+
                        "CODIGO_PLANILLA='"+rf.getCodigo_planilla()+
                        "';";
        boolean existe = existeRecaudo(rf.getCodigo_planilla(),rf.getTipo_recaudo());
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
                System.out.println("Error al eliminar Recaudo.");
            }
        }
        return res;
        
    }
}
