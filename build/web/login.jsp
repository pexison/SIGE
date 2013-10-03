<%-- 
    Document   : login
    Created on : May 27, 2013, 9:11:14 PM
    Author     : fertaku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<!DOCTYPE html>
<html:html>
    <head>
   
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
        <title>Login</title>
    </head>
    <body>
        <center>
            <h1>SEA - Sistema de Equivalencias Automatizado</h1>
            <html:form action="/validar" method="POST">
                <table>
                    <tr>
                        <%-- Campo para ingresar el id del usuario --%>
                        <td>Usuario:</td>
                        <td><html:text 
                            styleClass  =  "input" 
                            property    =  "usuario"/></td>
                    </tr>
                    <tr>
                        <%-- Campo para ingresar la clave del usuario --%>
                        <td>Clave:</td>
                        <td><html:password 
                            styleClass  =  "input" 
                            property    =  "clave"/></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br/>
                    <center>

                            <%-- Botón para validar los datos ingresados --%>
                            <html:submit
                                styleClass   =   "button"
                                property     =   "operacionValidar" 
                                value        =   "Validar"/>

                            <%--&nbsp; &nbsp;--%>

                            <%-- Botón para limpiar los campos --%>
                            <html:reset 
                                styleClass   =   "button"
                                value        =   "Limpiar"/> 
                    </center>
                        </td>
                    </tr>
                </table>
            </html:form>
            <br/>
            <%-- Enlace para registrar un usuario --%>
            <html:link forward="pararegistro">Registrese</html:link>

        </center>
    </body>
</html:html>
