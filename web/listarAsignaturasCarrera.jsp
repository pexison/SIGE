<%-- 
    Document   : listarAsignaturasCarrera
    Created on : Jun 29, 2013, 11:56:39 PM
    Author     : fertaku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<%@page import="java.util.* , frijoles.*, modelo.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
        <title>SEA - Asignaturas Requeridas</title>
    </head>
    <body>
         <%-- Script auxiliar para las diversas confirmaciones --%>
        <script type="text/javascript">

            <%-- Función para confirmar que se desea agregar o eliminar una
                 asignatura requerida--%>
            function confirmarAccion(){
                var confirmarM = confirm("¿Desea continuar?");
                return confirmarM;       
            }
            <%-- Funcion que pregunta si de verdad se desea abandonar la sesion --%>
            function confirmarExit(){
                var confirmarE = confirm("¿Desea abandonar la Sesión?");
                return confirmarE;       
            }
            
            
        
        </script>
        
        
    <center>
        
        <h1>Requerimientos de la Carrera.</h1>
        
        <%-- Obtener la lista de las instituciones --%>
        <%ArrayList<AsignaturaForm> listaAsig = 
                    ((ArrayList<AsignaturaForm>) 
                    request.getAttribute("ListaAsignaturasRequeridas")); %>
        
        <%CarreraRequiereAsignaturaForm cf = (CarreraRequiereAsignaturaForm) 
                request.getAttribute("CarreraRequiereAsignaturaForm");
          String codigoInst = cf.getCodigoInstitucion();
          String codigoCarr = cf.getCodigoCarrera();%>
        <table> 
        <tr>
        <td>
        <font size ="3">
        <center><li> Asignaturas requeridas por la carrera: </li></center>
        </font>
            
        <html:form action="/gestionCarreraRequiereAsignatura" method="POST">
            
            <% if (!listaAsig.isEmpty()) { %>
                <html:select styleClass="button" property="codigoAsignatura">

                    <% for (int i=0; i<listaAsig.size();i++) { 
                    String nombreAsig=listaAsig.get(i).getNombreAsignatura();
                    String codAsig = listaAsig.get(i).getCodigoAsignatura();%>

                    <html:option value="<%=codAsig%>">
                            <%=codAsig%> - <%=nombreAsig%>
                    </html:option>

                    <%}%>

                </html:select>         

                <html:hidden property="codigoInstitucion" value="<%=codigoInst%>"/>

                <html:hidden property="codigoCarrera" value="<%=codigoCarr%>"/> 

                <html:submit property   = "operacionRequiereAsignatura"
                             value      = "Eliminar_Requerimiento"
                             styleClass = "button" 
                             onclick   = "return confirmarAccion()"/>
            <%} else {%>
                <li>No hay asignaturas asociadas a esta Carrera.  </li>
            <%}%>
        </html:form>
        </td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td>
        <%-- Obtener la lista de las instituciones --%>
        <%ArrayList<AsignaturaForm> listaAsigNoRequeridas = 
                    ((ArrayList<AsignaturaForm>) 
                    request.getAttribute("ListaAsignaturasNoRequeridas")); %>
        
        <font size ="3">
        <center><li> Asignaturas No requeridas por la carrera: </li></center>
        </font>           
                    
        <html:form action="/gestionCarreraRequiereAsignatura" method="POST">
            
            <% if (!listaAsigNoRequeridas.isEmpty()) { %>
                <html:select styleClass="button" property="codigoAsignatura">

                    <% for (int i=0; i<listaAsigNoRequeridas.size();i++) { 
                    String nombreAsig=listaAsigNoRequeridas.get(i).getNombreAsignatura();
                    String codAsig = listaAsigNoRequeridas.get(i).getCodigoAsignatura();%>

                    <html:option value="<%=codAsig%>">
                            <%=codAsig%> - <%=nombreAsig%>
                    </html:option>

                    <%}%>

                </html:select>         

                <html:hidden property="codigoInstitucion" value="<%=codigoInst%>"/>

                <html:hidden property="codigoCarrera" value="<%=codigoCarr%>"/> 

                <html:submit property   = "operacionRequiereAsignatura"
                             value      = "Agregar_Requerimiento"
                             styleClass = "button" 
                             onclick     = "return confirmarAccion()"/>
            <%} else {%>
                <li>No hay asignaturas disponibles para asociar.  </li>
            <%}%>
        </html:form>
        </td>
        </tr>
        </table>
         <li><h2>Volver: </h2></li> 
                    
        <html:form action="/gestionCarrera" method="POST">            
      
              <%-- Botón para ver detalle de la carrera --%>
               <html:hidden  
                    property = "codigoInstitucion" 
                    value    = "<%=codigoInst%>"/>
                    
               <html:hidden  
                    property = "codigoCarrera" 
                    value    = "<%=codigoCarr%>"/>
                    
               <html:submit 
                    styleClass = "button" 
                    property   = "operacionCarrera" 
                    value      = "Detalle_Carrera"/>
            
                <br/><br/>
              <%-- Enlace para salir del sistema --%>
              <html:link 
                  onclick    = "return confirmarExit()" 
                  forward    = "login">Salir
              </html:link>
                    
        </html:form>    
    </center>
    </body>
</html>
