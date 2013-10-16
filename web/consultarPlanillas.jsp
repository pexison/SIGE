<%-- 
    Document   : consultarPlanillas
    Created on : Oct 16, 2013, 6:32:26 PM
    Author     : fertaku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@page import="java.util.* , modelo.*, frijoles.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>SIGE - Gestión de Planillas</title>
    </head>
    <body><center>
        <h1>Consultar Planillas</h1>
        
        <html:form action="/gestionPlanilla" method="POST">

            <%-- Botón para ir a la página de Gestionar Peticiones de Equivalencia --%>
            <h3>  ¿Desea listar las planillas pendientes? </h3>        
            <html:hidden property="operacionPlanilla" value="Consultar_Planillas" />
            <html:submit 
                styleClass   =   "button"
                property     =   "submit"
                value        =   "Listar planillas de Equivalencia Pendientes"/>
        </html:form>
        
    </center></body>
</html>
