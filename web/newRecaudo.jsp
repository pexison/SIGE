<%-- 
    Document   : newRecaudo
    Created on : Oct 17, 2013, 12:15:31 AM
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

        <title>SIGE - Carga de Recaudos</title>
        
        
    </head>
    <body><center>
        <h1>Cargar un recaudo:</h1>
        
        <%RecaudoForm rf = (RecaudoForm) request.getAttribute("RecaudoForm");%>
        
        <p><%=rf.getCodigo_planilla()%></p>
        <html:form action="/gestionRecaudo" method="POST">
            <html:hidden property="codigo_planilla" value="<%=rf.getCodigo_planilla()%>"/>
            <html:select property="tipo_recaudo">
                <html:option value = "A"/>
                <html:option value = "B"/>
                <html:option value = "C"/>
                
            </html:select>
            
            <html:hidden property="operacionRecaudo" value="Agregar"/>
            <html:file property="datos_recaudo"/>
            <html:submit property="submit" value ="Subir el recaudo"/>
        </html:form>
        
    </center></body>
</html>
