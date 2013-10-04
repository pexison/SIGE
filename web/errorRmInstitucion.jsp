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
        <title>SIGE - Error al eliminar la institución</title>
    </head>
     <body>
        <h1>Error al eliminar la institución.</h1>
        
        <html:form action="/gestionInstitucion" method="POST">
            
            <%-- Botón para volver a listar instituciones --%>
            <html:submit 
                styleClass = "button" 
                property   = "operacionInstitucion" 
                value      = "Listar_Instituciones"/>
            
        </html:form>
        
    </body>
</html>
