<%-- 
    Document   : successAddRecaudo
    Created on : 18/10/2013, 08:01:49 AM
    Author     : andreso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@page import="java.util.* , frijoles.*" %><!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGE - Planilla registrada con éxito</title>
    </head>
    <body>
     <script type="text/javascript">
        
         <%-- Función para confirmar que se desea continuar con la operacion --%>
        function confirmarAccion(){
            var confirmarM = confirm("¿Desea continuar?");
            return confirmarM;       
        } 
        
       <%-- Función para confirmar si se desea salir --%>
       function confirmarExit(){
           var confirmarE = confirm("¿Desea abandonar la Sesión?");
           return confirmarE;       
       }
       // -->
    </script>
    <center>
        <h1>Ha finalizado de realizar su solicitud!</h1>
        
        <html:form action="/gestionRecaudo" method="POST">
            
            <% RecaudoForm rf = (RecaudoForm) request.getAttribute("RecaudoForm");%>

            <html:hidden property="operacionRecaudo" value="volver_inicio"/>
            <html:hidden property="codigo_planilla" value="<%=rf.getCodigo_planilla()%>"/>
            <html:submit styleClass = "button" 
                         property="submit"
                         onclick = "return confirmarAccion()"
                         value="Volver al Inicio"/>
            
        </html:form>
        
    </center></body>
</html>
