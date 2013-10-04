<%-- 
    Document   : errorRmCarrera
    Created on : 30/05/2013, 08:45:19 AM
    Author     : andreso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@page import="java.util.* , modelo.*, frijoles.*" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <title>SIGE - Error al eliminar la carrera</title>
    </head>
    <body>
        <h1>Error - Error al eliminar la carrera</h1>
        <html:form action="/gestionInstitucion" method="POST">

            <%-- Obtener el nombre de la institución y de la carrera --%>
            <% CarreraForm cf = ((CarreraForm) 
               request.getAttribute("CarreraForm")) ;
               GestionInstitucion gi = new GestionInstitucion();
               String nCarrera = cf.getNombreCarrera();
               String cInst = cf.getCodigoInstitucion();
               InstitucionForm inf = ((InstitucionForm)
                        gi.obtenerInstitucion(cInst));
                String nombreInst = inf.getNombreInstitucion();
            
            %>
               <p> No hay carreras disponibles para la institución
                   <%=nombreInst%></p>

               <html:hidden property="codigoInstitucion" value="<%=cInst%>"/>

               <%-- Botón para regresar a listar las carreras --%>
               <html:submit 
                styleClass = "button" 
                property   = "operacionInstitucion" 
                value      = "Listar_Carreras"/>
            
        </html:form>
               
       
    </body>
</html>
