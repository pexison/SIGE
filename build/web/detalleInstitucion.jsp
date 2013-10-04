<%-- 
    Document   : detalleInstitucion
    Created on : May 29, 2013, 10:42:54 AM
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

        <title>SIGE - Detalles de institución</title>
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
    <center>
        <h1>Detalles de la Institución</h1>
    
    <ul>
        
        <%-- Se obtienen los datos de la institución a mostrar --%>
        <%  InstitucionForm instForm = 
            (InstitucionForm) request.getAttribute("InstitucionForm");
            String codigoInst = instForm.getCodigoInstitucion();
            String nombreInst = instForm.getNombreInstitucion();
            String dirInst = instForm.getDireccionInstitucion();
            String paisInst = instForm.getPaisInstitucion();%>
        
        <html:form action="/gestionInstitucion" method="POST">

        <table>
             
            <tr>
                <td colspan="2">
                <font size ='3'>

                <li>Código Institución: <%=codigoInst%></li><br/>    
                    
                <li>Nombre Institución: <%=nombreInst%></li><br/>
            
                <li>Dirección: <%=dirInst%></li><br/>
                
                <li>País: <%=paisInst%></li><br/><br/>
                </font>

                <%-- Botón para modificar la institución --%>            
                <html:submit 
                    styleClass = "button" 
                    property   = "operacionInstitucion" 
                    value      = "Modificar_Institucion"/>
             
            </td>
        </tr>
        <tr>
            
            <html:hidden  property="codigoInstitucion" 
            value="<%=codigoInst%>"/>

            <html:hidden property="nombreInstitucion" 
            value="<%=nombreInst%>"/>

            <html:hidden property="direccionInstitucion" 
            value="<%=dirInst%>"/>

            <html:hidden property="paisInstitucion" 
            value="<%=paisInst%>"/>
            
            <td>
        <li><h2>Gestionar Carreras: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2></li> 
        
                <%-- Botón para listar las carreras de la institución --%>
                <html:submit 
                    styleClass = "button" 
                    property   = "operacionInstitucion" 
                    value      = "Listar_Carreras"/>
            </td>
            <td>
                <li><h2>Gestionar Asignaturas:</h2></li> 

                <%-- Botón para listar las carreras de la institución --%>
                <html:submit 
                    styleClass = "button" 
                    property   = "operacionInstitucion" 
                    value      = "Listar_Asignaturas"/>
            </td>
        </tr>
        
        </table>
        </html:form>
        
         <li><h2>Volver: </h2></li> 
         
        <html:form action="/gestionInstitucion" method="POST">
        
            <%-- Botón para retornar a la lista de instituciones --%>
            <html:submit 
                styleClass = "button" 
                property   = "operacionInstitucion" 
                value      = "Listar_Instituciones"/>
            
            <br/><br/>
            
        </html:form>
        
        <%-- Enlace para salir --%> 
        <html:link 
            onclick="return confirmarExit()" 
            forward="login"> Salir
        </html:link>
            
    </ul>
    </center>
    </body>
</html>
