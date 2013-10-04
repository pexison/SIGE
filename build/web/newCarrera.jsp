<%-- 
    Document   : newCarrera
    Created on : May 28, 2013, 9:44:07 PM
    Author     : fertaku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@page import="java.util.* , frijoles.*" %>
<!DOCTYPE html>

<html:html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>SIGE - Registrar Carrera</title>
    </head>
    <body>
        
        <script type="text/javascript">
        <!--

        <%-- Función para verificar que los campos estén llenos --%>
        function validarCampos() {
            var codigoCarr = document.forms["CarreraForm"]["codigoCarrera"].value;
            var nombreCarr = document.forms["CarreraForm"]["nombreCarrera"].value;

            if (codigoCarr == null || codigoCarr == "") {
                alert("Por favor inserte el código de la carrera");
                return false;
            } else if (nombreCarr == null || nombreCarr == "") {
                alert("Por favor inserte el nombre de la carrera");
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
        
        <center>

            <h1>Registro de Carreras</h1>

            <%-- Obtener el código de la institución --%>
            <% CarreraForm cf = ((CarreraForm) 
                request.getAttribute("CarreraForm")) ;
                String codigoInst = cf.getCodigoInstitucion();%>

            <html:form 
                onsubmit = "return validarCampos()"
                action   = "/gestionCarrera" 
                method   = "POST">
                
                <table>
                    <tr>
                        <%-- Campo para el código de la carrera --%>
                        <td>Código Carrera:</td>
                        
                        <td>
                            <html:text 
                                styleClass  =  "input" 
                                maxlength   =  "12" 
                                styleId     =  "CodCarrera"
                                property    =  "codigoCarrera"/>
                        </td>
                    </tr>
                    <tr>
                        <%-- Campo para el nombre de la carrera --%>
                        <td>Nombre Carrera:</td>
                        
                        <td>
                            <html:text 
                                styleClass  =  "input" 
                                maxlength   =  "50" 
                                styleId     =  "NombCarrera" 
                                property    =  "nombreCarrera"/>
                        </td>
                        
                    </tr>
                    <tr>

                        <%-- Campo para el código de la institución --%>
                        <td>Código Institución:</td>
                        
                        <td>
                            <html:text 
                                styleClass  =  "input" 
                                maxlength   =  "12" 
                                readonly    =  "TRUE"
                                property    =  "codigoInstitucion" 
                                value       =  "<%=codigoInst%>"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br/>
                            <center>

                                <%-- Botón para agregar la carrera --%>
                                <html:submit 
                                    styleClass = "button" 
                                    property   = "operacionCarrera"
                                    onclick    =  "return confirmarAccion()"
                                    value      = "Agregar"/>

                                &nbsp; &nbsp;

                                <%-- Botón para limpiar los campos --%>
                                <html:reset 
                                    styleClass = "button" 
                                    value      = "Limpiar"/>
                            
                            </center>
                        </td>
                    </tr>
                </table>
            
            </html:form>
                
                 
            <html:form action="/gestionInstitucion" method="POST">
                
                <center>
            
                    <li><h2>Volver: </h2></li>

                    <html:hidden 
                        property   = "codigoInstitucion" 
                        value      = "<%=codigoInst%>"/>

                    <%-- Botón para volver a detalles de la institución --%>
                    <html:submit 
                        styleClass = "button" 
                        property   = "operacionInstitucion"
                        onclick    =  "return confirmarAccion()"
                        value      = "Detalle_Institucion"/>

                    <%-- Botón para volver a listar carreras--%>
                    <html:submit 
                        styleClass = "button" 
                        property   = "operacionInstitucion"
                        onclick    =  "return confirmarAccion()"
                        value      = "Listar_Carreras"/>
                    
                </center>
                    
            </html:form>
        </center>
    </body>
</html:html>
