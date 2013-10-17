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
    <body><center>
        
        <% PlanillaForm pf = (PlanillaForm) request.getAttribute("PlanillaForm");%>

        <h1>Proceda ahora con la carga de recaudos: </h1>
        
        <html:form action="/gestionRecaudo" method="POST">
            
            <html:hidden property="codigo_planilla" value="<%=pf.getCodigo_planilla()%>" />
            
            <html:hidden property="operacionRecaudo" value="Cargar_Recaudo"/>
            
            <html:submit 
                styleClass = "button" 
                value      = "Cargar un Recaudo">
            </html:submit>
        </html:form>
        
        <li><h2>Volver</h2></li>
        <%-- Enlace para salir del sistema --%>
        <html:link
                  onclick    = "return confirmarExit()" 
                  forward    = "login">Salir
        </html:link>
        
        
    </center></body>
</html>
