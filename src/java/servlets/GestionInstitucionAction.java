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
public class GestionInstitucionAction extends DispatchAction {
    
    /* Action para agregar en la base de datos una Institucion */
    public ActionForward Agregar(ActionMapping mapping,
                                        ActionForm form,
                                        HttpServletRequest request,
                                        HttpServletResponse response) 
    throws Exception {
        GestionInstitucion gi = new GestionInstitucion();
        InstitucionForm rf = (InstitucionForm) form;
        
        InstitucionForm detalles = 
            gi.obtenerInstitucion(rf.getCodigoInstitucion());
        request.setAttribute("InstitucionForm", detalles);
        
        String valorForward = "error";
        if (gi.agregarInstitucion(rf)) {
                valorForward = "addInstitucion";
        } else {
                valorForward = "errorAddInstitucion";
        }
        return mapping.findForward(valorForward);
    }
    
    
    public ActionForward Detalle_Institucion(ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response) 
    throws Exception {
        
        GestionInstitucion gi = new GestionInstitucion();
        ArrayList listaInt = gi.mostrarInstitucion();
        String valorForward = "error";
        
        if (listaInt.isEmpty()) {
            
            valorForward ="errorVerInstitucion";
            
        } else {
            
            InstitucionForm rf = (InstitucionForm) form;
            String codigoInst = rf.getCodigoInstitucion();
            request.setAttribute("InstitucionForm", 
                                 gi.obtenerInstitucion(codigoInst));
            
            valorForward = "verInstitucion";
        }
        return mapping.findForward(valorForward);
    }
    
    
    public ActionForward Modificar_Institucion(ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response) 
    throws Exception {
        return mapping.findForward("modificarInstitucion");
    }
    
    
    public ActionForward Modificar(ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response) 
    throws Exception {
        
        GestionInstitucion gi = new GestionInstitucion();
        InstitucionForm rf = (InstitucionForm) form;
        
        InstitucionForm detalles = 
            gi.obtenerInstitucion(rf.getCodigoInstitucion());
        request.setAttribute("InstitucionForm", detalles);
        
        String valorForward= "error";
        if (gi.modificarInstitucion(rf)) {
            valorForward = "successModifyInstitucion";
        } else {
            valorForward = "errorModifyInstitucion";
        }
        return mapping.findForward(valorForward);
    }
    
    public ActionForward Eliminar_Institucion(ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response) 
    throws Exception {
        GestionInstitucion gi = new GestionInstitucion();
        InstitucionForm rf = (InstitucionForm) form;
        
        InstitucionForm detalles = 
            gi.obtenerInstitucion(rf.getCodigoInstitucion());
        request.setAttribute("InstitucionForm", detalles);
        
        String valorForward = "error";
        if (gi.eliminarInstitucion(rf)) {
            valorForward = "successRmInstitucion";
        } else {
            valorForward = "errorRmInstitucion";
        }
        return mapping.findForward(valorForward);
    }
    
    
    public ActionForward Listar_Instituciones(ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response) 
    throws Exception {
        GestionInstitucion gi = new GestionInstitucion();
        ArrayList listaInst = gi.mostrarInstitucion();
        request.setAttribute("ListaInstitucion", listaInst);
        String valorForward = "listarInstitucion";
        return mapping.findForward(valorForward);
    }
    
    public ActionForward Crear_Institucion(ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response) 
    throws Exception {
        return mapping.findForward("registrarInstitucion");
    }
    
    
    public ActionForward Listar_Carreras(ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response) 
    throws Exception {
        GestionInstitucion gi = new GestionInstitucion();
        InstitucionForm rf = (InstitucionForm) form;
        
        InstitucionForm detalles = 
            gi.obtenerInstitucion(rf.getCodigoInstitucion());
        request.setAttribute("InstitucionForm", detalles);
        
        ArrayList<CarreraForm> listaCarrera = 
                    gi.mostrarCarreras(rf.getCodigoInstitucion());
        request.setAttribute("ListaCarreras", listaCarrera);
        String valorForward = "listarCarreras";
        return mapping.findForward(valorForward);
    }
    
    public ActionForward Listar_Asignaturas(ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response) 
    throws Exception {
        GestionAsignatura ga = new GestionAsignatura();
        InstitucionForm rf = (InstitucionForm) form;
        
        GestionInstitucion gi = new GestionInstitucion();
        InstitucionForm detalles = 
            gi.obtenerInstitucion(rf.getCodigoInstitucion());
        request.setAttribute("InstitucionForm", detalles);
        
        ArrayList<AsignaturaForm> listaAsignatura = 
                    ga.listarAsignaturas(rf.getCodigoInstitucion());
        request.setAttribute("ListaAsignaturas", listaAsignatura);
        String valorForward = "listarAsignaturas";
        return mapping.findForward(valorForward);
    }
    
}

