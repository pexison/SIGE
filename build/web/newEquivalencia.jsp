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

        <title>SIGE - Registrar Equivalencia</title>
    </head>
    
    <body>
        
        <script type="text/javascript">

        <%-- Función para confirmar que se desea abandonar la pagina --%>
        function confirmarVolver(){
            var confirmarM = confirm("¿Abandonar esta página?");
            return confirmarM;       
        }

        <%-- Función para confirmar que se desea modificar la equivalencia --%>
        function confirmarAccion(){
            var confirmarM = confirm("¿Desea continuar?");
            return confirmarM;       
        }
        
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
         <table>
            <th> Seleccione las Asignaturas correspondientes a la Institución 
                        de Origen. Puede seleccionar una o más opciones: </th>
            
            <th> Seleccione las Asignaturas correspondientes a la Institución 
                        de Destino. Puede seleccionar una o más opciones: </th>
            <tr><br/></tr><tr>
            <td valign="top">
                <% if (!listaAsigOrigenVacia) { %>
                
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
                            
            </td><td valign="top">
                
            
                <% if (!listaAsigDestinoVacia) { %>    

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
                       <td colspan="2"><center>
                        
                        <html:hidden property="operacionEquivalencia" value="Agregar_Equivalencia" />
                        <html:submit 
                            styleClass   =   "button"
                            onclick      =   "return confirmarAccion()"
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
    
        <li><h2>Volver:</h2></li>
        <html:form action="/gestionTablaEquivalencia" method="POST">
            <html:hidden  property = "codigoInstitucionOrigen" 
                            value    = "<%=codigoInstOrigen%>"/>

            <html:hidden  property = "codigoInstitucionDestino" 
                            value    = "<%=codigoInstDestino%>"/>
            
            <html:hidden  property = "codigoCarreraOrigen" 
                            value    = "<%=codigoCarrOrigen%>"/>
                            
            <html:hidden  property = "codigoCarreraDestino" 
                            value    = "<%=codigoCarrDestino%>"/>
                            
            <html:hidden property="operacionTabla" value="Detalles" />
            
            
            <html:submit 
                styleClass   =   "button"
                onclick      =   "return confirmarVolver()"
                property     =   "submit"
                value        =   "Volver a los detalles de la tabla"/>           
        </html:form>
    </body>
    
    
</html>
