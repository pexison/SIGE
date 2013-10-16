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
        return mapping.findForward("registrarAspirante");
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
                valorForward = "successAddAspirante";
        } else {
                valorForward = "errorAddAspirante";
        }
        return mapping.findForward(valorForward);
    }
    
}
