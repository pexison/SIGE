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
 * @author arturo
 */

/* Clase para la gestion de asignaturas */

public class GestionAsignaturaAction extends DispatchAction {

    /* Metodo para agregar una materia y redirigir */
    public ActionForward Agregar(ActionMapping mapping,
                                 ActionForm form,
                                 HttpServletRequest request,
                                 HttpServletResponse response) 
    throws Exception {
        
        GestionAsignatura ga   = new GestionAsignatura();
        AsignaturaForm af      = (AsignaturaForm) form;
        String valorForward    = "";
        GestionInstitucion gi = new GestionInstitucion();
        request.setAttribute("InstitucionForm", 
                   gi.obtenerInstitucion(af.getCodigoInstitucion()));
        /* 
         * Si se agrega la asignatura correctamente, redirigir a pagina de
         * exito al agregar, si no, redirigir a error al agregar
         */
        if (ga.agregarAsignatura(af)) {
            
           valorForward = "successAddAsignatura";

        } else {
            valorForward = "errorAddAsignatura";
        }   
        return mapping.findForward(valorForward);
    }
    
    public ActionForward Registrar_Asignatura(ActionMapping mapping,
                                        ActionForm form,
                                        HttpServletRequest request,
                                        HttpServletResponse response) 
    throws Exception {
        
        AsignaturaForm rf = (AsignaturaForm) form;
        InstitucionForm af;
        String valorForward = "error";
        GestionInstitucion gi = new GestionInstitucion();
        af = gi.obtenerInstitucion(rf.getCodigoInstitucion());
                                 // rf.getCodigoAsignatura());

        request.setAttribute("InstitucionForm", af);
        valorForward = "newAsignatura";
        return mapping.findForward(valorForward);
    }
    
    /* Metodo para ver los detalles de una asignatura */
    public ActionForward Detalle_Asignatura(ActionMapping mapping,
                                         ActionForm form,
                                         HttpServletRequest request,
                                         HttpServletResponse response) 
    throws Exception {
        
        
        AsignaturaForm af  = (AsignaturaForm) form;
        String valorForward = "error";
        
        String codigoInst = af.getCodigoInstitucion();
        String codigoAsig = af.getCodigoAsignatura();
        GestionAsignatura gc = new GestionAsignatura();
        request.setAttribute("AsignaturaForm", 
                             gc.obtenerAsignatura(codigoInst, codigoAsig));
        valorForward = "verAsignatura";
        
        return mapping.findForward(valorForward);
    }
    
    /* Metodo para gestionar la modificacion de las carreras */
    public ActionForward Modificar_Asignatura(ActionMapping mapping,
                                           ActionForm form,
                                           HttpServletRequest request,
                                           HttpServletResponse response) 
    throws Exception {
        
        GestionAsignatura ga     = new GestionAsignatura();
        AsignaturaForm af        = (AsignaturaForm) form;
        String valorForward   = "";
        request.setAttribute("AsignaturaForm", af);
        valorForward = "modificarAsignatura";
        
        return mapping.findForward(valorForward);
    }
    
    /* Metodo para gestionar las modificaciones de asignaturas */
    public ActionForward Modificar(ActionMapping mapping,
                                   ActionForm form,
                                   HttpServletRequest request,
                                   HttpServletResponse response) 
    throws Exception {
    
        GestionAsignatura ga = new GestionAsignatura();
        AsignaturaForm af = (AsignaturaForm) form;
        String valorForward = "";
        
        GestionInstitucion gi = new GestionInstitucion();
        
        // Necesario debido a que se va a redireccionar a listar_asignaturas
        // el cual requiere la informacion de la institucion
        request.setAttribute("InstitucionForm", 
                    gi.obtenerInstitucion(af.getCodigoInstitucion()));
        
        /* Si se puede modificar la asignatura, se redirige a una pagina de
         * exito, si no, se redirige a una pagina de error
         */
        if (ga.modificarAsignatura(af)) {
            
            valorForward = "successModifyAsignatura";
            
        } else {
            
            valorForward = "errorModifyAsignatura";
            
        }
        return mapping.findForward(valorForward);
    }
    
    /* Metodo para gestionar las eliminaciones de asignaturas */
    public ActionForward Eliminar_Asignatura(ActionMapping mapping,
                                          ActionForm form,
                                          HttpServletRequest request,
                                          HttpServletResponse response) 
    throws Exception {
        
        GestionAsignatura ga = new GestionAsignatura();
        AsignaturaForm af = (AsignaturaForm) form;
        String valorForward = "";
        /* Si se puede eliminar la asignatura, se redirige a una pagina de
         * exito, si no, se redirige a una pagina de error
         */
        GestionInstitucion gi = new GestionInstitucion();
        
        // Necesario debido a que se va a redireccionar a listar_asignaturas
        // el cual requiere la informacion de la institucion
        request.setAttribute("InstitucionForm", 
                    gi.obtenerInstitucion(af.getCodigoInstitucion()));
        
        if (ga.eliminarAsignatura(af)) {
            valorForward = "successRmAsignatura";
        } else {
            valorForward = "errorRmAsignatura";
        }
        return mapping.findForward(valorForward);
    } 
    
}
