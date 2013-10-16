<%-- 
    Document   : successModifyAspirante
    Created on : Oct 16, 2013, 2:09:04 PM
    Author     : fertaku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@page import="java.util.* , frijoles.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>SIGE - Éxito al modificar el aspirante</title>
    </head>
    <body>
        
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
        
        <center>
               <p> ¡Éxito al modificar el aspirante! </p>
            
               <li><h2>Volver: </h2></li>
                                  
               
               <html:form action="/gestionAspirante" method="POST">
               
                    <html:hidden property="id_usuario" value="<%=id_usuario%>"/>
                    <html:hidden property="cedula" value="<%=cedula%>"/>
                    <html:hidden property="sexo" value="<%=sexo%>"/>
                    <html:hidden property="edad" value="<%=edad+""%>"/>
                    <html:hidden property="pais" value="<%=pais%>"/>
                    <html:hidden property="edo_civil" value="<%=estado_civil%>"/>
                    <html:hidden property="lugar_nacimiento" value="<%=lugar_nacimiento%>"/>
                    <html:hidden property="nacionalidad" value="<%=nacionalidad%>"/>  
                    
                    <html:hidden property="operacionAspirante" value="registrar_Aspirante" />
                           
                    <%-- Botón para volver a detalles del aspirante --%>
                    <html:submit 
                        styleClass = "button" 
                        property   = "operacionTabla" 
                        value      = "Detalles Aspirante"/>


               </html:form>
         
               
               <%-- Enlace para salir del sistema --%>
               <html:link 
                        onclick    = "return confirmarExit()" 
                        forward    = "login">Salir
               </html:link>
               
        </center>
        
        
        
        
    </body>
</html>

