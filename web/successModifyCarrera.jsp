<%-- 
    Document   : successModifyCarrera
    Created on : May 29, 2013, 7:41:43 PM
    Author     : fertaku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<%@page import="java.util.* , modelo.*, frijoles.*" %>

<!DOCTYPE html>
<html>
    
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SEA - Carrera modificada con éxito</title>
    </head>
    
    <body>
    <center>
        <h1>¡Carrera modificada con éxito!</h1>
        <html:form action="/gestionInstitucion" method="POST">
            
            <%-- Obtener el nombre de la carrera y la institución --%>
            <% CarreraForm cf = ((CarreraForm) 
               request.getAttribute("CarreraForm")) ;
               GestionInstitucion gi = new GestionInstitucion();
               String nCarrera = cf.getNombreCarrera();
               String cInst = cf.getCodigoInstitucion();
               InstitucionForm inf = ((InstitucionForm)
                        gi.obtenerInstitucion(cInst));
                String nombreInst = inf.getNombreInstitucion();
            %>
               
               <li>Se ha modificado la carrera <%=nCarrera%> en la institución 
                   <%=nombreInst%></li>
               
               </br></br>
               
               <html:hidden property="codigoInstitucion" value="<%=cInst%>"/>
               
               <%-- Botón para volver a listar carreras --%>
               <html:submit 
                   styleClass  =  "button" 
                   property    =  "operacionInstitucion" 
                   value       =  "Listar_Carreras"/>
              
        </html:form>
    </center>
    </body>
</html>
