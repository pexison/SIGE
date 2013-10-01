<%-- 
    Document   : errorLogin
    Created on : May 28, 2013, 3:38:52 PM
    Author     : acs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
        <title>SEA - Error al agregar Institución</title>
    </head>
    <body>
        
        <h1>Error - No se ha podido crear la institución    </h1>
        
        <html:form action="/gestionInstitucion" method="POST">
            
            <%-- Botón para regresar a listar las instituciones --%>
            <html:submit 
                styleClass = "button" 
                property   = "operacionInstitucion" 
                value      = "Listar_Instituciones"/>
            
        </html:form>
    </body>
</html>
