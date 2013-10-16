<%-- 
    Document   : listarPlanilla
    Created on : 16/10/2013, 04:41:08 AM
    Author     : andreso
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<%@page import="java.util.* , frijoles.*" %>

<!DOCTYPE html>
<html>
    <head>
        
        <link rel="stylesheet" type="text/css" href="style.css">
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>SIGE - Gestión de Planillas</title>
        
    </head>
    
    <body>
        
     <center><h1>Gestión de Instituciones</h1></center>
     
     <li><h2>Planillas de Solicitud disponibles:</h2></li>
        <%-- Obtenemos la lista de instituciones --%>
        
        <%-- Lista de instituciones disponibles en la base de datos --%>
        <html:form action="/gestionPlanilla" method="POST">
            
            <%ArrayList<PlanillaForm> listaPlanilla = 
            ((ArrayList<PlanillaForm>) 
            request.getAttribute("ListaPlanilla")); %>
            
            <% if (!listaPlanilla.isEmpty()) { %>
            <html:select styleClass="button" property="codigo_planilla" >

                <%for (int i=0; i<listaPlanilla.size();i++) { 
                    String ced_aspirante  =listaPlanilla.get(i).getCedula_aspirante();
                    String cod_planilla   =listaPlanilla.get(i).getCodigo_planilla();
                    String estado_planilla=listaPlanilla.get(i).getEstado_planilla();
                    String tipo_ingreso   = listaPlanilla.get(i).getTipo_ingreso(); %>
                    <%-- Creamos la lista desplegable con las instituciones --%>
                    <html:option value="<%=cod_planilla%>">-<%=ced_aspirante%>-
                          <%=cod_planilla%>-<%=estado_planilla%>-
                          <%=tipo_ingreso%>
                    </html:option>
                <%}%>
            </html:select>
            
            <%-- Boton para ver los detalles de la institucion seleccionada --%>            
            <html:submit 
                styleClass = "button" 
                property   = "operacionPlanilla"
                value      = "Detalle_Planilla">
            </html:submit>
            
            <% } else { %>
                <li> No hay Planillas disponibles. </li>
            <%}%>

            
        </html:form>
    
    
    
    </body>
</html>
