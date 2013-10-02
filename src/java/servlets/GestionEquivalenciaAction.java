/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servlets;
import modelo.*;
import frijoles.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;
import org.apache.struts.actions.*;
import java.util.*;

/**
 *
 * @author andreso
 */

public class GestionEquivalenciaAction extends DispatchAction {
    
    /* Action para redirigir al formulario de creacion de una Equivalencia */
    public ActionForward Crear_Equivalencia(ActionMapping mapping,
                                     ActionForm form,
                                     HttpServletRequest request,
                                     HttpServletResponse response) 
    throws Exception {
        
        EquivalenciaForm ef = (EquivalenciaForm) form;
        GestionAsignatura ga = new GestionAsignatura();    
        
        // Se requiere agregar las listas correspondientes a asignaturas
        // requeridas y asignaturas ofrecidas
        
        ArrayList<AsignaturaForm> listaAsigRequeridasOrig = ga.listarAsignaturas(
                ef.getCodigoInstitucionOrigen(), ef.getCodigoCarreraOrigen());
        
        ArrayList<AsignaturaForm> listaAsigRequeridasDest = ga.listarAsignaturas(
                ef.getCodigoInstitucionDestino(), ef.getCodigoCarreraDestino());
        
        ef.AdjuntarListasAsignaturas(listaAsigRequeridasOrig, listaAsigRequeridasDest);        
        
        // Agregar lista de asignaturas requeridas por la carrera de origen
        request.setAttribute("EquivalenciaForm", ef);     
        
        return mapping.findForward("registrarEquivalencia");
    }
    
     public ActionForward Agregar_Equivalencia(ActionMapping mapping,
                                     ActionForm form,
                                     HttpServletRequest request,
                                     HttpServletResponse response) 
    throws Exception {
    
         String forward = "";
         
         GestionEquivalencia gestEquiv = new GestionEquivalencia();
         
         EquivalenciaForm ef = (EquivalenciaForm) form;
         
         System.out.println("ALERTANUEVA: " + ef.getCodigoInstitucionOrigen() + ef.getCodigoInstitucionDestino());
         
         /*Obtenemos las asignaturas escogidas mediante checkboxes.
          * si alguna de estas listas de asignaturas es vacia,
          * esto significa que se dejaron campos en blanco.
          * En este caso se retorna a la misma pagina para que se marquen
          * nuevamente los checkbox. En caso contrario, se procede a agregar
          */
          if (gestEquiv.agregarEquivalencia(ef)) {
                    forward = "successAddEquivalencia";
          } else {
                    forward = "errorAddEquivalencia";
          }
         
         return mapping.findForward(forward);
         
    }
     
    public ActionForward Eliminar_Equivalencia(ActionMapping mapping,
                                     ActionForm form,
                                     HttpServletRequest request,
                                     HttpServletResponse response) 
    throws Exception {
        
        /*listarTablas nos redirige a la misma pagina*/
        String valorForward = "listarTablas";
        EquivalenciaForm ef = (EquivalenciaForm) form;
        
        /*Creamos una tabla de equivalencia auxiliar,
         * sabiendo que los codigos para la tabla y la equivalencia
         * son los mismos
         */
        TablaEquivalenciaForm te = new TablaEquivalenciaForm();
        te.setCodigoCarreraDestino(ef.getCodigoCarreraDestino());
        te.setCodigoCarreraOrigen(ef.getCodigoCarreraOrigen());
        te.setCodigoInstitucionDestino(ef.getCodigoInstitucionDestino());
        te.setCodigoInstitucionOrigen(ef.getCodigoInstitucionOrigen());
        GestionEquivalencia ge = new GestionEquivalencia();
        
        
        GestionTablaEquivalencia gestion = new GestionTablaEquivalencia();
        
        ge.eliminarEquivalencia(ef);
        ArrayList<EquivalenciaForm> listaEquivalencia = gestion.obtenerEquivalencias(te);
        
        /*Enviamos al jsp verTablasEquivalencia la informacion que necesita,
         * esto es, la lista de equivalencias de la tabla auxiliar 
         * y la tabla en si misma respectivamente.
         */
        request.setAttribute("ListaEquivalencias", listaEquivalencia);
        request.setAttribute("TablaEquivalenciaForm",te);
        
        return mapping.findForward(valorForward);

    }
    
    
    
     public ActionForward Modificar(ActionMapping mapping,
                                     ActionForm form,
                                     HttpServletRequest request,
                                     HttpServletResponse response) 
    throws Exception {
    
        String forward = "modificacionEquivalencia";
         
        EquivalenciaForm ef = (EquivalenciaForm) form;
        GestionAsignatura ga = new GestionAsignatura();    
        
        // Se requiere agregar las listas correspondientes a asignaturas
        // requeridas y asignaturas ofrecidas
        
        ArrayList<AsignaturaForm> listaAsigRequeridasOrig = ga.listarAsignaturas(
                ef.getCodigoInstitucionOrigen(), ef.getCodigoCarreraOrigen());
        
        ArrayList<AsignaturaForm> listaAsigRequeridasDest = ga.listarAsignaturas(
                ef.getCodigoInstitucionDestino(), ef.getCodigoCarreraDestino());
        
        ef.AdjuntarListasAsignaturas(listaAsigRequeridasOrig, listaAsigRequeridasDest);        
  
        // Agregar lista de asignaturas requeridas por la carrera de origen
        request.setAttribute("EquivalenciaForm", ef);     
         
        return mapping.findForward(forward);
    }
     
    
     public ActionForward Modificar_Equivalencia(ActionMapping mapping,
                                     ActionForm form,
                                     HttpServletRequest request,
                                        HttpServletResponse response) 
       throws Exception {

           GestionEquivalencia ge = new GestionEquivalencia();
           EquivalenciaForm eq = (EquivalenciaForm) form;
           
           String valorForward= "";
           
           if (ge.modificarEquivalencia(eq)) {
               valorForward = "successModifyEquivalencia";
           } else {
               valorForward = "errorModifyEquivalencia";
           }
           return mapping.findForward(valorForward);
    }
    
}   