<%-- 
    Document   : successModifyEquivalencia
    Created on : 02/10/2013, 02:11:14 AM
    Author     : andreso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@page import="java.util.* , frijoles.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGE - Equivalencia modificada con éxito</title>
    </head>
    <body>
        <h1>¡Equivalencia modificada con éxito!</h1>
            
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
               <li>Se ha modificado la equivalencia de código '<%=nEquivalencia%>'</li>
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
