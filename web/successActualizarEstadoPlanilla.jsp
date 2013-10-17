<%-- 
    Document   : successActualizarEstadoPlanilla
    Created on : Oct 16, 2013, 10:25:26 PM
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
        
        <center><h1>Éxito al actualizar el estado de la planilla</h1></center>
        
        <center><h1>El nuevo estado de la planilla es: <%=edo_planilla%></h1></center>
    </body>
</html>
