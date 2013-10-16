<%-- 
    Document   : successAddAspirante
    Created on : 16/10/2013, 01:04:54 AM
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
        <title>SIGE - Aspirante agregado con éxito<</title>
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
    
    <body>
        <center>Aspirante agregado con éxito</center>
        <h2>¡Ha sido agregado con éxito! Usted ahora forma parte de la comunidad 
            de aspirantes a equivalencias.</h2>
        <center>
            
           <%AspiranteForm af= (AspiranteForm) request.getAttribute("AspiranteForm");
             String id_user = af.getId_usuario();
             String cedula  = af.getCedula();%>
           <html:form action="/gestionPlanilla" method="POST">
             
                <html:hidden  property = "cedula_aspirante" 
                              value    = "<%=cedula%>"/>
        </center>
                <h3>  Pulse Llenar Planilla para solicitar
                formalmente una equivalencia.  </h3>  


                <%-- Botón para ir a la planilla de Solicitud de Equivalencia--%>
                <html:hidden property="operacionPlanilla" value="registrar_Planilla" />
               
                    <html:submit 
                    styleClass   =   "button"
                    property     =   "submit"
                    value        =   "LLenar Planilla"/>
                    
           </html:form>    
           
           <html:form action="/gestionAspirante" method="POST">
         
                 <h3>Pulse Ver Mis Datos para ver sus detalles personales.</h3>
        
                <html:hidden  property = "id_usuario" 
                              value    = "<%=id_user%>"/>

                <html:hidden property="operacionAspirante" value="mostrar_Detalles" />
                <html:submit 
                    styleClass   =   "button"
                    property     =   "submit"
                    value        =   "Ver mis Datos"/>
                
           </html:form>             
    </body>
</html>
