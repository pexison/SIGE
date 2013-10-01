<%-- 
    Document   : newInstitucion
    Created on : May 27, 2013, 10:53:39 PM
    Author     : fertaku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@page import="java.util.* , modelo.* , frijoles.*" %>

<!DOCTYPE html>
<html:html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   
        <title>Registrar Institución</title>
    </head>
    <body>
        
        <script type="text/javascript">
        <!--

        <%-- Función para confirmar que todos los campos fueron llenados --%>
        function validarCampos() {
            var codigoInst    = document.forms["InstitucionForm"]["codigoInstitucion"].value;
            var nombreInst    = document.forms["InstitucionForm"]["nombreInstitucion"].value;
            var direccionInst = document.forms["InstitucionForm"]["direccionInstitucion"].value;
            var paisInst      = document.forms["InstitucionForm"]["paisInstitucion"].value;
            
            if (nombreInst == null || nombreInst == "") {
                alert("Por favor inserte el nombre de la Institucion");
                return false;
            } else if (codigoInst == null  || codigoInst == '') {
              aleter("POr favor inserte el codigo de la Institucion");
              return false;    
            } else if (direccionInst == null || direccionInst == "") {
                alert("Por favor inserte la direccion de la Institucion");
                return false;
            } else if (paisInst == null || paisInst == "") {
                alert("Por favor inserte el pais de la Institucion");
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
            <h1>Registro de Instituciones</h1>
            <html:form action="/gestionInstitucion" onsubmit="return validarCampos()" method="POST">
                <% InstitucionForm instForm = 
                (InstitucionForm) request.getAttribute("InstitucionForm");
                instForm.resetInstitucion();
                
                //Obtener la lista de paises--
                GestionInstitucion gc = new GestionInstitucion();
                ArrayList<String> listaPaises = gc.mostrarPaises();%>
                <table>
                    <tr>
                        <%-- Campo para el código de la institución --%>
                        <td>Código Institución:</td>
                        <td><html:text 
                            styleClass  =  "input" 
                            maxlength   =  "12" 
                            property    =  "codigoInstitucion"/></td>

                    </tr>
                    <tr>
                        <%-- Campo para el nombre de la institución --%>
                        <td>Nombre Institucion:</td>
                        <td><html:text 
                            styleClass  =  "input" 
                            maxlength   =  "100"
                            property    =  "nombreInstitucion"/></td>
                    </tr>
                    <tr>
                        <%-- Campo para la dirección de la institución --%>
                        <td>Direccion Institucion:</td>
                        <td><html:text 
                            styleClass  =  "input" 
                            maxlength   =  "100" 
                            property    =  "direccionInstitucion"/></td>
                    </tr>
                    <tr>
                        <%-- Lista desplegable para el país de la institución --%>
                        <td>País Institución:</td>
                         
                        <td><html:select styleClass="button" property="paisInstitucion"> 
                                
                           <% for (int i=0; i<listaPaises.size();i++) { 
                            String Pais = listaPaises.get(i);%>
                            <html:option value="<%=Pais%>">
                                <%=Pais%>
                            </html:option>
                             <%}%>
                        </html:select></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br/>
                            <%-- Botón para agregar la nueva institución --%>
                            <html:submit 
                                styleClass  =  "button" 
                                property    =  "operacionInstitucion"
                                onclick     =  "return confirmarAccion()"
                                value       =  "Agregar"/>
                            &nbsp; &nbsp;
                            <%-- Botón para limpiar los campos --%>
                            <html:reset 
                                styleClass  =  "button" 
                                value       =  "Limpiar"/>
                        </td>
                    </tr>
                </table>
            </html:form>
            <html:form action="/gestionInstitucion" method="POST">
                <%-- Botón para listar las instituciones --%>
                <html:submit 
                    styleClass  =  "button" 
                    property    =  "operacionInstitucion"
                    onclick     =  "return confirmarAccion()"
                    value       =  "Listar_Instituciones"/>
            </html:form>
        </center>
    </body>
</html:html>
