/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;
import modelo.*;
import frijoles.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;

/**
 *
 * @author fertaku
 */
public class ValidarAction extends Action {
    
    public ActionForward execute(ActionMapping mapping,
                                 ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) throws Exception{
                                 

        GestionClientes gc = new GestionClientes();
        
        ValidacionForm vf = (ValidacionForm) form;
        
        if (gc.validar(vf)) {
            request.setAttribute("ValidacionForm", vf);
            return mapping.findForward("bienvenida");
        } else {
            return mapping.findForward("errorLogin");
        }
    }
}
