<%-- 
    Document   : successModifyInstitucion
    Created on : May 29, 2013, 7:58:18 PM
    Author     : fertaku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@page import="java.util.* , frijoles.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SEA - La institución fue modificada con éxito</title>
    </head>
    <body>
        
        <%-- Se pasa la nueva información de la institución --%>
        <%  InstitucionForm rf = 
                (InstitucionForm) request.getAttribute("InstitucionForm");
            String nombreInst = rf.getNombreInstitucion();
            String codigoInst = rf.getCodigoInstitucion();
            request.setAttribute("InstitucionForm", rf);%>
            
        <h1>La institución <%=nombreInst%> se modificó con éxito</h1>
        
        <html:form action="/gestionInstitucion" method="POST">
            
        <center>
            
            <li><h2>Volver: </h2></li>
            
            <html:hidden 
                property = "codigoInstitucion" 
                value    = "<%=codigoInst%>"/>
            
            <%-- Botón regresar a listar las instituciones --%>
            <html:submit 
                styleClass = "button" 
                property   = "operacionInstitucion" 
                value      = "Listar_Instituciones"/>
            
            <%-- Botón para regresar a mostrar detalles de la institución --%>
            <html:submit 
                styleClass = "button" 
                property   = "operacionInstitucion" 
                value      = "Detalle_Institucion"/>
        </center>
    
        </html:form>
        
    </body>
</html>
