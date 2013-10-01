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
        <title>SEA - Modificar Carrera</title>
    </head>
    
    <body>
         <script type="text/javascript">
        <!--

        <%-- Función que verifica que los campos estén llenos --%>
        function validarCampos() {
            var nombreCarr = document.forms["CarreraForm"]["nombreCarrera"].value;
            var codigoCarr = document.forms["CarreraForm"]["codigoCarrera"].value;
            
            if (nombreCarr == null || nombreCarr == "") {
                alert("Por favor inserte el nombre de la carrera");
                return false;
            } else if (codigoCarr == null || codigoCarr == "") {
                alert("No hay carreras disponibles");
                return false;
            }

            return true;
        }
        
        <%-- Función que confirma la modificación de la carrera --%>
        function confirmarAccion(){
            var confirmarE = confirm("Desea continuar?");
            return confirmarE;       
        }
        // -->
        </script>
        
        <center> 
            
            <h1>Modificación de Carreras</h1>

            
            <%-- Obtener el código de la institución y de la carrera --%>            
            <% CarreraForm cf = ((CarreraForm) 
                request.getAttribute("CarreraForm")) ;
                String codigoInst = cf.getCodigoInstitucion();
                String nombreCarr = cf.getNombreCarrera();%>
            
            <html:form 
                action="/gestionCarrera" 
                onsubmit="return validarCampos()" 
                method="POST">
                
                <table>
                    <tr>
                        <td>Código Carrera:</td>
                        <td>
                            <%-- Campo para el código de la carrera --%>
                            <html:text 
                                styleClass = "input" 
                                readonly   = "TRUE"
                                property   = "codigoCarrera"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Nombre Carrera:</td>
                        <td>
                            <%-- Campo para el nombre de la carrera --%>
                            <html:text 
                                styleClass = "input" 
                                maxlength  = "50" 
                                property   = "nombreCarrera"
                                value      = "<%=nombreCarr%>"/>
                        </td>
                    </tr>
                    <tr>

                        <td>Código Institución:</td>
                        <td>
                            <%-- Campo para el código de la institución
                                 que oferta la carrera --%>                            
                            <html:text 
                                styleClass = "input" 
                                readonly   = "TRUE"
                                property   = "codigoInstitucion" 
                                value      = "<%=codigoInst%>"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br/>
                            
                            <%-- Botón para confirmar la modificación --%>
                            <html:submit 
                                styleClass = "button" 
                                onclick    = "return confirmarAccion()" 
                                property   = "operacionCarrera" 
                                value      = "Modificar"/>
                            
                            &nbsp; &nbsp;
                            
                            <%-- Botón para limpiar los campos --%>
                            <html:reset 
                                styleClass = "button" 
                                value      = "Limpiar"/> 
                        </td>
                    </tr>
                </table>
            </html:form>
            
            <html:form action="/gestionInstitucion" method="POST">
                <center>
                <li><h2>Volver: </h2></li>
                <html:hidden 
                    property = "codigoInstitucion" 
                    value    = "<%=codigoInst%>"/>
                    
                <%-- Botón para regresar a listar las instituciones --%>
                <html:submit 
                    styleClass = "button" 
                    property   = "operacionInstitucion"
                    onclick    = "return confirmarAccion()"
                    value      = "Listar_Instituciones"/>
                
                <%-- Botón para regresar a listar las carreras --%>
                <html:submit 
                    styleClass = "button" 
                    property   = "operacionInstitucion"
                    onclick    = "return confirmarAccion()"
                    value      = "Listar_Carreras"/>
                </center>
            </html:form>
                
           
        </center>
    </body>
</html:html>
