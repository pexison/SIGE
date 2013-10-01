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
 * @author fertaku
 */
public class GestionCarreraRequiereAsignaturaAction extends DispatchAction {
    
    public ActionForward Asignaturas_Requeridas(ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response) 
    throws Exception {
        GestionAsignatura ga = new GestionAsignatura();
        CarreraRequiereAsignaturaForm rf = (CarreraRequiereAsignaturaForm) form;
        GestionCarreraRequiereAsignatura gc = new GestionCarreraRequiereAsignatura();
        
        ArrayList<AsignaturaForm> listaAsignatura = 
                    ga.listarAsignaturas(rf.getCodigoInstitucion(), 
                                         rf.getCodigoCarrera());
        request.setAttribute("ListaAsignaturasRequeridas", listaAsignatura);
        
        ArrayList<AsignaturaForm> listaAsignaturaNoRequeridas = 
                gc.listarAsignaturasNoAsociadas(rf);
        request.setAttribute("ListaAsignaturasNoRequeridas", listaAsignaturaNoRequeridas);
        
        String valorForward = "listarAsignaturas";
        return mapping.findForward(valorForward);
    }
    
    public ActionForward Eliminar_Requerimiento(ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response) 
    throws Exception {
        GestionAsignatura ga = new GestionAsignatura();
        CarreraRequiereAsignaturaForm rf = (CarreraRequiereAsignaturaForm) form;
        GestionCarreraRequiereAsignatura gc = new GestionCarreraRequiereAsignatura();
        gc.eliminarRequiere(rf);
        
        ArrayList<AsignaturaForm> listaAsignatura = 
                    ga.listarAsignaturas(rf.getCodigoInstitucion(), 
                                         rf.getCodigoCarrera());
        request.setAttribute("ListaAsignaturasRequeridas", listaAsignatura);
        
        
        ArrayList<AsignaturaForm> listaAsignaturaNoRequeridas = 
                gc.listarAsignaturasNoAsociadas(rf);
        request.setAttribute("ListaAsignaturasNoRequeridas", listaAsignaturaNoRequeridas);
        
        String valorForward = "listarAsignaturas";
        return mapping.findForward(valorForward);
    }
    
    public ActionForward Agregar_Requerimiento(ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response) 
    throws Exception {
        GestionAsignatura ga = new GestionAsignatura();
        CarreraRequiereAsignaturaForm rf = (CarreraRequiereAsignaturaForm) form;
        GestionCarreraRequiereAsignatura gc = new GestionCarreraRequiereAsignatura();
        System.out.println("PRUEBA: "+rf.getCodigoAsignatura());
        gc.agregarRequiere(rf);
       
        ArrayList<AsignaturaForm> listaAsignatura = 
                    ga.listarAsignaturas(rf.getCodigoInstitucion(), 
                                         rf.getCodigoCarrera());
        request.setAttribute("ListaAsignaturasRequeridas", listaAsignatura);
        
        ArrayList<AsignaturaForm> listaAsignaturaNoRequeridas = 
                gc.listarAsignaturasNoAsociadas(rf);
        request.setAttribute("ListaAsignaturasNoRequeridas", listaAsignaturaNoRequeridas);
        
        String valorForward = "listarAsignaturas";
        return mapping.findForward(valorForward);
    }
    
    
}
