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
public class ValidarAction extends DispatchAction {
    
    public ActionForward Validar(ActionMapping mapping,
                                 ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) throws Exception{
                                 

        GestionClientes gc = new GestionClientes();
        
        ValidacionForm vf = (ValidacionForm) form;
        
        HttpSession session = request.getSession(true);
        session.setAttribute("usuario", vf.getUsuario());
        session.setAttribute("clave", vf.getClave());
        //session.setAttribute( "tipoUsuario", authuser.getSess_access());
        if (gc.validar(vf)) {
            request.setAttribute("ValidacionForm", vf);
            return mapping.findForward("bienvenida");
        } else {
            return mapping.findForward("errorLogin");
        }
    }
    
    public ActionForward retornar(ActionMapping mapping,
                                 ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) throws Exception{
                                 
        GestionClientes gc = new GestionClientes();
        
        ValidacionForm vf = (ValidacionForm) form;
        HttpSession session = request.getSession(true);
        String usuario = (String)session.getAttribute("usuario");
        vf.setUsuario(usuario);
        
        request.setAttribute("ValidacionForm", vf);
        return mapping.findForward("bienvenida");
        
    }
}
