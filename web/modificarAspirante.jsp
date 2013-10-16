<%-- 
    Document   : modificarAspirante
    Created on : Oct 16, 2013, 1:50:13 PM
    Author     : fertaku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>


<%@page import="java.util.* , frijoles.*, modelo.*" %>
<!DOCTYPE html>


<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>SIGE - Registrar Equivalencia</title>
        
        <script type="text/javascript">
            <%-- Función para confirmar que todos los campos fueron llenados --%>
             function validarCampos() {
                 var cedulaAsp    = document.forms["AspiranteForm"]["cedula"].value;
                 var sexoAsp      = document.forms["AspiranteForm"]["sexo"].value;
                 var edadAsp      = document.forms["AspiranteForm"]["edad"].value;
                 var paisAsp      = document.forms["AspiranteForm"]["pais"].value;
                 var edo_civilAsp = document.forms["AspiranteForm"]["edo_civil"].value;
                 var lugar_nacimientoAsp =  document.forms["AspiranteForm"]["lugar_nacimiento"].value;
                 var nacionalidadAsp =  document.forms["AspiranteForm"]["nacionalidad"].value;

                 cedulaAsp = cedulaAsp.replace(/\s+/g, '');

                 if (cedulaAsp == null || cedulaAsp == "") {
                     alert("Por favor inserte su Cedula");
                     return false;
                 } else if (sexoAsp == null || sexoAsp == ""){
                    alert("Por favor inserte su sexo") 
                    return false; 
                 } else if (edadAsp == null || edadAsp == ""){
                    alert("Por favor inserte su edad") 
                    return false; 
                 } else if (paisAsp == null || paisAsp == ""){
                    alert("Por favor inserte su pais") 
                    return false; 
                 } else if (edo_civilAsp == null || edo_civilAsp == ""){
                    alert("Por favor inserte su estado civil") 
                    return false; 
                 } else if (lugar_nacimientoAsp == null || lugar_nacimientoAsp == ""){
                    alert("Por favor inserte su lugar de nacimiento") 
                    return false; 
                 }  else if (nacionalidadAsp == null || nacionalidadAsp == ""){
                    alert("Por favor inserte su nacionalidad") 
                    return false;
                 }

                 return true;
             } 

            <%-- Función para confirmar si se desea salir --%>
            function confirmarExit(){
                var confirmarE = confirm("¿Desea abandonar la Sesión?");
                return confirmarE;       
            }
            // -->
         </script>
        
    </head>
    
    <body>
        
        <script type="text/javascript">
        <!--

        
        <%-- Función para confirmar que se desea abandonar la pagina --%>
        function confirmarVolver(){
            var confirmarM = confirm("¿Abandonar esta página?");
            return confirmarM;       
        }

        <%-- Función para confirmar que se desea modificar la equivalencia --%>
        function confirmarAccion(){
            var confirmarM = confirm("¿Desea continuar?");
            return confirmarM;       
        }
        
        // -->
        </script>
        
        
        <center>

            <h1>Modificación de Datos de Aspirante</h1>
            
       <%AspiranteForm af = 
                (AspiranteForm) request.getAttribute("AspiranteForm");
        
          String id_usuario = af.getId_usuario();
          String cedula = af.getCedula();
          String sexo = af.getSexo();
          int edad = af.getEdad();
          String estado_civil = af.getEdo_civil(); 
          String pais = af.getPais();
          String lugar_nacimiento = af.getLugar_nacimiento();
          String nacionalidad = af.getNacionalidad();
        %>
        
        <html:form action="/gestionAspirante" onsubmit="return validarCampos()" method="POST">
            <%//Obtener la lista de paises--
              GestionAspirante gc = new GestionAspirante();
              ArrayList<String> listaPaises = gc.mostrarPaises();%>
               <table>
                    <td>ID de Usuario:</td>
                        
                        <td>
                            <html:text 
                                styleClass  =  "input" 
                                maxlength   =  "12" 
                                readonly    =  "TRUE"
                                property    =  "id_usuario" 
                                value       =  "<%=id_usuario%>"/>
                        </td>
                    <tr>
                        <%-- Campo para la cedula de identidad --%>
                        <td>Cedula de Identidad:</td>
                        <td><html:text 
                            styleClass  =  "input" 
                            maxlength   =  "12"
                            readonly    =  "TRUE"
                            property    =  "cedula"
                            value       =  "<%=cedula%>"/></td>
                    </tr>
                    <tr>
                        <%-- Lista desplegable para el sexo permitido--%>
                        <td>Sexo:</td>
                         
                        <td><html:select styleClass="button" property="sexo"> 
                            <html:option value="Masculino">Masculino</html:option>
                            <html:option value="Femenino">Femenino</html:option>
                        </html:select></td>
                    </tr>
                    <tr>
                        <%-- Campo para la cedula de identidad --%>
                        <td>Edad:</td>
                        <td><html:text 
                            styleClass  =  "input" 
                            maxlength   =  "3"
                            property    =  "edad"
                            value       =  "<%=edad+""%>"/></td>
                    </tr>
                    <tr>
                        <%-- Lista desplegable para el país de residencia --%>
                        <td>País de Residencia:</td>
                         
                        <td><html:select styleClass="button" property="pais"> 
                                
                           <% for (int i=0; i<listaPaises.size();i++) { 
                            String Pais = listaPaises.get(i);%>
                            <html:option value="<%=Pais%>">
                                <%=Pais%>
                            </html:option>
                             <%}%>
                        </html:select></td>
                    </tr>
                    <tr>
                        <%-- Lista desplegable para el país de la institución --%>
                        <td>Estado civil:</td>
                        <td><html:select styleClass="button" property="edo_civil"> 
                            <html:option value="Soltero">Soltero</html:option>
                            <html:option value="Casado">Casado</html:option>
                            <html:option value="Viudo">Viudo</html:option>
                        </html:select></td>
                    </tr>
                     <tr>
                        <%-- Lista desplegable para el país de la institución --%>
                        <td>Lugar de Nacimiento:</td>
                        <td><html:text 
                            styleClass  =  "input" 
                            maxlength   =  "100"
                            property    =  "lugar_nacimiento"
                            value       =  "<%=lugar_nacimiento%>"/></td>
                    </tr>
                      <tr>
                        <%-- Campo para la dirección de la institución --%>
                        <td>Nacionalidad:</td>
                        <td><html:text 
                            styleClass  =  "input" 
                            maxlength   =  "30" 
                            property    =  "nacionalidad"
                            value       =  "<%=nacionalidad%>"/></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br/>
                            <%-- Botón para agregar la informacion del aspirante --%>
                            <html:submit 
                                styleClass  =  "button" 
                                property    =  "operacionAspirante"
                                onclick     =  "return confirmarAccion()"
                                value       =  "Modificar"/>
                            &nbsp; &nbsp;
                            <%-- Botón para limpiar los campos --%>
                            <html:reset 
                                styleClass  =  "button" 
                                value       =  "Restaurar"/>
                        </td>
                    </tr>
               </table>
            </html:form>
       
        </center>
        
        <li><h2>Volver:</h2></li>
        
        <html:form action="/validar" method="POST">
            <html:hidden property="operacionValidar" value="retornar" />
            <html:submit
                styleClass   =   "button"
                onclick      =   "return confirmarAccion()"
                property     =   "submit" 
                value        =   "Atrás"/>                

        </html:form>
        
        <br/><br/>
        <%-- Enlace para salir del sistema --%>
        <html:link 
                 onclick    = "return confirmarExit()" 
                 forward    = "login"> Salir
        </html:link>
        
    </body>
    
    
</html>

