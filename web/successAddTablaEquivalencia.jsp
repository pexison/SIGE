<%-- 
    Document   : successAddTablaEquivalencia
    Created on : 29/09/2013, 01:40:59 AM
    Author     : andreso
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
        <title>SEA - Exito al agregar la Tabla de Equivalencia</title>
    </head>
    <body>
        
        <h1>Exito - Se creao la Tabla de Equivalencia satisfactoriamente  </h1>
        
        <html:form action="/gestionTablaEquivalencia" method="POST">
            
            <%-- Botón para regresar a listar las instituciones --%>
            <html:submit 
                styleClass = "button" 
                property   = "operacionTabla" 
                value      = "Listar_Instituciones"/>
            
        </html:form>
    </body>
</html>
