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
public class GestionRecaudoAction extends DispatchAction {
    
    public ActionForward Cargar_Recaudo(ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response) 
    throws Exception {
        
        RecaudoForm rf = (RecaudoForm) form;
        request.setAttribute("RecaudoForm", rf);
        return mapping.findForward("newRecaudo");
    }
    
    public ActionForward Agregar(ActionMapping mapping,
                                        ActionForm form,
                                        HttpServletRequest request,
                                        HttpServletResponse response) 
    throws Exception {
        
        RecaudoForm rf = (RecaudoForm) form;
        GestionRecaudo gr = new GestionRecaudo();
        
        gr.agregarRecaudo(rf);
        
        request.setAttribute("RecaudoForm", rf);
        return mapping.findForward("newRecaudo");
    }
}
