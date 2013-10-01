<%--     
Document   : errorRmInstitucion
    Created on : May 29, 2013, 10:54:50 AM
    Author     : fertaku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
        <title>Error</title>
    </head>
     <body>
     <center>
        <h1>Error al ver la institución.</h1>
        <li>No hay instituciones disponibles</li>
        <br>
        <html:form action="/gestionInstitucion" method="POST">
            
            <%-- Botón para regresar a listar instituciones --%>
            <html:submit 
                styleClass = "button" 
                property   = "operacionInstitucion" 
                value      = "Listar_Instituciones"/>
            
        </html:form>
    </center>
    </body>
</html>
