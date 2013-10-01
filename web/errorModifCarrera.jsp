<%-- 
    Document   : errorModifCarrera
    Created on : May 31, 2013, 11:12:47 AM
    Author     : acs
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@page import="java.util.* , modelo.*, frijoles.*" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Error</title>
    </head>
    <body>
        <h1>Error al modificar carrera</h1>
        <html:form action="/gestionInstitucion" method="POST">

            <%-- Obtener el nombre de la carrera y la institución --%>
            <% CarreraForm cf = ((CarreraForm) 
               request.getAttribute("CarreraForm"));
            
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
                   styleClass="button" 
                   property="operacionInstitucion" 
                   value="Listar_Carreras"/>
              
        </html:form>
        
    </body>
</html>
