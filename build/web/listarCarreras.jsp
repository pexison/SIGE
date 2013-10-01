<%-- 
    Document   : listarCarreras
    Created on : May 29, 2013, 11:55:33 AM
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
        <title>SEA - Gestión de Carreras</title>
    </head>
    
    <body>
          <script type="text/javascript">
              
        <!--

        <%-- Función para confirmar la eliminación de la carrera --%>
        function confirmarEliminar(){
            var confirmarE = confirm("Desea eliminar la Carrera?");
            return confirmarE;       
        }
        
        <%-- Función para confirmar la salida del sistema --%>
        function confirmarExit(){
            var confirmarE = confirm("Desea abandonar la Sesion?");
            return confirmarE;       
        }
        // -->
        </script>
        
        <center>    
        <h1>Gestión de carreras.</h1>
        </center>
        <ul>

        <%-- Obtener la lista de las instituciones --%>
        <%ArrayList<CarreraForm> listaInst = 
                    ((ArrayList<CarreraForm>) 
                    request.getAttribute("ListaCarreras")); %>
                    
        <%-- Obtener el nombre de la institución junto con su código --%>
        <%InstitucionForm rf = 
            (InstitucionForm) request.getAttribute("InstitucionForm"); %>
            
        <%String codigoInst = rf.getCodigoInstitucion();
          String nombInst = rf.getNombreInstitucion();%>

        <center>

            
        <html:form action="/gestionCarrera" method="POST">

            <li><h2>Carreras disponibles en la <%=nombInst%></h2></li>

            <html:hidden  property = "nombreInstitucion" 
                          value    = "<%=nombInst%>"/>

            <html:hidden  property = "codigoInstitucion" 
                          value    = "<%=codigoInst%>"/>
                          
            <%-- Mostrar la lista con las carreras de la institución --%>
            <% if (!listaInst.isEmpty()) { %>
    
                <html:select styleClass="button" property="codigoCarrera">

                    <% for (int i=0; i<listaInst.size();i++) { 
                    String nombreCarr=listaInst.get(i).getNombreCarrera();
                    String codCarr = listaInst.get(i).getCodigoCarrera();%>

                    <html:option value="<%=codCarr%>">
                            <%=codCarr%> - <%=nombreCarr%>
                    </html:option>

                    <%}%>
                </html:select>
                            
                <%-- Botón para ver detalle de la carrera --%>
                <html:submit 
                    styleClass = "button" 
                    property   = "operacionCarrera" 
                    value      = "Detalle_Carrera"/>
                
            <% } else { %>
            
                <li> No hay carreras disponibles </li>
                
            <%}%>
                            
            <%-- Botón para registrar una carrera --%>
            <html:submit 
                styleClass = "button" 
                property   = "operacionCarrera" 
                value      = "Registrar_Carrera"/>
     
            
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
    <ul/>
    </body>
</html>
