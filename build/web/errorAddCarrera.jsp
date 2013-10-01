<%-- 
    Document   : errorAddCarrera
    Created on : May 28, 2013, 10:34:15 PM
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
 
        <title>SEA - Error al registrar Carrera</title>
    </head>
    <body>
        <h1>No se ha podido cargar la carrera al sistema.</h1>
        
        <html:form action="/gestionInstitucion" method="POST">
            
			<%-- Obtener la información de la institución --%>
            <% CarreraForm cf = ((CarreraForm) 
               request.getAttribute("CarreraForm")) ;
               String cInst = cf.getCodigoInstitucion();%>
            <center>
               <li>El código de carrera ingresado ya se encuentra en el
                   sistema </li>
               
               <li><h2>Volver: </h2></li>
               
               <html:hidden 
                   property   = "codigoInstitucion" 
                   value      = "<%=cInst%>"/>
               
               <%-- Botón para regresar a los detalles de la institución --%>
               <html:submit 
                   styleClass = "button" 
                   property   = "operacionInstitucion" 
                   value      = "Detalle_Institucion"/>
               
			   <%-- Botón para regresar a listar las carreras --%>
               <html:submit 
                   styleClass = "button" 
                   property   = "operacionInstitucion" 
                   value      = "Listar_Carreras"/>
               

            </center>
        </html:form>
        
    </body>
</html>