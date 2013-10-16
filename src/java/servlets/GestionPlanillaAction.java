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
                valorForward = "successAddPlanilla";
        } else {
                valorForward = "errorAddPlanilla";
        }
        return mapping.findForward(valorForward);
    }
    
     public ActionForward Listar_Planillas(ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response) 
    throws Exception {
        GestionPlanilla gp = new GestionPlanilla();
        ArrayList listaPlanilla = gp.mostrarPlanillas();
        request.setAttribute("ListaPlanilla", listaPlanilla);
        String valorForward = "listarPlanilla";
        return mapping.findForward(valorForward);
    }
    
}

