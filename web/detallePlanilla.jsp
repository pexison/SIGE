<%-- 
    Document   : detallePlanilla
    Created on : Oct 16, 2013, 9:33:52 PM
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
    <body>
        <center><h1>Detalles de la Planilla</h1></center>
        <%  PlanillaForm pf = (PlanillaForm) request.getAttribute("PlanillaForm");
            
            String cedula = pf.getCedula_aspirante();
            String codigoPlanilla = pf.getCodigo_planilla();
            String edo_planilla = pf.getEstado_planilla();
            String tipoIngreso = pf.getTipo_ingreso();
            String instOrigen = pf.getNombre_institucion_origen();
            String instDestino = pf.getNombre_institucion_destino();
            String carrOrigen = pf.getNombre_carrera_origen();
            String carrDestino = pf.getNombre_carrera_destino();
            
            %>
        
        <table>
            <tr>
                <td>Cédula del aspirante: </td>
                <td><%=cedula%></td>
            </tr>
            <tr>
                <td>Código de la planilla </td>
                <td><%=codigoPlanilla%></td>
            </tr>
            <tr>
                <td>Estado de la Planilla: </td>
                <td><%=edo_planilla%></td>
            </tr>
            <tr>
                <td>Tipo de Ingreso: </td>
                <td><%=tipoIngreso%></td>
            </tr>
            <tr>
                <td>Institución de Origen: </td>
                <td><%=instOrigen%></td>
            </tr>
            <tr>
                <td>Institución de Destino: </td>
                <td><%=instDestino%></td>
            </tr>
            <tr>
                <td>Carrera de Origen: </td>
                <td><%=carrOrigen%></td>
            </tr>
            <tr>
                <td>Carrera de Destino: </td>
                <td><%=carrDestino%></td>
            </tr>
        </table>
            
                <% if (edo_planilla.equals("Pendiente")) {%>
        
            <html:form action="/gestionPlanilla" method="POST">
                
                <html:hidden  property = "codigo_planilla" value = "<%=codigoPlanilla%>"/> 

                  <%-- Botón para ir a la página de Gestionar Peticiones de Equivalencia 
                     que están ya aprobadas--%>
                <h3>  ¿Desea aprobar esta Planilla? </h3>        
                <html:hidden property="operacionPlanilla" value="Aceptar_Planilla" />
                
                <html:submit 
                    styleClass   =   "button"
                    property     =   "submit"
                    value        =   "Aceptar Planilla de Solicitud"/>
            </html:form>
                
            
            <html:form action="/gestionPlanilla" method="POST">
                
                <html:hidden  property = "codigo_planilla" value = "<%=codigoPlanilla%>"/>
                <h3>  ¿Desea rechazar esta Planilla? </h3>        
                <html:hidden property="operacionPlanilla" value="Rechazar_Planilla" />
                
                <html:submit 
                    styleClass   =   "button"
                    property     =   "submit"
                    value        =   "Rechazar Planilla de Solicitud"/>
            </html:form>
         <%}%>
    </body>
</html>
