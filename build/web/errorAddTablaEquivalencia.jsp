<%-- 
    Document   : errorAddTablaEquivalencia
    Created on : 29/09/2013, 01:40:59 AM
    Author     : andreso
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<%@page import="java.util.* , frijoles.*, modelo.*" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
        <title>SEA - Error al agregar la Tabla de Equivalencia</title>
    </head>
    <body>
        
        
        <%TablaEquivalenciaForm te = (TablaEquivalenciaForm) 
                    request.getAttribute("TablaEquivalenciaForm");
            
            String codInstOrig = te.getCodigoInstitucionOrigen();
            String codInstDest = te.getCodigoInstitucionDestino();
            String codCarrOrig = te.getCodigoCarreraOrigen();
            String codCarrDest = te.getCodigoCarreraDestino();
            
            %>
            
        
        <h1>Error - No se ha podido crear la Tabla de Equivalencia    </h1>
        
        <li><h2>Volver:</h2></li>
        
        <html:form action="/gestionTablaEquivalencia" method="POST">
            
            <html:hidden 
                property = "codigoInstitucionOrigen"
                value = "<%=codInstOrig%>"/>

            <html:hidden 
                property = "codigoInstitucionDestino"
                value = "<%=codInstDest%>"/>

            <html:hidden 
                property = "codigoCarreraOrigen"
                value = "<%=codCarrOrig%>"/>

            <html:hidden 
                property = "codigoCarreraDestino"
                value = "<%=codCarrDest%>"/>
            
            <%-- Botón para regresar a la lista de tablas --%>
            <html:submit 
                styleClass = "button" 
                property   = "operacionTabla" 
                value      = "Listar_Tablas"/>
            <%-- Botón para regresar a listar las instituciones --%>
            <html:submit 
                styleClass = "button" 
                property   = "operacionTabla" 
                value      = "Listar_Instituciones"/>
            
        </html:form>
    </body>
</html>
