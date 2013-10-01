<%-- 
    Document   : verTablaEquivalencia
    Created on : Sep 28, 2013, 12:59:04 PM
    Author     : fertaku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<%@page import="java.util.* , frijoles.*, modelo.*" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        
        <style>
            table { 
                border-collapse: collapse; 
                }
            td, th { border: 1px solid #CCC;}
        </style>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>SEA - Gestión de Tablas de Equivalencia</title>
    </head>
    <body>
        
        <%ArrayList<EquivalenciaForm> listaEquiv = 
            ((ArrayList<EquivalenciaForm>) 
            request.getAttribute("ListaEquivalencias")); %>
            
        <h1>Detalles de las equivalencias ofrecidas para la Tabla</h1>
        
        <% if (!listaEquiv.isEmpty()) { %>
        
        <table>
            <tr bgcolor="6699CC">
                <th width="120px" rowspan="2"> Codigo Equivalencia </th>
                <th width="500px" colspan="3"> Materias ofrecidas en la institucion de Origen </th>
                <th width="500px" colspan="3"> Materias ofrecidas en la institucion de Destino </th>
            </tr>
            
            <tr bgcolor="6699CC" align="center">
                <td>Codigo</td><td>Nombre</td><td>Creditos</td>
                <td>Codigo</td><td>Nombre</td><td>Creditos</td>
            </tr>
            
            <%for (int i=0; i<listaEquiv.size();i++) { 
              EquivalenciaForm equiv = listaEquiv.get(i);%>
              
                <%ArrayList<AsignaturaForm> asignaturasOrigen = equiv.getAsignaturasOrigen();
                    AsignaturaForm asigActual;%>
                    
                <%ArrayList<AsignaturaForm> asignaturasDestino = equiv.getAsignaturasDestino();
                 int maxNumeroMaterias = Math.max(asignaturasOrigen.size(), asignaturasDestino.size());%>

                <tr height="25"/>
                <tr bgcolor="#F0F0F0" align="center">
                    <td rowspan="<%=maxNumeroMaterias%>"> <%=equiv.getCodigoEquivalencia()%> </td>
                 
                <%for (int j=0; j<maxNumeroMaterias;j++) { %>
                

                    <%if (j<asignaturasOrigen.size()) {
                    asigActual = asignaturasOrigen.get(j);%>

                    <td><%=asigActual.getCodigoAsignatura()%></td>
                    <td><%=asigActual.getNombreAsignatura()%></td>
                    <td><%=asigActual.getCreditos()%></td>

                    <%}%>

                    <%if (j<asignaturasDestino.size()) {
                    asigActual = asignaturasDestino.get(j);%>

                    <td><%=asigActual.getCodigoAsignatura()%></td>
                    <td><%=asigActual.getNombreAsignatura()%></td>
                    <td><%=asigActual.getCreditos()%></td>

                    <%}%>

                </tr><tr bgcolor="#F0F0F0" align="center">
                <%}%>
                </tr>
                
                
            <%}%>
        <table>
        
        <% } else { %>
            
            <p>No hay equivalencias disponibles para esta tabla</p>
        
        <%}%>
        
        
        
        <html:form action="/gestionEquivalencia" method="POST">
        <%-- Botón para regresar a las instituciones de las Tablas --%>
        <html:submit 
                 styleClass = "button"  
                 property   = "operacionEquivalencia" 
                 value      = "Crear_Equivalencia"/>

        <br/><br/>
        </html:form>
        
        <br/><br/>
        <li><h2>Volver: </h2></li>
        
        <html:form action="/gestionTablaEquivalencia" method="POST">
        <%-- Botón para regresar a las instituciones de las Tablas --%>
        <html:submit 
                 styleClass = "button"  
                 property   = "operacionTabla" 
                 value      = "Listar_Instituciones"/>

        <br/><br/>
        </html:form>
        
        <%-- Enlace para salir del sistema --%>
        <html:link 
                  onclick    = "return confirmarExit()" 
                  forward    = "login">Salir
        </html:link>
        <br/><br/>
        
    </body>
</html>