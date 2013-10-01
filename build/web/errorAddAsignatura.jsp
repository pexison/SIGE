<%-- 
    Document   : successAddCarrera
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
        <title>SEA - Error registro asignatura</title>
    </head>
    <body>
        <h1>Error al agregar asignatura</h1>
        <html:form action="/gestionInstitucion" method="POST">
            
            <%-- Obtener el nombre de la asignatura y 
                 el código de la institución --%>

            <% InstitucionForm cf = ((InstitucionForm) 
               request.getAttribute("InstitucionForm")) ;
               String nInst = cf.getNombreInstitucion();
               String cInst = cf.getCodigoInstitucion();%>
               
            <center>
               <li>No se ha podido agregar la asignatura.</li>
               
               <li><h2>Volver: </h2></li>
               
               <html:hidden 
                   property   = "nombreInstitucion" 
                   value      = "<%=nInst%>"/>
               
               <html:hidden 
                   property   = "codigoInstitucion" 
                   value      = "<%=cInst%>"/>
                   
               <%-- Botón para volver a listar carreras --%>
               <html:submit 
                   styleClass = "button" 
                   property   = "operacionInstitucion" 
                   value      = "Listar_Asignaturas"/>

               
            </center>
        </html:form>