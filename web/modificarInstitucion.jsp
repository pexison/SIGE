<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@page import="java.util.* , modelo.* , frijoles.*" %>

<!DOCTYPE html>
<html:html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
        <title>SEA - Modificar Institución</title>
    </head>
     <body>
         
         <script type="text/javascript">
         <!--
         
         <%-- Función para verificar que los campos estén llenos --%>
         function validarCampos() {
            var nombreInst    = document.forms["InstitucionForm"]["nombreInstitucion"].value;
            var direccionInst = document.forms["InstitucionForm"]["direccionInstitucion"].value;
            var paisInst      = document.forms["InstitucionForm"]["paisInstitucion"].value;
            
            if (nombreInst == null || nombreInst == ''){
                alert("Por favor inserte el código de la Institución");
                return false;
            }else if (direccionInst == null || direccionInst == "") {
                alert("Por favor inserte la dirección de la Institución");
                return false;
            } else if (paisInst == null || paisInst == "") {
                alert("Por favor inserte el país de la Institución");
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
        
        <%-- Obtener el nombre de la institución --%>
        <% InstitucionForm instForm = 
        (InstitucionForm) request.getAttribute("InstitucionForm");
        String codigoInst = instForm.getCodigoInstitucion();
        //Obtener la lista de paises--
        GestionInstitucion gc = new GestionInstitucion();
        ArrayList<String> listaPaises = gc.mostrarPaises();
        %>
        
        <center> 
            <h1>Modificar Institución</h1>
            
             <html:form 
                 action="/gestionInstitucion" 
                 onsubmit="return validarCampos()" 
                 method="POST">
                
                
                <table>
                    <tr>
                        <%-- Campo para el código de la institución --%>
                        <td>Codigo Institución:</td>
                        <td>
                            <html:text 
                                styleClass  =  "input" 
                                readonly    =  "TRUE" 
                                property    =  "codigoInstitucion"/>
                        </td>
                    </tr>
                    <tr>
                        <%-- Campo para el nombre de la institución --%>
                        <td>Nombre Institución:</td>
                        <td>
                            <html:text 
                                styleClass  =  "input" 
                                maxlength   =  "100" 
                                property    =  "nombreInstitucion"/>
                        </td>
                    </tr>
                    <tr>
                        <%-- Campo para la dirección de la institución --%>
                        <td>Dirección Institución:</td>
                        <td>
                            <html:text 
                                styleClass  =  "input" 
                                maxlength   =  "100"
                                property    =  "direccionInstitucion"/>
                        </td>
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
                            <center>

                            <%-- Botón para modificar la institución --%>
                            <html:submit 
                                styleClass  =  "button" 
                                onclick     =  "return confirmarAccion()" 
                                property    =  "operacionInstitucion" 
                                value       =  "Modificar"/>
                            
                            &nbsp; &nbsp;
                            
                            <%-- Botón para limpiar los campos --%>
                            <html:reset 
                                styleClass  =  "button" 
                                value       =  "Limpiar"/>
                            </center>
                        </td>
                    </tr>
                </table>
                            
                </br></br>
                
                
                
        </html:form>

        <html:form action="/gestionInstitucion" method="POST">
        
             <li><h2>Volver: </h2></li> 

             <html:hidden property="codigoInstitucion" value="<%=codigoInst%>"/>
             
             <%-- Botón para volver a listar las instituciones --%>
             <html:submit 
                 styleClass  =  "button" 
                 property    =  "operacionInstitucion"
                 onclick     =  "return confirmarAccion()"
                 value       =  "Listar_Instituciones"/>

             <%-- Botón para volver a los detalles de la institución --%>
             <html:submit 
                 styleClass  = "button" 
                 property    = "operacionInstitucion"
                 onclick     = "return confirmarAccion()"
                 value       = "Detalle_Institucion"/>
             
        </html:form>
        </center>
    </body>
</html:html>
