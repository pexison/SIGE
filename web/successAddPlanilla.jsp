<%-- 
    Document   : successAddPlanilla
    Created on : 16/10/2013, 04:00:10 AM
    Author     : andreso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<%@page import="java.util.* , modelo.* , frijoles.*" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGE - Planilla agregada con éxito<</title>
    </head>
    <body>
        
        <center><h1>Su Planilla de Solicitud ha sido registrada con éxito en el sistema</h1></center>
        <h2>A partir de este momento su solicitud comenzará a ser analizada. 
            Manténgase por favor al tanto de los medios de comunicación
            (email y télefonos) indicados por ud.</h2>
        

            <li><h2>Volver</h2></li>
            <%-- Enlace para salir del sistema --%>
            <html:link
                      onclick    = "return confirmarExit()" 
                      forward    = "login">Salir
            </html:link>
    </body>
</html>
