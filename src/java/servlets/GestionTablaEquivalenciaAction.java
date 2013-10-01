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
public class GestionTablaEquivalenciaAction extends DispatchAction {
    
    /* Action para agregar en la base de datos una tabla de equivalencia */
    public ActionForward Agregar(ActionMapping mapping,
                                        ActionForm form,
                                        HttpServletRequest request,
                                        HttpServletResponse response) 
    throws Exception {
        
        /* Creamos las variables necesarias */
        GestionTablaEquivalencia gt = new GestionTablaEquivalencia();
        TablaEquivalenciaForm tf = (TablaEquivalenciaForm) form;
        String valorForward = "error";
        
        /* Agregamos en la base de datos */
        if (gt.agregarTablaEquivalencia(tf)) {
                valorForward = "successAddTablaEquivalencia";
        } else {
                valorForward = "errorAddTablaEquivalencia";
        }
        return mapping.findForward(valorForward);
    }

    /* Metodo para modificar una tabla de equivalencia existente */
    public ActionForward Modificar(ActionMapping mapping,
                                   ActionForm form,
                                   HttpServletRequest request,
                                   HttpServletResponse response) 
    throws Exception {
        
        /* Se crean las variables necesarias */
        GestionTablaEquivalencia gt = new GestionTablaEquivalencia();
        TablaEquivalenciaForm tf = (TablaEquivalenciaForm) form;
        String valorForward = "error";
        /* Se modifica la tabla de equivalencia */
        if (gt.modificarTablaEquivalencia(tf)) {
            valorForward = "successModifyTablaEquivalencia";
        } else {
            valorForward = "errorModifyTablaEquivalencia";
        }
        return mapping.findForward(valorForward);
    }
    
    /* Action para eliminar una tabla de equivalencia de la base de datos */
    public ActionForward Eliminar_Tabla(ActionMapping mapping,
                                        ActionForm form,
                                        HttpServletRequest request,
                                        HttpServletResponse response) 
    throws Exception {
        
        /* Se crean las variables necesarias */
        GestionTablaEquivalencia gt = new GestionTablaEquivalencia();
        TablaEquivalenciaForm tf = (TablaEquivalenciaForm) form;
        String valorForward = "error";
        /* Se elimina la tabla de equivalencia de la base de datos */
        if (gt.eliminarTablaEquivalencia(tf)) {
            valorForward = "successRmTablaEquivalencia";
        } else {
            valorForward = "errorRmTablaEquivalencia";
        }
        return mapping.findForward(valorForward);
    }
    
    /* Action para listar las tablas de equivalencia en la base de datos*/
    public ActionForward Listar_Tablas(ActionMapping mapping,
                                       ActionForm form,
                                       HttpServletRequest request,
                                       HttpServletResponse response) 
    throws Exception {
        /* Se crean las variables necesarias */
        GestionTablaEquivalencia gt = new GestionTablaEquivalencia();
        
        TablaEquivalenciaForm tablaEquiv = (TablaEquivalenciaForm) form;
        /* Se obtiene la lista de tablas */
        ArrayList listaTablas = gt.listarTablasEquivalencia(tablaEquiv.getCodigoInstitucionOrigen(),
                                                            tablaEquiv.getCodigoInstitucionDestino());
        /* Se le fija un atributo a la lista y se hace el forwarding */
        request.setAttribute("TablaEquivalenciaForm", tablaEquiv);
        request.setAttribute("ListaTablas", listaTablas);
        String valorForward = "listarTablas";
        return mapping.findForward(valorForward);
    }
    
    /* Action para redirigir al formulario de creacion de una tabla */
    public ActionForward Crear_Tabla(ActionMapping mapping,
                                     ActionForm form,
                                     HttpServletRequest request,
                                     HttpServletResponse response) 
    throws Exception {
        return mapping.findForward("registrarTabla");
    }
    
    /* Action para redirigir al formulario de modificacion de una tabla */
    public ActionForward Modificar_Tabla(ActionMapping mapping,
                                         ActionForm form,
                                         HttpServletRequest request,
                                         HttpServletResponse response) 
    throws Exception {
        return mapping.findForward("modificarTabla");
    }
    
    public ActionForward Listar_Instituciones(ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response) 
    throws Exception {
        GestionInstitucion gi = new GestionInstitucion();
        ArrayList listaInst = gi.mostrarInstitucion();
        request.setAttribute("ListaInstitucion", listaInst);
        String valorForward = "listarInstitucionesTablasEquivalencia";
        return mapping.findForward(valorForward);
    }
    
    
     public ActionForward Detalles(ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response) 
    throws Exception {
        
        TablaEquivalenciaForm tablaPadre = (TablaEquivalenciaForm) form;
                
        GestionTablaEquivalencia gestion = new GestionTablaEquivalencia();
        ArrayList<EquivalenciaForm> listaEquivalencia = gestion.obtenerEquivalencias(tablaPadre);
        request.setAttribute("ListaEquivalencias", listaEquivalencia);
        String valorForward = "error";
        
        valorForward = "verTablaEquivalencia";
        
        return mapping.findForward(valorForward);
    }
    
}
