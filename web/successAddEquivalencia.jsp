<%-- 
    Document   : successAddEquivalencia
    Created on : May 28, 2013, 10:34:15 PM
    Author     : john
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@page import="java.util.* , frijoles.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGE - Carrera registrada con éxito</title>
    </head>
    <body>
    <center><h1>¡Equivalencia agregada con éxito!</h1></center>
            
            <%-- Obtener el nombre de la carrera y 
                 el código de la institución --%>

            <% EquivalenciaForm ef = ((EquivalenciaForm) 
               request.getAttribute("EquivalenciaForm")) ;
            
               String nEquivalencia = ef.getCodigoEquivalencia();
               String codInstOrig = ef.getCodigoInstitucionOrigen();
               String codInstDest = ef.getCodigoInstitucionDestino();
               String codCarrOrig = ef.getCodigoCarreraOrigen();
               String codCarrDest = ef.getCodigoCarreraDestino(); %>
               
            <center>
               <li>Se ha agregado la equivalencia de codigo '<%=nEquivalencia%>'</li>
               <p> Para consultar el estado actual de la tabla de equivalencia </p>
               <p> presione el boton "Detalles" </p>
                
               <li><h2>Volver: </h2></li>
                                  
               
               <html:form action="/gestionTablaEquivalencia" method="POST">
               
                    <html:hidden  property = "codigoInstitucionOrigen" 
                          value    = "<%=codInstOrig%>"/>
                          
                    <html:hidden  property = "codigoInstitucionDestino" 
                          value    = "<%=codInstDest%>"/>
                   
                    <html:hidden  property = "codigoCarreraOrigen" 
                          value    = "<%=codCarrOrig%>"/>
                          
                    <html:hidden  property = "codigoCarreraDestino" 
                          value    = "<%=codCarrDest%>"/>      
                           
                    <%-- Botón para volver a detalles de la institución --%>
                    <html:submit 
                        styleClass = "button" 
                        property   = "operacionTabla" 
                        value      = "Listar_Instituciones"/>
                   
                     <%-- Botón para volver a ver las Equivalencias--%>
                     
                      <html:submit 
                         styleClass = "button" 
                         property   = "operacionTabla" 
                         value      = "Detalles">
                      </html:submit>   

               </html:form>
         
               
               <%-- Enlace para salir del sistema --%>
               <html:link 
                        onclick    = "return confirmarExit()" 
                        forward    = "login">Salir
               </html:link>
               
        </center>
    </body>
</html>
