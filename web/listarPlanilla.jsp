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
        
        <style>
            table { 
                border-collapse: collapse; 
                }
            td, th { border: 1px solid #CCC;}
        </style>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>SIGE - Gestión de Planillas</title>
        
    </head>
    
    <body>
        
     <center><h1>Gestión de Planillas</h1></center>
     
        
        <%-- Lista de planillas disponibles en la base de datos --%>
        <html:form action="/gestionPlanilla" method="POST">
            
            <%ArrayList<PlanillaForm> listaPlanilla = 
            ((ArrayList<PlanillaForm>) 
            request.getAttribute("ListaPlanilla")); 
            PlanillaForm pf = (PlanillaForm) request.getAttribute("PlanillaForm");
            String edo_planilla = pf.getEstado_planilla();
            %>
            
            
            <li><h2>Planillas de Solicitud <%=edo_planilla%>s:</h2></li>
            
            <% if (!listaPlanilla.isEmpty()) { %>
            <table>

                <tr bgcolor="6699CC" align="center">
                    <th>Código Planilla</th>
                    <th>Cédula Identidad Aspirante</th>
                    <th>Estado Planilla</th>
                    <th>Tipo Ingreso</th>
                    <th>Institución Origen</th>
                    <th>Institución Destino</th>
                    <th>Acción</th>
                </tr>

                <%for (int i=0; i<listaPlanilla.size();i++) { 
                    String ced_aspirante  =listaPlanilla.get(i).getCedula_aspirante();
                    String cod_planilla   =listaPlanilla.get(i).getCodigo_planilla();
                    String estado_planilla=listaPlanilla.get(i).getEstado_planilla();
                    String tipo_ingreso   = listaPlanilla.get(i).getTipo_ingreso(); 
                    String inst_origen    = listaPlanilla.get(i).getNombre_institucion_origen();
                    String inst_destino   = listaPlanilla.get(i).getNombre_institucion_destino();
                    String carrera_origen    = listaPlanilla.get(i).getNombre_carrera_origen();
                    String carrera_destino   = listaPlanilla.get(i).getNombre_carrera_destino();
                %>

                    <tr>
                        <html:form action = "/gestionPlanilla" method = "POST">

                            <td><%=cod_planilla%></td>
                            <td><%=ced_aspirante%></td>
                            <td><%=estado_planilla%></td>
                            <td><%=tipo_ingreso%></td>
                            <td><%=inst_origen%></td>
                            <td><%=inst_destino%></td>
                           
                            
                            <html:hidden  property = "codigo_planilla" 
                                          value    = "<%=cod_planilla%>"/>
            
                            <html:hidden  property = "cedula_aspirante" 
                                          value    = "<%=ced_aspirante%>"/>

                            <html:hidden  property = "estado_planilla" 
                                          value    = "<%=estado_planilla%>"/>

                            <html:hidden  property = "tipo_ingreso" 
                                          value    = "<%=tipo_ingreso%>"/>
                                          
                            <html:hidden  property = "nombre_institucion_origen" 
                                          value    = "<%=inst_origen%>"/>
                                
                            <html:hidden  property = "nombre_institucion_destino" 
                                          value    = "<%=inst_destino%>"/>
                                          
                            <html:hidden  property = "nombre_carrera_origen" 
                                          value    = "<%=carrera_origen%>"/>
                                
                            <html:hidden  property = "nombre_carrera_destino" 
                                          value    = "<%=carrera_destino%>"/>
                            
                                <%-- Boton para ver los detalles de la planilla seleccionada --%>            
                            <td><html:submit 
                                styleClass = "button" 
                                property   = "operacionPlanilla"
                                value      = "Detalle_Planilla">
                            </html:submit></td>
                        </html:form>
                    </tr>
                <%}%>
              
             </table>

            <% } else { %>
                <li> No hay Planillas disponibles. </li>
            <%}%>

            
        </html:form>
    
        
    
         <li><h2>Volver:</h2></li>
        <%-- Enlace para salir del sistema --%>
        <html:form action="/gestionPlanilla" method="POST">
              
           <html:hidden property="operacionPlanilla" value="Consultar_Planillas" />
           <html:submit 
                    styleClass   =   "button"
                    property     =   "submit"
                    value        =   "Consulta de Planillas"/>
        </html:form>
        <br>
        
        <html:link 
                 onclick    = "return confirmarExit()" 
                 forward    = "login"> Salir
        </html:link>
    
    </body>
</html>
