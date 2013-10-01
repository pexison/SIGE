<%-- 
    Document   : modificarAsignatura
    Created on : Jun 29, 2013, 5:03:24 PM
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
        <title>SEA - Modificar Asignatura</title>
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
        
        
        <%-- Función que confirma la modificación de la carrera --%>
        function confirmarAccion(){
            var confirmarE = confirm("Desea continuar?");
            return confirmarE;       
        }
        // -->
        </script>
        
        <center> 
            
            <h1>Modificación de Asignaturas</h1>

            
            <%-- Obtener el código de la institución y de la carrera --%>            
            <% AsignaturaForm af = ((AsignaturaForm) 
                request.getAttribute("AsignaturaForm")) ;
                String codigoInst = af.getCodigoInstitucion();
                String codigoAsig = af.getCodigoAsignatura();
                String nombreAsig = af.getNombreAsignatura();
                Integer creditos = af.getCreditos();
                String strCreditos = creditos.toString();%>
                
            <html:form action="/gestionAsignatura" method="POST"
                       onsubmit = "return validarCampos()">
            
               <table>
                   
                    <tr>
                        <td>Código Asignatura:</td>
                        <td>
                            <%-- Campo para el nombre de la carrera --%>
                            <html:text 
                                styleClass = "input"
                                readonly   = "TRUE"
                                maxlength  = "12" 
                                property   = "codigoAsignatura"
                                value      = "<%=codigoAsig%>"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Nombre Asignatura:</td>
                        <td>
                            <%-- Campo para el nombre de la carrera --%>
                            <html:text 
                                styleClass = "input" 
                                maxlength  = "80" 
                                property   = "nombreAsignatura"
                                value      = "<%=nombreAsig%>"/>
                        </td>
                    </tr>
                    <tr>

                        <td>Créditos:</td>
                        <td>
                            <%-- Campo para el código de la institución
                                 que oferta la carrera --%>                            
                            <html:text 
                                styleClass = "input" 
                                property   = "creditos" 
                                value      = "<%=strCreditos%>"/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br/>
                                         
                            <html:hidden property="codigoInstitucion"
                                         value="<%=codigoInst%>"/>
                            
                            <%-- Botón para confirmar la modificación --%>
                            <html:submit 
                                styleClass = "button" 
                                property   = "operacionAsignatura"
                                onclick    = "return confirmarAccion()"
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
                
                <li><h2>Volver: </h2></li>
                <html:hidden 
                        property   = "codigoInstitucion" 
                        value      = "<%=codigoInst%>"/>
                    
               
                <%-- Botón para volver a detalles de la institución --%>
                    <html:submit 
                        styleClass = "button" 
                        property   = "operacionInstitucion"
                        onclick    = "return confirmarAccion()"
                        value      = "Detalle_Institucion"/>
                    
                <%-- Botón para volver a detalles de la institución --%>
                    <html:submit 
                        styleClass = "button" 
                        property   = "operacionInstitucion"
                        onclick    = "return confirmarAccion()"
                        value      = "Listar_Asignaturas"/>
                
            </html:form>
        </center>
    </body>
</html>
