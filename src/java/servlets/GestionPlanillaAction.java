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
public class GestionPlanillaAction extends DispatchAction {
    
    
    public ActionForward registrar_Planilla(ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response) 
    throws Exception {
        
        request.setAttribute("PlanillaForm", form);
        return mapping.findForward("registrarPlanilla");
    }
    
    
    /* Action para agregar en la base de datos una Institucion */
    public ActionForward Agregar(ActionMapping mapping,
                                        ActionForm form,
                                        HttpServletRequest request,
                                        HttpServletResponse response) 
    throws Exception {
        GestionPlanilla ga = new GestionPlanilla();
        PlanillaForm pf = (PlanillaForm)form;
        
        String valorForward = "error";
        if (ga.agregarPlanilla(pf)) {
                request.setAttribute("PlanillaForm", pf);
                valorForward = "successAddPlanilla";
        } else {
                valorForward = "errorAddPlanilla";
        }
        return mapping.findForward(valorForward);
    }
    
    public ActionForward Consultar_Planillas(ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response) 
    throws Exception {
        String forward = "consultarPlanillas";
        return mapping.findForward(forward);
        
    }
    
     public ActionForward Listar_Planillas(ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response) 
    throws Exception {
        GestionPlanilla gp = new GestionPlanilla();
        PlanillaForm pf = (PlanillaForm) form;
        String edo_planilla = pf.getEstado_planilla();
        String planilla_aprobada = "Aprobada";
        String planilla_rechazada = "Rechazada";
        String planilla_pendiente = "Pendiente";
        
        
        
        ArrayList<PlanillaForm> listaPlanilla = new ArrayList();
        
        if (edo_planilla.equalsIgnoreCase(planilla_aprobada)){
            
           System.out.println("Entre en aprobada");
           listaPlanilla = gp.mostrarPlanillasAprobadas();
           
        } else if (edo_planilla.equalsIgnoreCase(planilla_rechazada)){
            
            System.out.println("Entre en rechazada");
           listaPlanilla = gp.mostrarPlanillasRechazadas();
           
        } else if (edo_planilla.equalsIgnoreCase(planilla_pendiente)){
            
           System.out.println("Entre en pendientes");
           listaPlanilla = gp.mostrarPlanillasPendientes();
           
        }
        request.setAttribute("ListaPlanilla", listaPlanilla);
        String valorForward = "listarPlanilla";
        return mapping.findForward(valorForward);
    }
     
     
    
    public ActionForward Detalle_Planilla(ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response) 
    throws Exception {
        
        request.setAttribute("PlanillaForm", form);
        return mapping.findForward("detallePlanilla");
    }
    
    public ActionForward Aceptar_Planilla(ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response) 
    throws Exception {
        
        GestionPlanilla ga = new GestionPlanilla();
        PlanillaForm pf = (PlanillaForm) form;

        pf = ga.obtenerPlanilla(pf.getCodigo_planilla());
        String valorForward = "error";
        if (ga.aceptarPlanilla(pf)) {
                valorForward = "successActualizarEstadoPlanilla";
        } else {
                valorForward = "errorActualizarEstadoPlanilla";
        }
        pf = ga.obtenerPlanilla(pf.getCodigo_planilla());
        request.setAttribute("PlanillaForm", pf);
        return mapping.findForward(valorForward);
    }
    
    public ActionForward Rechazar_Planilla(ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response) 
    throws Exception {
        
        GestionPlanilla ga = new GestionPlanilla();
        PlanillaForm pf = (PlanillaForm) form;
        
        pf = ga.obtenerPlanilla(pf.getCodigo_planilla());

        String valorForward = "error";
        
        if (ga.rechazarPlanilla(pf)) {
            
                valorForward = "successActualizarEstadoPlanilla";
        } else {
                valorForward = "errorActualizarEstadoPlanilla";
        }
        pf = ga.obtenerPlanilla(pf.getCodigo_planilla());
        request.setAttribute("PlanillaForm", pf);
        return mapping.findForward(valorForward);
        
    }
    
}

