<%-- 
    Document   : successAddEquivalencia
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
        <title>SEA - Carrera registrada con éxito</title>
    </head>
    <body>
        <h1>¡Equivalencia agregada con éxito!</h1>
        <html:form action="/gestionInstitucion" method="POST">
            
            <%-- Obtener el nombre de la carrera y 
                 el código de la institución --%>

            <% EquivalenciaForm ef = ((EquivalenciaForm) 
               request.getAttribute("EquivalenciaForm")) ;
               String nEquivalencia = ef.getCodigoEquivalencia();%>
               
            <center>
               <li>Se ha agregado la equivalencia <%=nEquivalencia%></li>
               
               <li><h2>Volver: </h2></li>
                                  
               <%-- Botón para volver a detalles de la institución --%>
               <html:submit 
                   styleClass = "button" 
                   property   = "operacionInstitucion" 
                   value      = "Detalle_Institucion"/>
                   
               <%-- Botón para volver a listar carreras --%>
               <html:submit 
                   styleClass = "button" 
                   property   = "operacionInstitucion" 
                   value      = "Listar_Carreras"/>

               
            </center>
        </html:form>
        
    </body>
</html>
