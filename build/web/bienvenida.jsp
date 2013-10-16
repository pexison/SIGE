<%-- 
    Document   : bienvenida
    Created on : May 27, 2013, 9:36:56 PM
    Author     : fertaku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@page import="java.util.* , modelo.*, frijoles.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGE - Bienvenida</title>
    </head>
    
    <script type="text/javascript">
       <%-- Función para confirmar si se desea salir --%>
       function confirmarExit(){
           var confirmarE = confirm("¿Desea abandonar la Sesión?");
           return confirmarE;       
       }
       // -->
    </script>
    <body>
        <h1>Bienvenido,
            <%-- Se obtiene el nombre del usuario --%> 
            <i><%String usr = ((ValidacionForm)request.
                    getAttribute("ValidacionForm")).getUsuario();
                    GestionClientes gc = new GestionClientes();
                    RegistroForm rf = gc.obtenerCliente(usr);
                    String tipo_usuario = rf.getTipoUsuario();
                %>
                <%=usr%> <%=tipo_usuario%></i></h1>
    
    <%--Caso en el que el usuario es de tipo administrador o coordinador.
        Se pueden gestionar los diversos modelos del sistema--%>
    <% if (!tipo_usuario.equalsIgnoreCase("Solicitante")) { %>
        <html:form action="/gestionInstitucion" method="POST">

            <%-- Botón para ir a la página de Gestionar Instituciones --%>
            <h2>Gestión:</h2>
            <h3>  ¿Usted desea gestionar instituciones? </h3>
            <html:hidden property="operacionInstitucion" value="Listar_Instituciones" />
            <html:submit 
                styleClass   =   "button"
                property     =   "submit"
                value        =   "Gestionar Instituciones"/>
        </html:form>

        <html:form action="/gestionTablaEquivalencia" method="POST">

            <%-- Botón para ir a la página de Gestionar Tablas --%>
            <h3>  ¿Usted desea gestionar tablas de equivalencias? </h3>        
            <html:hidden property="operacionTabla" value="Listar_Instituciones" />
            <html:submit 
                styleClass   =   "button"
                property     =   "submit"
                value        =   "Gestionar Tablas de Equivalencia"/>
        </html:form>

         <html:form action="/gestionPlanilla" method="POST">

            <%-- Botón para ir a la página de Gestionar Peticiones de Equivalencia --%>
            <h3>  ¿Usted desea gestionar las Peticiones de Equivalencia? </h3>        
            <html:hidden property="operacionPlanilla" value="Consultar_Planillas" />
            <html:submit 
                styleClass   =   "button"
                property     =   "submit"
                value        =   "Gestionar Planillas de Equivalencia"/>
        </html:form>


                          
       <%-- Cierre del condicional --%>
       <%}%>
       
        <html:form action="/gestionAspirante" method="POST">

            <html:hidden  property = "id_usuario" 
                          value    = "<%=usr%>"/>
            <%--Tanto el usuario como el administrador/coordinador
                pueden solicitar una equivalencia--%>
            <br>
            <h2>Usuario:</h2>
            <%-- Botón para ir a la página de  Solicitud de Equivalencia --%>
            <h3>  ¿Usted desea efectuar una Solicitud de Equivalencia? </h3>  
            <html:hidden property="operacionAspirante" value="registrar_Aspirante" />
            <html:submit 
                styleClass   =   "button"
                property     =   "submit"
                value        =   "Solicitar Equivalencia"/>
        </html:form> 
        
     <li><h2>Volver: </h2></li> 
         
        <%-- Enlace para salir --%> 
        <html:link 
            onclick="return confirmarExit()" 
            forward="login"> Salir
        </html:link>
            
    </body>
</html>
