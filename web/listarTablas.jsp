<%-- 
    Document   : listarTablas
    Created on : Jun 28, 2013, 9:01:47 AM
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

        <title>SEA - Gestión de Tablas de Equivalencia</title>
    </head>
    
    <body>

    
    
        <%-- Script auxiliar para confirmar los vinculos de retorno --%>
        <script type="text/javascript">
            
        <%-- Funcion que pregunta si de verdad se desea abandonar la sesion --%>
            function confirmarExit(){
                var confirmarE = confirm("Desea abandonar la Sesion?");
                return confirmarE;       
            }
        </script>
        
        
        
        <%ArrayList<TablaEquivalenciaForm> listaTablas = 
            ((ArrayList<TablaEquivalenciaForm>) 
            request.getAttribute("ListaTablas"));
        GestionCarrera gestionCarr = new GestionCarrera();
        GestionInstitucion gestionInst = new GestionInstitucion();%>
            
            
        
            <html:form action="/gestionTablaEquivalencia" method="POST">
            
            <%TablaEquivalenciaForm tf = (TablaEquivalenciaForm) 
                    request.getAttribute("TablaEquivalenciaForm");
            String codInstOrig = tf.getCodigoInstitucionOrigen();
            String codInstDest = tf.getCodigoInstitucionDestino();%>    
            
            <html:hidden  property = "codigoInstitucionOrigen" 
                          value    = "<%=codInstOrig%>"/>
                          
            <html:hidden  property = "codigoInstitucionDestino" 
                          value    = "<%=codInstDest%>"/>
            
            <% if (!listaTablas.isEmpty()) {
            InstitucionForm instOrig = gestionInst.obtenerInstitucion(codInstOrig);
            InstitucionForm instDest = gestionInst.obtenerInstitucion(codInstDest);
            String nombreInstOrigen  = instOrig.getNombreInstitucion();
            String nombreInstDestino  = instDest.getNombreInstitucion();%>
            
            
            
            <p>Tablas de equivalencia desde <u><%=nombreInstOrigen%></u> hacia 
                <u><%=nombreInstDestino%></u></p>
            
                <html:select styleClass="button" property="codigoCarreraOrigen">

                <%for (int i=0; i<listaTablas.size();i++) { 
                 String codCarreraOrig = listaTablas.get(i).getCodigoCarreraOrigen();
                 CarreraForm carreraOrig = gestionCarr.obtenerCarrera(codInstOrig, codCarreraOrig);
                 String nombCarreraOrig = carreraOrig.getNombreCarrera();
                 String codCarreraDest = listaTablas.get(i).getCodigoCarreraDestino();
                 CarreraForm carreraDest = gestionCarr.obtenerCarrera(codInstDest, codCarreraDest);
                 String nombCarreraDest = carreraDest.getNombreCarrera();%>
                 
                    <%-- Creamos la lista desplegable con las tablas disponibles --%>
                    <html:option value="<%=codCarreraOrig%>"> 

                        Equivalencias desde <%=nombCarreraOrig%> hacia <%=nombCarreraDest%>
                        
                        <html:hidden property="codigoCarreraDestino" value="<%=codCarreraDest%>"/>
                                     
                    </html:option>
                            
                    <%}%>
                    

                </html:select>

                <html:submit 
                    styleClass = "button" 
                    property   = "operacionTabla" 
                    value      = "Detalles">
                </html:submit>   
                        
            <%} else {%>
            
                <p> No hay tablas de equivalencia disponibles </p>
            
            <%}%>
            
            <%-- Boton para ir al formulario de creacion de una tabla --%>            
            <html:submit 
                styleClass = "button" 
                property   = "operacionTabla" 
                value      = "Crear_Tabla">
            </html:submit>
            
           <br/><br/>
           <li><h2>Volver: </h2></li>
                    
           <%-- Botón para regresar a las instituciones de las Tablas --%>
           <html:submit 
                    styleClass = "button"  
                    property   = "operacionTabla" 
                    value      = "Listar_Instituciones"/>

           <br/><br/>
            
           </html:form>
            
           <%-- Enlace para salir del sistema --%>
           <html:link 
                    onclick    = "return confirmarExit()" 
                    forward    = "login">Salir
           </html:link>
                
    </body>
</html>
