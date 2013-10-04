<%-- 
    Document   : registro
    Created on : May 27, 2013, 9:29:03 PM
    Author     : fertaku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@page import="java.util.* , frijoles.*, modelo.*" %>
<!DOCTYPE html>
<html:html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>SIGE - Registrar usuario</title>
    </head>
    <body>
        
        <script type="text/javascript">
        <!--

        <%-- Función que se utiliza para verificar que los campos estén llenos --%>
        function validarCampos() {
            var nombreUsr   = document.forms["RegistroForm"]["nombre"].value;
            var apellidoUsr = document.forms["RegistroForm"]["apellido"].value;
            var usuarioUsr  = document.forms["RegistroForm"]["usuario"].value;
            var claveUsr    = document.forms["RegistroForm"]["clave"].value;
            var emailUsr    = document.forms["RegistroForm"]["email"].value;

            if (nombreUsr == null || nombreUsr == "") {
                alert("Por favor inserte su nombre");
                return false;
            } else if (apellidoUsr == null || apellidoUsr == "") {
                alert("Por favor inserte su apellido");
                return false;
            } else if (usuarioUsr == null || usuarioUsr == "") {
                alert("Por favor inserte su nombre de usuario");
                return false;
            } else if (claveUsr == null || claveUsr == "") {
                alert("Por favor inserte clave");
                return false;
            } else if (emailUsr == null || emailUsr == "") {
                alert("Por favor inserte su correo electronico");
                return false;
            }
            return true;
        }
        
        <%-- Función para confirmar que se desea modificar la institución --%>
        function confirmarAccion(){
            var confirmarM = confirm("¿Desea continuar?");
            return confirmarM;       
        }
        
       // -->
        </script>
        
        
         <%-- Obtener la lista de tipos de usuario --%>
        <%GestionClientes gc = new GestionClientes();
                ArrayList<String> listaTipoUsuario = gc.mostrarTipoUsuario();%>
        
        <center>
            <h1>Registro de usuarios</h1>
            <html:form action="/registrar" onsubmit="return validarCampos()" method="POST">
                <table>
                    <tr>
                        <%-- Campo para el nombre del usuario --%>
                        <td>Nombre:</td>
                        <td><html:text 
                            styleClass  =  "input"
                            maxlength   =  "80"
                            property    =  "nombre"/></td>
                    </tr>
                    <tr>
                        <%-- Campo para el apellido del usuario --%>
                        <td>Apellido:</td>
                        <td><html:text 
                            styleClass  =  "input" 
                            maxlength   =  "80" 
                            property    =  "apellido"/></td>
                    </tr>
                    <tr>
                        <%-- Campo para el ID del usuario --%>
                        <td>Usuario:</td>
                        <td><html:text 
                            styleClass  =  "input" 
                            maxlength   =  "14" 
                            property    =  "usuario"/></td>
                    </tr>
                    <tr>
                        <%-- Campo para la clave del usuario --%>
                        <td>Clave:</td>
                        <td><html:password
                            styleClass  =  "input"
                            maxlength   =  "14"
                            property    =  "clave"/></td>
                    </tr>
                    <tr>
                        <%-- Campo para el e-mail del usuario --%>
                        <td>Email:</td>
                        <td><html:text 
                            styleClass  =  "input"
                            maxlength   =  "50"
                            property    =  "email"/></td>
                    </tr>
                    <tr>
                        <%-- Lista para el tipo de usuario --%>
                        <td>Tipo de Usuario:</td>
                        <td><html:select styleClass="button" property="tipoUsuario"> 
                                
                           <% for (int i=0; i<listaTipoUsuario.size();i++) { 
                            String tipoUsuario = listaTipoUsuario.get(i);%>
                            <html:option value="<%=tipoUsuario%>">
                                <%=tipoUsuario%>
                            </html:option>
                    
                             <%}%>
                        </html:select></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br/>

                            <%-- Botón para registrar el usuario --%>
                            <html:submit 
                                styleClass  =  "button"
                                property    =  "submit"
                                onclick     =  "return confirmarAccion()"
                                value       =  "Registrar"/>

                            &nbsp; &nbsp;
 
                            <%-- Botón para limpiar los campos --%>
                            <html:reset 
                                styleClass  =  "button"
                                value       =  "Limpiar"/> 
                        </td>
                    </tr>
                </table>
            </html:form>
            <%-- Enlace para ir a la página principal --%>
            <html:link onclick="return confirmarAccion()" 
                       forward="login">Home</html:link>
        </center>
    </body>
</html:html>
