<%-- 
    Document   : verAspirante
    Created on : Oct 16, 2013, 10:39:22 AM
    Author     : fertaku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@page import="java.util.* , frijoles.*, modelo.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGE - Detalles del Aspirante</title>
    </head>
     <script type="text/javascript">
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
    
    <body><center>
        <h1>Perfil de Aspirante</h1>
        
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
        
        <table>
            <tr>
                <td>ID de usuario: </td>
                <td><%=id_usuario%></td>
            </tr>
            <tr>
                <td>Cédula: </td>
                <td><%=cedula%></td>
            </tr>
            <tr>
                <td>Sexo: </td>
                <td><%=sexo%></td>
            </tr>
            <tr>
                <td>Edad: </td>
                <td><%=edad%></td>
            </tr>
            <tr>
                <td>Estado Civil: </td>
                <td><%=estado_civil%></td>
            </tr>
            <tr>
                <td>País: </td>
                <td><%=pais%></td>
            </tr>
            <tr>
                <td>Lugar de Nacimiento: </td>
                <td><%=lugar_nacimiento%></td>
            </tr>
            <tr>
                <td>Nacionalidad: </td>
                <td><%=nacionalidad%></td>
            </tr>
        </table>
        
        &nbsp; &nbsp;
        <table><tr>
            <td><html:form action="/gestionAspirante" onsubmit="return validarCampos()" method="POST">

                <html:hidden property = "id_usuario" value = "<%=id_usuario%>"/>
                <html:hidden property = "cedula" value = "<%=cedula%>"/>
                <html:hidden property = "sexo" value = "<%=sexo%>"/>
                <html:hidden property = "edad" value = "<%=edad+""%>"/>
                <html:hidden property = "pais" value = "<%=pais%>"/>
                <html:hidden property = "edo_civil" value = "<%=estado_civil%>"/>
                <html:hidden property = "lugar_nacimiento" value = "<%=lugar_nacimiento%>"/>
                <html:hidden property = "nacionalidad" value = "<%=nacionalidad%>"/>

                <html:hidden property="operacionAspirante" value ="Modificar_Aspirante"/>



                <html:submit 
                    styleClass  =  "button" 
                    onclick     =  "return confirmarAccion()"
                    value       =  "Modificar Perfil"/>

            </html:form></td>
            
            <td><html:form action="/gestionPlanilla" method="POST">
            
                <html:hidden property = "id_usuario" value = "<%=id_usuario%>"/>
                <html:hidden property = "cedula_aspirante" value = "<%=cedula%>"/>
                <html:hidden property="operacionPlanilla" value ="registrar_Planilla"/>
                
                <html:submit 
                    styleClass  =  "button"
                    value       =  "Realizar una nueva Solicitud"/>
                
            </html:form></td>
        </tr></table>
    </center>
    
    <li><h2>Volver:</h2></li>
        <%-- Enlace para salir del sistema --%>
        
        <html:form action="/validar" method="POST">
            <html:hidden property="operacionValidar" value="retornar" />
            <html:hidden property="id_usuario" value="<%=id_usuario%>" />
            <html:submit
                styleClass   =   "button"
                property     =   "submit" 
                value        =   "Volver al Inicio"/>                

        </html:form>
        
        <br>
        
        <html:link 
                 onclick    = "return confirmarExit()" 
                 forward    = "login"> Salir
        </html:link>
    




    </body>
</html>
