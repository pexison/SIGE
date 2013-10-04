<%-- 
    Document   : listarInstitucion
    Created on : May 28, 2013, 5:15:42 PM
    Author     : acs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<%@page import="java.util.* , frijoles.*" %>

<!DOCTYPE html>

<html>
    <head>
        
        <link rel="stylesheet" type="text/css" href="style.css">
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>SIGE - Gestión de Instituciones</title>
        
    </head>
     <body>
        
        <%-- Script auxiliar para las diversas confirmaciones --%>
        <script type="text/javascript">

            <%-- Funcion que pregunta si de verdad se desea eliminar una institucion --%>

            function confirmarEliminar(){
                var confirmarE = confirm("Desea eliminar la Institucion?");
                return confirmarE;       
            }

            <%-- Funcion que pregunta si de verdad se desea abandonar la sesion --%>
            function confirmarExit(){
                var confirmarE = confirm("Desea abandonar la Sesion?");
                return confirmarE;       
            }
            
            function setCodigoInstitucion() {
                var listaInst = document.getElementById("listaInst");
                var codigoInst = listaInst.options[listaInst.selectedIndex].value;
                return codigoInst
            }
        
        </script>
        
    <center>
        <ul>
        <h1>Gestión de Instituciones</h1>
    </center>
    
        <ul>
        <li><h2>Instituciones disponibles:</h2></li>
        <%-- Obtenemos la lista de instituciones --%>
        
        <%-- Lista de instituciones disponibles en la base de datos --%>
        <html:form action="/gestionInstitucion" method="POST">
            
            <%ArrayList<InstitucionForm> listaInst = 
            ((ArrayList<InstitucionForm>) 
            request.getAttribute("ListaInstitucion")); %>
            
            <% if (!listaInst.isEmpty()) { %>
            <html:select styleClass="button" property="codigoInstitucion" >

                <%for (int i=0; i<listaInst.size();i++) { 
                    String nombreInst=listaInst.get(i).getNombreInstitucion();
                    String codigoInst=listaInst.get(i).getCodigoInstitucion();%>
                    <%-- Creamos la lista desplegable con las instituciones --%>
                    <html:option value="<%=codigoInst%>"><%=nombreInst%></html:option>
                <%}%>
            </html:select>
            
            <%-- Boton para ver los detalles de la institucion seleccionada --%>            
            <html:submit 
                styleClass = "button" 
                property   = "operacionInstitucion"
                value      = "Detalle_Institucion">
            </html:submit>
            
            <% } else { %>
                <li> No hay instituciones disponibles. </li>
            <%}%>
                    
        <%-- Boton para ir al formulario de creacion de institucion --%>            
            <html:submit 
                styleClass = "button" 
                property   = "operacionInstitucion" 
                value      = "Crear_Institucion">
            </html:submit>

            <br/><br/>

            
        </html:form>
            
        
        <li><h2>Volver:</h2></li>
        
        <html:form action="/validar" method="POST">
            <html:hidden property="operacionValidar" value="retornar" />
            <html:submit
                styleClass   =   "button"
                property     =   "submit" 
                value        =   "Atrás"/>                

        </html:form>
        
        <%-- Link para abandonar al sistema. --%>
        <html:link onclick="return confirmarExit()" forward="login">Salir</html:link>
        
        </ul>
    </body>
</html>
