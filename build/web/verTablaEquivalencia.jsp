<%-- 
    Document   : verTablaEquivalencia
    Created on : Sep 28, 2013, 12:59:04 PM
    Author     : fertaku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<%@page import="java.util.* , frijoles.*, modelo.*" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        
        <style>
            table { 
                border-collapse: collapse; 
                }
            td, th { border: 1px solid #CCC;}
        </style>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>SEA - Gestión de Tablas de Equivalencia</title>
    </head>
    <body>
        
        <script type="text/javascript">
        <%-- Función para confirmar si se desea salir --%>
        function confirmarEliminacionEquivalencia(){
            var confirmarE = confirm("La equivalencia sera eliminada, ¿Desea continuar?");
            return confirmarE;       
        }    
            
            
        <%-- Función para confirmar si se desea salir --%>
        function confirmarExit(){
            var confirmarE = confirm("¿Desea abandonar la Sesión?");
            return confirmarE;       
        }
        // -->
        </script>
        
        
        <%ArrayList<EquivalenciaForm> listaEquiv = 
            ((ArrayList<EquivalenciaForm>) 
            request.getAttribute("ListaEquivalencias")); 
            TablaEquivalenciaForm te = (TablaEquivalenciaForm) 
                    request.getAttribute("TablaEquivalenciaForm");
            
            String codInstOrig = te.getCodigoInstitucionOrigen();
            String codInstDest = te.getCodigoInstitucionDestino();
            String codCarrOrig = te.getCodigoCarreraOrigen();
            String codCarrDest = te.getCodigoCarreraDestino();
            
            %>
            

        <h1>Detalles de las equivalencias ofrecidas para la Tabla</h1>
        
        <html:form action="/gestionTablaEquivalencia" method="POST">
        <%-- Botón para regresar a las instituciones de las Tablas --%>
        
            <html:hidden 
                property = "codigoInstitucionOrigen"
                value = "<%=codInstOrig%>"/>

            <html:hidden 
                property = "codigoInstitucionDestino"
                value = "<%=codInstDest%>"/>

            <html:hidden 
                property = "codigoCarreraOrigen"
                value = "<%=codCarrOrig%>"/>

            <html:hidden 
                property = "codigoCarreraDestino"
                value = "<%=codCarrDest%>"/>
        
            <html:submit 
                     styleClass = "button"  
                     property   = "operacionTabla" 
                     value      = "Listar_Instituciones"/>

            <html:submit 
                     styleClass = "button"  
                     property   = "operacionTabla" 
                     value      = "Eliminar_Tabla"/>

            <br/><br/>

        </html:form>
        
        <table><tr>
            
            <td>
            <html:form action="/gestionEquivalencia" method="POST">
            <%-- Botón para crear una nueva equivalencia --%>
            
            
            <html:hidden 
                property = "codigoInstitucionOrigen"
                value = "<%=codInstOrig%>"/>

            <html:hidden 
                property = "codigoInstitucionDestino"
                value = "<%=codInstDest%>"/>

            <html:hidden 
                property = "codigoCarreraOrigen"
                value = "<%=codCarrOrig%>"/>

            <html:hidden 
                property = "codigoCarreraDestino"
                value = "<%=codCarrDest%>"/>

            <html:submit 
                     styleClass = "button"  
                     property   = "operacionEquivalencia" 
                     value      = "Crear_Equivalencia"/>
        

            <br/><br/>

            </html:form></td>
        
        </tr></table>    
            
        <% if (!listaEquiv.isEmpty()) { %>
         
        
        <table>
            <tr bgcolor="6699CC">
                <th width="120px" rowspan="2"> Codigo Equivalencia </th>
                <th width="500px" colspan="3"> Materias ofrecidas en la institucion de Origen </th>
                <th width="500px" colspan="3"> Materias ofrecidas en la institucion de Destino </th>
                <th rowspan="2" colspan ="3"> Acción </th>
            </tr>
            
            <tr bgcolor="6699CC" align="center">
                <td>Codigo</td><td>Nombre</td><td>Creditos</td>
                <td>Codigo</td><td>Nombre</td><td>Creditos</td>
            </tr>
            
            <%for (int i=0; i<listaEquiv.size();i++) { 
              EquivalenciaForm equiv = listaEquiv.get(i);%>
                
            <html:form action="/gestionEquivalencia" method="POST"> 
              
                <html:hidden 
                    property = "codigoInstitucionOrigen"
                    value = "<%=codInstOrig%>"/>

                <html:hidden 
                    property = "codigoInstitucionDestino"
                    value = "<%=codInstDest%>"/>

                <html:hidden 
                    property = "codigoCarreraOrigen"
                    value = "<%=codCarrOrig%>"/>

                <html:hidden 
                    property = "codigoCarreraDestino"
                    value = "<%=codCarrDest%>"/>
                    
                <html:hidden 
                    property = "codigoEquivalencia"
                    value = "<%=equiv.getCodigoEquivalencia()%>"/>
                    
                <%ArrayList<AsignaturaForm> asignaturasOrigen = equiv.getAsignaturasOrigen();
                    AsignaturaForm asigActual;%>
                    
                <%ArrayList<AsignaturaForm> asignaturasDestino = equiv.getAsignaturasDestino();
                 int maxNumeroMaterias = Math.max(asignaturasOrigen.size(), asignaturasDestino.size());%>

                <tr height="25"/>
                <tr bgcolor="#F0F0F0" align="center">
                    <td rowspan="<%=maxNumeroMaterias%>"> <%=equiv.getCodigoEquivalencia()%> </td>
                 
                <%for (int j=0; j<maxNumeroMaterias;j++) { %>
                

                    <%if (j<asignaturasOrigen.size()) {
                    asigActual = asignaturasOrigen.get(j);%>

                    <td><%=asigActual.getCodigoAsignatura()%></td>
                    <td><%=asigActual.getNombreAsignatura()%></td>
                    <td><%=asigActual.getCreditos()%></td>

                    <%} else {%>
                    <td/><td/><td/>
                    <%}%>

                    <%if (j<asignaturasDestino.size()) {
                    asigActual = asignaturasDestino.get(j);%>

                    <td><%=asigActual.getCodigoAsignatura()%></td>
                    <td><%=asigActual.getNombreAsignatura()%></td>
                    <td><%=asigActual.getCreditos()%></td>

                    <%} else {%>
                    <td/><td/><td/>
                    <%}%>
                    
                    <%if (j == maxNumeroMaterias - 1) {%>
                        <td><html:submit 
                            styleClass = "button"
                            onclick    = "return confirmarEliminacionEquivalencia()" 
                            property   = "operacionEquivalencia" 
                            value      = "Eliminar_Equivalencia"/></td>
                        
                        <td><html:submit 
                            styleClass = "button" 
                            property   = "operacionEquivalencia" 
                            value      = "Modificar"/></td>
                    <%} else {%>
                        <td/>
                        <td></td>
                    <%}%>
                    
                </tr><tr bgcolor="#F0F0F0" align="center">
                <%}%>
                </tr>
                
                
                
                </html:form>
                
            <%}%>
        <table>
        
        <% } else { %>
            
            <p>No hay equivalencias disponibles para esta tabla</p>
        
        <%}%>
        
        

        <%-- Enlace para salir del sistema --%>
        <html:link
                  onclick    = "return confirmarExit()" 
                  forward    = "login">Salir
        </html:link>
        <br/><br/>
        
    </body>
</html>
