<%-- 
    Document   : addInstitucion
    Created on : May 27, 2013, 11:10:36 PM
    Author     : fertaku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
        <title>Institución Agregada.</title>
    </head>
    <body>
        <h1>La institución se agregó con éxito</h1>
        <html:form action="/gestionInstitucion" method="POST">

            <%-- Botón para retornar a listar las instituciones --%>
            <html:submit 
                styleClass  =  "button" 
                property    =  "operacionInstitucion" 
                value       =  "Listar_Instituciones"/>
        </html:form>
        
    </body>
</html>
