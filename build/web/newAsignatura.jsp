<%-- 
    Document   : newAsignatura
    Created on : Jun 29, 2013, 10:18:34 AM
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
        <title>SEA - Registrar Asignatura</title>
    </head>
    <body>
        
        <script type="text/javascript">
        <!--

        <%-- Función para verificar que los campos estén llenos --%>
        function validarCampos() {
            var codigoAsig = document.forms["AsignaturaForm"]["codigoAsignatura"].value;
            var nombreAsig = document.forms["AsignaturaForm"]["nombreAsignatura"].value;
            var creditos   = document.forms["AsignaturaForm"]["creditos"].value;

            if (codigoAsig == null || codigoAsig == "") {
                alert("Por favor inserte el código de la asignatura");
                return false;
            } else if (nombreAsig == null || nombreAsig == "") {
                alert("Por favor inserte el nombre de la asignatura");
                return false;
            } else if (creditos == null || creditos == "") {
                alert("Por favor inserte el número de créditos");
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

            <%-- Obtener el código de la institución --%>
            <% InstitucionForm cf = ((InstitucionForm) 
                request.getAttribute("InstitucionForm")) ;
                String codigoInst = cf.getCodigoInstitucion();
                String nombreInst = cf.getNombreInstitucion();%>
            
            <h1>Registro de Asignaturas</h1>

            

            <html:form action="/gestionAsignatura" method="POST"
                       onsubmit = "return validarCampos()">
            
            <html:hidden 
                        property   = "codigoInstitucion" 
                        value      = "<%=codigoInst%>"/>
                        
            <html:hidden 
                        property   = "nombreInstitucion" 
                        value      = "<%=nombreInst%>"/>

            
            <table>
                    <tr>
                        <%-- Campo para el código de la carrera --%>
                        <td>Código Asignatura:</td>
                        
                        <td>
                            <html:text 
                                styleClass  =  "input" 
                                maxlength   =  "12" 
                                styleId     =  "CodAsignatura"
                                property    =  "codigoAsignatura"
                                value       =  ""/>
                            
                        </td>
                    </tr>
                    <tr>
                        <%-- Campo para el nombre de la carrera --%>
                        <td>Nombre Asignatura:</td>
                        
                        <td>
                            <html:text 
                                styleClass  =  "input" 
                                maxlength   =  "80" 
                                styleId     =  "NombAsignatura" 
                                property    =  "nombreAsignatura"
                                value       =  ""/>
                        </td>
                        
                    </tr>
                    <tr>

                        <%-- Campo para el código de la institución --%>
                        <td>Número de Créditos:</td>
                        
                        <td>
                            <html:text 
                                styleClass  =  "input" 
                                maxlength   =  "2" 
                                property    =  "creditos" 
                                value       =  ""/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br/>
                            <center>
                                <%-- Botón para agregar la carrera --%>
                                <html:submit 
                                    styleClass = "button" 
                                    property   = "operacionAsignatura"
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
                <center>
            
                    

                </center>
                
            </html:form>
                
            <html:form action="/gestionInstitucion" method="POST">
                <center>
                <li><h2>Volver: </h2></li>
                <html:hidden 
                        property   = "codigoInstitucion" 
                        value      = "<%=codigoInst%>"/>
                
                <html:hidden 
                        property   = "nombreInstitucion" 
                        value      = "<%=nombreInst%>"/>        
               
                <%-- Botón para volver a detalles de la institución --%>
                    <html:submit 
                        styleClass = "button" 
                        property   = "operacionInstitucion"
                        onclick    =  "return confirmarAccion()"
                        value      = "Detalle_Institucion"/>
                    
                <%-- Botón para volver a detalles de la institución --%>
                    <html:submit 
                        styleClass = "button" 
                        property   = "operacionInstitucion"
                        onclick    =  "return confirmarAccion()"
                        value      = "Listar_Asignaturas"/>
                </center>
            </html:form>
                
    </body>
</html>
