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
        return mapping.findForward("registrarEquivalencia");
    }
   
}
