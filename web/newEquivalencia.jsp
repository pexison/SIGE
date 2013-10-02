<%-- 
    Document   : newEquivalencia
    Created on : 29/09/2013, 02:37:23 AM
    Author     : andreso
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>


<%@page import="java.util.* , frijoles.*, modelo.*" %>
<!DOCTYPE html>


<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>SEA - Registrar Equivalencia</title>
    </head>
    
    <body>
        
        <script type="text/javascript">
        <!--

        <%-- Función para verificar que los campos estén llenos --%>
        <%-- Función que verifica que las instituciones Orig y Dest difieran --%>
        function verificarCamposVacios() {
            return true;
        }
        
        <%-- Función para confirmar que se desea modificar la institución --%>
        function confirmarAccion(){
            var confirmarM = confirm("¿Desea continuar?");
            return confirmarM;       
        }
        
        // -->
        </script>
        
        
        <center>

            <h1>Registro de Equivalencias</h1>
            
       <%EquivalenciaForm eq = 
                ((EquivalenciaForm)request.getAttribute("EquivalenciaForm"));
       String codigoInstOrigen = eq.getCodigoInstitucionOrigen();
       String codigoInstDestino = eq.getCodigoInstitucionDestino();
       String codigoCarrOrigen = eq.getCodigoCarreraOrigen();
       String codigoCarrDestino = eq.getCodigoCarreraDestino();
       
       GestionInstitucion gi = new GestionInstitucion();
       GestionAsignatura ga  = new GestionAsignatura();
       
       InstitucionForm ifOrigen = gi.obtenerInstitucion(codigoInstOrigen);
       InstitucionForm ifDestino = gi.obtenerInstitucion(codigoInstDestino);
     
       ArrayList<AsignaturaForm> listaAsigOrigen  = ga.listarAsignaturas(codigoInstOrigen, codigoCarrOrigen);
       ArrayList<AsignaturaForm> listaAsigDestino = ga.listarAsignaturas(codigoInstDestino, codigoCarrDestino);
       boolean listaAsigOrigenVacia  = listaAsigOrigen.isEmpty();
       boolean listaAsigDestinoVacia = listaAsigDestino.isEmpty();
       
        %>
        
        
        <html:form 
                        onsubmit = "return validarCampos()"
                        action   = "/gestionEquivalencia" 
                        method   = "POST">
         <table><tr>
            <td>
                <% if (!listaAsigOrigenVacia) { %>
                
                
                    <p> Seleccione Asignaturas Origen </p>
                    <logic:iterate name="EquivalenciaForm" id="item" property="possibleOptionsOrigen">
                        <html:multibox property="selectedOptionsOrigen">
                            <bean:write name="item" property="value"/>
                        </html:multibox>
                        <bean:write name="item" property="label"/><br />
                    </logic:iterate>
                            
              <%} else {%>
            
                
                 <p> No hay asignaturas registradas en la Carrera de Origen</p>
                 <p> por favor regrese al apartado de gestion de carreras</p>
                 <p> para asignar las asignaturas permitentes.</p>
            
               <%}%>
                            
            </td><td>
                
            
                <% if (!listaAsigDestinoVacia) { %>    
                       <p> Seleccione Asignaturas Destino </p>
                       <logic:iterate name="EquivalenciaForm" id="item" property="possibleOptionsDestino">
                           <html:multibox property="selectedOptionsDestino">
                               <bean:write name="item" property="value"/>
                           </html:multibox>
                           <bean:write name="item" property="label"/><br />
                       </logic:iterate>

                
              <%} else {%>   
              
                 <p> No hay asignaturas registradas en la Carrera de Destino</p>
                 <p> por favor regrese al apartado de gestion de carreras</p>
                 <p> para asignar las asignaturas permitentes.</p>
                 
               <%}%>
                
            </td></tr>
             
                <% if (!listaAsigOrigenVacia & !listaAsigDestinoVacia) { %>
                   <tr colspan="2">
                   <td><center>
                        
                        <html:hidden property="operacionEquivalencia" value="Agregar_Equivalencia" />
                        <html:submit 
                            styleClass   =   "button"
                            onclick      =   "return verificarCamposVacios()"
                            property     =   "submit"
                            value        =   "Agregar Equivalencia"/></center></td>
                  </tr>
                <%}%>
            
            </table>  
            
                    <html:hidden  property = "codigoInstitucionOrigen" 
                                  value    = "<%=codigoInstOrigen%>"/>
                                  
                    <html:hidden  property = "codigoInstitucionDestino" 
                                  value    = "<%=codigoInstDestino%>"/>
                                  
                    <html:hidden  property = "codigoCarreraOrigen" 
                                  value    = "<%=codigoCarrOrigen%>"/>
                                  
                    <html:hidden  property = "codigoCarreraDestino" 
                                  value    = "<%=codigoCarrDestino%>"/>
            
            </html:form>
       </center>      
    </body>
    
    
</html>
