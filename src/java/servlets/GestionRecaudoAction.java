/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;
import frijoles.*;
import modelo.*;
import org.apache.struts.actions.*;
import java.io.File;
import java.io.FileOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.*;
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
    
    public ActionForward Agregar (ActionMapping mapping,
                                            ActionForm form,
                                            HttpServletRequest request,
                                            HttpServletResponse response) 
    throws Exception {
    
                GestionRecaudo gr = new GestionRecaudo();
                RecaudoForm rf = (RecaudoForm) form;
		FormFile file = rf.getDatos_recaudo();
		String filePath = getServlet().getServletContext().getRealPath("/") +"RecaudosEquivalencia";
		System.out.println("filePath: "+filePath);
		System.out.println("getServlet().getServletContext(): "+getServlet().getServletContext());
		
		String fileName ="";
		fileName = file.getFileName();
		System.out.println("fileName: "+fileName);
		//create the upload folder if not exists
                File folder = new File(filePath);
                if(!folder.exists()){
                    folder.mkdir();
                    System.out.println("entre hice directorio1");
                    
                }
                filePath = filePath + "/"+rf.getCodigo_planilla()+"_"+rf.getTipo_recaudo();
                folder = new File(filePath);
                 if(!folder.exists()){
                    folder.mkdir();
                    System.out.println("entre hice directorio2");
                    
                }
                
	    
	    
	    if(fileName.equals("")||fileName == null){
                return mapping.findForward("errorAddRecaudo");
            }
	    if(!("").equals(fileName)){  
	    	try {
	    		fileName = file.getFileName();
	    		System.out.println("fileName: "+fileName);
	    		File newFile = new File(filePath, fileName);
	    		if(!newFile.exists()){
	    			 FileOutputStream fos = new FileOutputStream(newFile);
	    			 fos.write(file.getFileData());
		    		 fos.flush();
		    		 fos.close();
				} 	
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
            }
            rf.setRuta_datos_recaudo(filePath+"/"+fileName);
            gr.agregarRecaudo(rf);
            ArrayList<RecaudoForm> listaRecaudos = gr.listarRecaudosDePlanilla(rf.getCodigo_planilla());
            request.setAttribute("listaRecaudos",listaRecaudos);
            return mapping.findForward("newRecaudo");
    }
    
    public ActionForward finalizar(ActionMapping mapping,
                                    ActionForm form,
                                    HttpServletRequest request,
                                    HttpServletResponse response) 
    throws Exception {
        request.setAttribute("RecaudoForm", form);
        return mapping.findForward("successAddRecaudo");
    }
    
    public ActionForward volver_inicio(ActionMapping mapping,
                                    ActionForm form,
                                    HttpServletRequest request,
                                    HttpServletResponse response) 
    throws Exception {
        
        GestionPlanilla gp = new GestionPlanilla();
        RecaudoForm rf = (RecaudoForm) form;
        
        PlanillaForm pf = gp.obtenerPlanilla(rf.getCodigo_planilla());
        
        GestionAspirante ga = new GestionAspirante();
        
        AspiranteForm af = ga.obtenerAspiranteCedula(pf.getCedula_aspirante());
        
        request.setAttribute("AspiranteForm", af);
        
        return mapping.findForward("verAspirante");
    }
    
}