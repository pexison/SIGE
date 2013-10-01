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
public class GestionCarreraAction extends DispatchAction {
    
    public ActionForward Agregar(ActionMapping mapping,
                                 ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) 
    throws Exception {
        
        GestionCarrera gc   = new GestionCarrera();
        CarreraForm cf      = (CarreraForm) form;
        String valorForward = "";
                   
        if (gc.agregarCarrera(cf)) {

           request.setAttribute("CarreraForm", cf);
           valorForward = "successAddCarrera";

        } else {

            valorForward = "errorAddCarrera";
        }   
        return mapping.findForward(valorForward);
    }
    
    
    public ActionForward Modificar_Carrera(ActionMapping mapping,
                                           ActionForm form,
                                           HttpServletRequest request,
                                           HttpServletResponse response) 
    throws Exception {
        
        GestionCarrera gc     = new GestionCarrera();
        CarreraForm cf        = (CarreraForm) form;
        String valorForward   = "";
        GestionInstitucion gi = new GestionInstitucion();
        ArrayList listaCarr   = gi.mostrarCarreras(cf.getCodigoInstitucion());

        if (listaCarr.isEmpty()) {
            System.out.println("LA COSA ENTRO AQUI");
            valorForward ="errorModifCarrera";

        } else {
            request.setAttribute("CarreraForm", cf);
            valorForward = "modificarCarrera";
        }
        
        return mapping.findForward(valorForward);
    }
    
    public ActionForward Detalle_Carrera(ActionMapping mapping,
                                         ActionForm form,
                                         HttpServletRequest request,
                                         HttpServletResponse response) 
    throws Exception {
        
        
        CarreraForm cf  = (CarreraForm) form;
        String valorForward = "error";

        String codigoInst = cf.getCodigoInstitucion();
        String codigoCarr = cf.getCodigoCarrera();
        GestionCarrera gc = new GestionCarrera();
        request.setAttribute("CarreraForm", 
                             gc.obtenerCarrera(codigoInst, codigoCarr));
        valorForward = "verCarrera";
        
        return mapping.findForward(valorForward);
    }
    
    public ActionForward Modificar(ActionMapping mapping,
                                   ActionForm form,
                                   HttpServletRequest request,
                                   HttpServletResponse response) 
    throws Exception {
    
        GestionCarrera gc = new GestionCarrera();
        CarreraForm cf = (CarreraForm) form;
        String valorForward = "";
        
        if (gc.modificarCarrera(cf)) {
            
            valorForward = "successModifyCarrera";
            
        } else {
            
            valorForward = "errorModifyCarrera";
            
        }
        return mapping.findForward(valorForward);
    }
    
    public ActionForward Registrar_Carrera(ActionMapping mapping,
                                        ActionForm form,
                                        HttpServletRequest request,
                                        HttpServletResponse response) 
    throws Exception {
        
        CarreraForm rf = (CarreraForm) form;
        CarreraForm cf = new CarreraForm();
        String valorForward = "error";
        cf.setCodigoInstitucion(rf.getCodigoInstitucion());
        request.setAttribute("CarreraForm", cf);
        valorForward = "newCarrera";
        return mapping.findForward(valorForward);
    }
    
    public ActionForward Eliminar_Carrera(ActionMapping mapping,
                                          ActionForm form,
                                          HttpServletRequest request,
                                          HttpServletResponse response) 
    throws Exception {
        
        GestionCarrera gc = new GestionCarrera();
        CarreraForm cf = (CarreraForm) form;
        String valorForward = "";
        if (gc.eliminarCarrera(cf)) {
            request.setAttribute("CarreraForm", cf);
            valorForward = "successRmCarrera";
        } else {
            valorForward = "errorRmCarrera";
        }
        return mapping.findForward(valorForward);
    }

}
    