<%-- 
    Document   : successRmCarrera
    Created on : 30/05/2013, 08:44:54 AM
    Author     : andreso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@page import="java.util.* , frijoles.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>SEA - Carrera eliminada con éxito</title>
    </head>
    <body>
    <center>
        <h1>La carrera se eliminó con éxito.</h1>
        <html:form action="/gestionInstitucion" method="POST">

            <%-- Obtener el nombre de la carrera y
                 el código de la institución --%>            
            <% CarreraForm cf = ((CarreraForm) 
               request.getAttribute("CarreraForm")) ;
               String nCarrera = cf.getNombreCarrera();
               String codCarr = cf.getCodigoCarrera();
               String cInst = cf.getCodigoInstitucion();%>
               
               <li>¡Se ha eliminado la carrera exitosamente!</li>
               
               </br></br>
               
               <html:hidden property="codigoInstitucion" value="<%=cInst%>"/>
               
               <%-- Botón para volver a listar carreras --%>
               <html:submit 
                   styleClass = "button" 
                   property   = "operacionInstitucion" 
                   value      = "Listar_Carreras"/>
               
        </html:form>
    </center>
    </body>
</html>
