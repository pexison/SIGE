<%-- 
    Document   : verCarrera
    Created on : Jun 28, 2013, 9:22:13 AM
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
        <title>SIGE - Detalles de Carrera</title>
    </head>
    <body>
        
        <script type="text/javascript">
        <%-- Función para confirmar si se desea salir --%>
        function confirmarExit(){
            var confirmarE = confirm("¿Desea abandonar la Sesión?");
            return confirmarE;       
        }
        // -->
        </script>
        
        <h1>Detalles de la Carrera</h1>
        
        <%-- Se obtienen los datos de la institución a mostrar --%>
        <%  CarreraForm carrForm = 
            (CarreraForm) request.getAttribute("CarreraForm");
            String codigoInst = carrForm.getCodigoInstitucion();
            String codigoCarr = carrForm.getCodigoCarrera();
            String nombreCarr = carrForm.getNombreCarrera();%>
        <li><h2>Datos de la Carrera:</h2></li>
        <ul><tr>
        <td>Código Institución: <%=codigoInst%></td><br/>
        <td>Código Carrera    : <%=codigoCarr%></td><br/>  
        <td>Nombre Carrera    : <%=nombreCarr%></td><br/><br/>
        </tr></ul>
        
        <table><tr>
        <html:form action="/gestionCarrera" method="POST">

            <html:hidden  property = "codigoInstitucion" 
                          value    = "<%=codigoInst%>"/>

            <html:hidden  property = "codigoCarrera" 
                           value    = "<%=codigoCarr%>"/>

            <html:hidden  property = "nombreCarrera" 
                          value    = "<%=nombreCarr%>"/>
            
            <%-- Botón para modificar la carrera --%>
            <html:submit 
                styleClass = "button" 
                property   = "operacionCarrera" 
                value      = "Modificar_Carrera"/>
            

        </html:form>
        
        <html:form action="/gestionCarreraRequiereAsignatura" method="POST">
            
            <html:hidden  property = "codigoInstitucion" 
                          value    = "<%=codigoInst%>"/>

            <html:hidden  property = "codigoCarrera" 
                           value    = "<%=codigoCarr%>"/>
                          
            <%-- Botón para eliminar la carrera --%>
            <html:submit 
                styleClass = "button" 
                onclick    = "return confirmarEliminar()" 
                property   = "operacionRequiereAsignatura" 
                value      = "Asignaturas_Requeridas"/>
            
        </html:form>
        </tr></table>    
        
        
        
        <li><h2>Volver: </h2></li> 
         
        <html:form action="/gestionInstitucion" method="POST">
        
            <html:hidden  property = "codigoInstitucion" 
                          value    = "<%=codigoInst%>"/>

            <html:hidden  property = "codigoCarrera" 
                           value    = "<%=codigoCarr%>"/>

            <html:hidden  property = "nombreCarrera" 
                          value    = "<%=nombreCarr%>"/>
            
            <%-- Botón para retornar a la lista de instituciones --%>
            <html:submit 
                styleClass = "button" 
                property   = "operacionInstitucion" 
                value      = "Listar_Carreras"/>
            
            <br/><br/>

        </html:form>
        
        <%-- Enlace para salir --%> 
        <html:link 
            onclick="return confirmarExit()" 
            forward="login"> Salir
        </html:link>
            
    </body>
</html>
