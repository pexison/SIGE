<%-- 
    Document   : listarTablas
    Created on : Jun 28, 2013, 9:01:47 AM
    Author     : fertaku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<%@page import="java.util.* , frijoles.*" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>SEA - Gestión de Tablas de Equivalencia</title>
    </head>
    <body>
        
        <%-- Script auxiliar para confirmar los vinculos de retorno --%>
        <script type="text/javascript">
        
        
        <%-- Función que verifica que las instituciones Orig y Dest difieran --%>
        function verificarInstitucionesDifentes(codOrig,codDest) {
            
            var codOrig = document.forms["TablaEquivalenciaForm"]["codigoInstitucionOrigen"].value;
            var codDest = document.forms["TablaEquivalenciaForm"]["codigoInstitucionDestino"].value;
            
            if (codDest == codOrig) {
                alert("Las instituciones no deben ser iguales");
                return false;
            }
            return true;
        }
           
            
            
        <%-- Funcion que pregunta si de verdad se desea abandonar la sesion --%>
            function confirmarExit(){
                var confirmarE = confirm("Desea abandonar la Sesion?");
                return confirmarE;       
            }
        </script>
        
        
        <%ArrayList<InstitucionForm> listaInst = 
            ((ArrayList<InstitucionForm>) 
            request.getAttribute("ListaInstitucion")); %>
                        
            <html:form action="/gestionTablaEquivalencia" method="POST">
            
                
                <table>
                    
                    <% if (!listaInst.isEmpty()) { %>
                    
                    <th> Seleccione la institución de Origen </th>
                    <th> Seleccione la institución de Destino </th>
                    <th>  </th>
                    <tr>
                    
                    <td>
                        
                        <html:select styleClass="button" property="codigoInstitucionOrigen" >

                        <%for (int i=0; i<listaInst.size();i++) { 
                            String codOrig=listaInst.get(i).getCodigoInstitucion();
                            String nombOrig=listaInst.get(i).getNombreInstitucion();%>
                            <%-- Creamos la lista desplegable con las instituciones --%>
                            <html:option value="<%=codOrig%>"><%=nombOrig%></html:option>
                            
                            <%}%>


                        </html:select>
                    </td>
                        
                    <td>
                        
                        
                        
                        <html:select styleClass="button" property="codigoInstitucionDestino" >

                        <%for (int i=0; i<listaInst.size();i++) { 
                            String codDest=listaInst.get(i).getCodigoInstitucion();
                            String nombDest=listaInst.get(i).getNombreInstitucion();%>
                            <%-- Creamos la lista desplegable con las instituciones --%>
                            <html:option value="<%=codDest%>"><%=nombDest%></html:option>
                            
                            <%}%>


                        </html:select>
                        
                    </td><td>
                            
                    <html:hidden property="operacionTabla" value="Listar_Tablas" />
                                        
                    <html:submit 
                        styleClass   =   "button"
                        onclick      =   "return verificarInstitucionesDifentes()"
                        property     =   "submit"
                        value        =   "Mostrar Tablas de Equivalencia"/>

                    </td></tr></table>
                    <% } else { %>
                    
                        <li><p>No hay instituciones registradas. Por favor, diríjase a la
                               sección de gestión de instituciones para añadirlas. </p></li>
                    
                    <%}%>
                
            
                
            </html:form>
            
            
            <li><h2>Volver:</h2></li>
            
            
            <%-- Link para abandonar al sistema. --%>
            <html:link onclick="return confirmarExit()" forward="login">Salir</html:link>
           
    
    </body>
</html>
