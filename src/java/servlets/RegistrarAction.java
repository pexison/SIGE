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
public class RegistrarAction extends Action {
    public ActionForward execute(ActionMapping mapping,
                                 ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) throws Exception{
                                 
        GestionClientes gc = new GestionClientes();
        RegistroForm rf = (RegistroForm) form;
        String valorForward = "";
        if (gc.registrar(rf)) {
               request.setAttribute("RegistroForm", rf);
               valorForward = "successRegister";
            } else {
               valorForward = "errorRegister";
        }
        return mapping.findForward(valorForward);
    }
}