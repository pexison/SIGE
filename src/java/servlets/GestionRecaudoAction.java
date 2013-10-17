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
            
            return mapping.findForward("newRecaudo");
    }

    /*
    public ActionForward Agregar(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        
        RecaudoForm rf = (RecaudoForm) form;
        
        File folder;
        //obtenemos los archivos de un arraylist
        int cant = 0;
        int cantArchivos = 0;


        //buscamos el path real para guardar el archivo, 
        //este path lo guarda en el la capeta build/web/Documentos

        String filePath =
                getServlet().getServletContext().getRealPath("/") + "Documentos2/" + rf.getCodigo_planilla();
        String documentos = getServlet().getServletContext().getRealPath("/") + "Documentos2/";
        
        
        

        folder = new File(documentos);
        if (!folder.exists()) {
            folder.mkdir();
        }

        folder = new File(filePath);
        if (!folder.exists()) {
            folder.mkdir();
        }


            //del archivo del form obtenemos el archivo como tal
            FormFile file = (FormFile) rf.getDatos_recaudo();

            //obtenemos el nombre
            String fileName = file.getFileName();
            //obtenemos el arreglo de bytes del archivo
            byte[] fileData = file.getFileData();
            Random r = new Random();
            String f1=null;
                        
            if (!fileName.equals("")) {
            * 
            * 
                System.out.println("Server path:" + filePath);
                boolean existe=true;
                while(existe){
                f1 = "extmp"+ r.nextInt(1000) +".png";
                File newFile=new File(filePath,f1);


                // si existe el archivo lo sobreescribe
                if (!newFile.exists()) {
                    existe=false;
                    FileOutputStream fos = new FileOutputStream(newFile);
                    fos.write(file.getFileData());
                    fos.flush();
                    fos.close();
                }

                }

            }
            GestionRecaudo gi = new GestionRecaudo();
            rf.setDatos_recaudoString(filePath+"/"+f1);
            gi.agregarRecaudo(rf);
            
            
        return mapping.findForward("newRecaudo");
    }*/
    
}
    
    /*
    
    public ActionForward Agregar(ActionMapping mapping,
                                        ActionForm form,
                                        HttpServletRequest request,
                                        HttpServletResponse response) 
    throws Exception {
        
        RecaudoForm rf = (RecaudoForm) form;
        GestionRecaudo gr = new GestionRecaudo();
        
        gr.agregarRecaudo(rf);
        
        request.setAttribute("RecaudoForm", rf);
        return mapping.findForward("newRecaudo");
    }*/