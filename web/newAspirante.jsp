<%-- 
    Document   : newAspirante
    Created on : 16/10/2013, 01:13:57 AM
    Author     : andreso
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<%@page import="java.util.* , modelo.* , frijoles.*" %>

<!DOCTYPE html>
<html>
    
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGE - Agregar Aspirante</title>
    </head>
    
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
        
         <%-- Función para confirmar que se desea continuar con la operacion --%>
        function confirmarAccion(){
            var confirmarM = confirm("¿Desea continuar?");
            return confirmarM;       
        } 
        
       <%-- Función para confirmar si se desea salir --%>
       function confirmarExit(){
           var confirmarE = confirm("¿Desea abandonar la Sesión?");
           return confirmarE;       
       }
       // -->
    </script>
    <body>
        <center><h1>Registro de Aspirante</h1></center>
        <li><h2>Complemente debidamente el formulario con sus datos personales.
        Al finalizar pulse el botón Aceptar.</h2></li>
        <center>
            <html:form action="/gestionAspirante" onsubmit="return validarCampos()" method="POST">
              <%AspiranteForm af= (AspiranteForm) request.getAttribute("AspiranteForm");
                String user_id = af.getId_usuario();
                //Obtener la lista de paises--
                GestionAspirante gc = new GestionAspirante();
                ArrayList<String> listaPaises = gc.mostrarPaises();%>
               <table>
                    <td>id de Usuario:</td>
                        
                        <td>
                            <html:text 
                                styleClass  =  "input" 
                                maxlength   =  "12" 
                                readonly    =  "TRUE"
                                property    =  "id_usuario" 
                                value       =  "<%=user_id%>"/>
                        </td>
                    <tr>
                        <%-- Campo para la cedula de identidad --%>
                        <td>Cedula de Identidad:</td>
                        <td><html:text 
                            styleClass  =  "input" 
                            maxlength   =  "12"
                            property    =  "cedula"/></td>
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
                            property    =  "edad"/></td>
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
                            property    =  "lugar_nacimiento"/></td>
                    </tr>
                      <tr>
                        <%-- Campo para la dirección de la institución --%>
                        <td>Nacionalidad:</td>
                        <td><html:text 
                            styleClass  =  "input" 
                            maxlength   =  "30" 
                            property    =  "nacionalidad"/></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <br/>
                            <%-- Botón para agregar la informacion del aspirante --%>
                            <html:submit 
                                styleClass  =  "button" 
                                property    =  "operacionAspirante"
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
