<%-- 
    Document   : errorAddCarrera
    Created on : May 28, 2013, 10:34:15 PM
    Author     : john
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@page import="java.util.* , frijoles.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 
        <title>SEA - Error al registrar Equivalencia</title>
    </head>
    <body>
        <h1>No se ha podido cargar la equivalencia al sistema.</h1>
        
        <html:form action="/gestionInstitucion" method="POST">
            

            <center>
               <li>Error al agregar equivalencia</li>

            </center>
        </html:form>
        
    </body>
</html>