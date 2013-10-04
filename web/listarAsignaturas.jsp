<%-- 
    Document   : listarAsignaturas
    Created on : Jun 29, 2013, 9:59:50 AM
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
        <title>SIGE - Gestión de Asignaturas</title>
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
        <h1>Gestión de Asignaturas.</h1>
        
    
        <%-- Obtener la lista de las instituciones --%>
        <%ArrayList<AsignaturaForm> listaAsig = 
                    ((ArrayList<AsignaturaForm>) 
                    request.getAttribute("ListaAsignaturas")); %>
                    
        <%-- Obtener el nombre de la institución junto con su código --%>
        <%InstitucionForm rf = 
            (InstitucionForm) request.getAttribute("InstitucionForm"); %>
            
        <%String codigoInst = rf.getCodigoInstitucion();
          String nombInst = rf.getNombreInstitucion();%>
        
        <html:form action="/gestionAsignatura" method="POST">

            <li><h2>Asignaturas disponibles en la <%=nombInst%></h2></li>

            <html:hidden  property = "nombreInstitucion" 
                          value    = "<%=nombInst%>"/>

            <html:hidden  property = "codigoInstitucion" 
                          value    = "<%=codigoInst%>"/>
                          
            <%-- Mostrar la lista con las asignaturas de la institución --%>
            <% if (!listaAsig.isEmpty()) { %>
            
                <html:select styleClass="button" property="codigoAsignatura">

                    <% for (int i=0; i<listaAsig.size();i++) { 
                    String nombreAsig=listaAsig.get(i).getNombreAsignatura();
                    String codAsig = listaAsig.get(i).getCodigoAsignatura();%>

                    <html:option value="<%=codAsig%>">
                            <%=codAsig%> - <%=nombreAsig%>
                    </html:option>

                    <%}%>
                </html:select>
           
                <%-- Botón para ver detalle de la carrera --%>
                <html:submit 
                    styleClass = "button" 
                    property   = "operacionAsignatura" 
                    value      = "Detalle_Asignatura"/>
                            
           <% } else { %>
               <li> No hay asignaturas disponibles </li>
           <%}%>
           
           <%-- Botón para registrar una carrera --%>
           <html:submit 
               styleClass = "button" 
               property   = "operacionAsignatura" 
               value      = "Registrar_Asignatura"/>
           
        </html:form>
               
         <html:form action="/gestionInstitucion" method="POST">
            
                <li><h2>Volver: </h2></li>

                <html:hidden  
                    property = "codigoInstitucion" 
                    value    = "<%=codigoInst%>"/>

                <%-- Botón para regresar a los detalles de la institución --%>
                <html:submit 
                    styleClass = "button"  
                    property   = "operacionInstitucion" 
                    value      = "Detalle_Institucion"/>

                <%-- Botón para regresar a listar las instituciones --%>
                <html:submit 
                    styleClass = "button"  
                    property   = "operacionInstitucion" 
                    value      = "Listar_Instituciones"/>

                <br/><br/>

                <%-- Enlace para salir del sistema --%>
                <html:link 
                    onclick    = "return confirmarExit()" 
                    forward    = "login">Salir
                </html:link>
                    
            
        </html:form>
               
        </center>
    </body>
</html>
