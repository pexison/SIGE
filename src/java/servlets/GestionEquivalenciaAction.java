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
        
        EquivalenciaForm listaDin = new EquivalenciaForm(listaAsigRequeridasOrig,listaAsigRequeridasDest);
  
        // Agregar lista de asignaturas requeridas por la carrera de origen
        request.setAttribute("EquivalenciaForm", listaDin);     
        
        return mapping.findForward("registrarEquivalencia");
    }
  
}
