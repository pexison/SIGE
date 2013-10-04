<%-- 
    Document   : verAsignatura
    Created on : Jun 29, 2013, 12:49:43 PM
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
        <title>SIGE - Detalles de Asignatura</title>
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
        
        <h1>Detalles de la Asignatura</h1>
        
        <%-- Se obtienen los datos de la asignatura a mostrar --%>
        <%  AsignaturaForm carrForm = 
            (AsignaturaForm) request.getAttribute("AsignaturaForm");
            String codigoInst = carrForm.getCodigoInstitucion();
            String codigoAsig = carrForm.getCodigoAsignatura();
            String nombreAsig = carrForm.getNombreAsignatura();
            Integer creditos = carrForm.getCreditos();
            String strCreditos = creditos.toString();%>
        <li><h2>Datos de la Asignatura:</h2></li>
        <ul><tr>
        <td>Código Institución: <%=codigoInst%></td><br/>
        <td>Código Asignatura : <%=codigoAsig%></td><br/>  
        <td>Nombre Asignatura : <%=nombreAsig%></td><br/>
        <td>Número de Créditos : <%=strCreditos%></td><br/><br/>
        </tr></ul>
        
        <html:form action="/gestionAsignatura" method="POST">
            
            <html:hidden  property = "codigoInstitucion" 
                          value    = "<%=codigoInst%>"/>
            
            <html:hidden  property = "codigoAsignatura" 
                          value    = "<%=codigoAsig%>"/>
                          
            <html:hidden  property = "nombreAsignatura" 
                          value    = "<%=nombreAsig%>"/>
                          
            <html:hidden  property = "creditos" 
                          value    = "<%=strCreditos%>"/>
                          
            <%-- Botón para modificar la asignatura --%>
            <html:submit 
                styleClass = "button" 
                property   = "operacionAsignatura" 
                value      = "Modificar_Asignatura"/>
            
        </html:form>
        
        <li><h2>Volver: </h2></li> 
         
        <html:form action="/gestionInstitucion" method="POST">
        
            <html:hidden  property = "codigoInstitucion" 
                          value    = "<%=codigoInst%>"/>

            <%-- Botón para retornar a la lista de instituciones --%>
            <html:submit 
                styleClass = "button" 
                property   = "operacionInstitucion" 
                value      = "Listar_Asignaturas"/>
            
            <br/><br/>

        </html:form>
            
        <%-- Link para abandonar al sistema. --%>
        <html:link onclick="return confirmarExit()" forward="login">Salir</html:link>
        
    </body>
</html>
