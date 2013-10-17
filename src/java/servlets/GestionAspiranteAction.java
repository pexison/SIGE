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
public class GestionAspiranteAction extends DispatchAction {
    
    
    public ActionForward registrar_Aspirante(ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response) 
    throws Exception {
        
        AspiranteForm af = (AspiranteForm) form;
        GestionAspirante ga = new GestionAspirante();
        String forward = "";
        af = ga.obtenerAspiranteUsuario(af.getId_usuario());
        if (af != null) {
            request.setAttribute("AspiranteForm", af);
            forward = "verAspirante";
        } else {
            forward = "registrarAspirante";
        }
        return mapping.findForward(forward);
    }
    
    /* Action para agregar en la base de datos la informacion de un aspirante */
    public ActionForward Agregar(ActionMapping mapping,
                                        ActionForm form,
                                        HttpServletRequest request,
                                        HttpServletResponse response) 
    throws Exception {
        GestionAspirante ga = new GestionAspirante();
        AspiranteForm af = (AspiranteForm)form;
        
        String valorForward = "error";
        if (ga.agregarAspirante(af)) {
                request.setAttribute("AspiranteForm", af);
                valorForward = "verAspirante";
        } else {
                valorForward = "errorAddAspirante";
        }
        return mapping.findForward(valorForward);
    }
    
    /* Action para agregar en la base de datos la informacion de un aspirante */
    public ActionForward Modificar(ActionMapping mapping,
                                        ActionForm form,
                                        HttpServletRequest request,
                                        HttpServletResponse response) 
    throws Exception {
        
        String forward = "";
        
        AspiranteForm af = (AspiranteForm) form;
        GestionAspirante ga = new GestionAspirante();
        
        if (ga.modificarAspirante(af)) {
            forward = "successModifyAspirante";
        } else {
            forward = "errorModifyAspirante";
        }
        
        return mapping.findForward(forward);
    }
    
    /* Action para agregar en la base de datos la informacion de un aspirante */
    public ActionForward Modificar_Aspirante(ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response) 
    throws Exception {
        
        String forward = "";
        
        request.setAttribute("AspiranteForm", form);
        forward = "modifyAspirante";
        
        return mapping.findForward(forward);
    }
    
}
