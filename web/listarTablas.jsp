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
            
            function execute(frm)
            {
                frm.action = "gestionTablaEquivalencia.do?method=Listar_Tablas";
                frm.submit();
            }
        </script>
        
        
        
        <%ArrayList<TablaEquivalenciaForm> listaTablas = 
            ((ArrayList<TablaEquivalenciaForm>) 
            request.getAttribute("ListaTablas"));
            TablaEquivalenciaForm te = (TablaEquivalenciaForm)
                    request.getAttribute("TablaEquivalenciaForm");
            GestionCarrera gestionCarr = new GestionCarrera();
            GestionInstitucion gestionInst = new GestionInstitucion();%>
            
            <%TablaEquivalenciaForm tf = (TablaEquivalenciaForm) 
                    request.getAttribute("TablaEquivalenciaForm");
            String codInstOrig = tf.getCodigoInstitucionOrigen();
            String codInstDest = tf.getCodigoInstitucionDestino();%>  
        
            
            <% if (!listaTablas.isEmpty()) {
            InstitucionForm instOrig = gestionInst.obtenerInstitucion(codInstOrig);
            InstitucionForm instDest = gestionInst.obtenerInstitucion(codInstDest);
            String nombreInstOrigen  = instOrig.getNombreInstitucion();
            String nombreInstDestino  = instDest.getNombreInstitucion();%>
            
            <p>Tablas de equivalencia desde <u><%=nombreInstOrigen%></u> hacia 
                <u><%=nombreInstDestino%></u></p>
            
            <table><tr><td>
            <html:form action="/gestionTablaEquivalencia" method="POST">
            
              
            
            <html:hidden  property = "codigoInstitucionOrigen" 
                          value    = "<%=codInstOrig%>"/>
                          
            <html:hidden  property = "codigoInstitucionDestino" 
                          value    = "<%=codInstDest%>"/>
            
            
            
                <html:hidden
                    property   = "operacionTabla" 
                    value      = "Listar_Tablas"/>

                <html:select styleClass="button" property="codigoCarreraOrigen" onchange="execute(this.form)">
                
                <%if (te.getCodigoCarreraOrigen()==null) {%>    
                    <html:option value="ninguno"> -- Seleccione la Carrera de Origen -- 
                    </html:option> 
                <%}%>
                
                <%for (int i=0; i<listaTablas.size();i++) { 
                 String codCarreraOrig = listaTablas.get(i).getCodigoCarreraOrigen();
                 CarreraForm carreraOrig = gestionCarr.obtenerCarrera(codInstOrig, codCarreraOrig);
                 String nombCarreraOrig = carreraOrig.getNombreCarrera();
                 String codCarreraDest = listaTablas.get(i).getCodigoCarreraDestino();
                 CarreraForm carreraDest = gestionCarr.obtenerCarrera(codInstDest, codCarreraDest);
                 String nombCarreraDest = carreraDest.getNombreCarrera();%>
                 
                    <%-- Creamos la lista desplegable con las tablas disponibles --%>
                    <html:option value="<%=codCarreraOrig%>" > 

                       <%=nombCarreraOrig%>
                        
                        
                    </html:option>
                            
                <%}%>
                
  

                </html:select>
                
                </html:form></td>

                
                               
                <td><html:form action="/gestionTablaEquivalencia" method="POST">    
                
                    <html:hidden  property = "codigoInstitucionOrigen" 
                          value    = "<%=codInstOrig%>"/>
                          
                    <html:hidden  property = "codigoInstitucionDestino" 
                                  value    = "<%=codInstDest%>"/>
                                  
                    <html:hidden  property = "codigoCarreraOrigen" 
                                  value    = "<%=te.getCodigoCarreraOrigen()%>"/>
                    
                <%if ((te != null) & (te.getCodigoCarreraOrigen() != null)) {%>

                <html:select styleClass="button" property="codigoCarreraDestino">
                    <%  String codSeleccionado = te.getCodigoCarreraOrigen();
                        String codCarreraDestino;
                        CarreraForm carreraDest;
                        for (int i=0; i<listaTablas.size();i++) { %>

                            <%if (listaTablas.get(i).getCodigoCarreraOrigen().equals(codSeleccionado)) {

                                codCarreraDestino = listaTablas.get(i).getCodigoCarreraDestino();
                                carreraDest = gestionCarr.obtenerCarrera(codInstDest, codCarreraDestino);%>

                                <html:option value="<%=codCarreraDestino%>"> 

                                    <%=carreraDest.getNombreCarrera()%>

                                </html:option>

                            <%}%>

                        <%}%>
                </html:select>
                
                <html:submit 
                    styleClass = "button" 
                    property   = "operacionTabla" 
                    value      = "Detalles">
                </html:submit>
                
                <%}%>       
                

            </html:form> </td>
                        
            <%} else {%>
            
                <p> No hay tablas de equivalencia disponibles </p>
            
            <%}%>
            
            <td><html:form action="/gestionTablaEquivalencia" method="POST">
            
                <html:hidden  property = "codigoInstitucionOrigen" 
                              value    = "<%=codInstOrig%>"/>
                          
                <html:hidden  property = "codigoInstitucionDestino" 
                              value    = "<%=codInstDest%>"/>
                
            <%-- Boton para ir al formulario de creacion de una tabla --%>
            
            <html:submit 
                styleClass = "button" 
                property   = "operacionTabla" 
                value      = "Crear_Tabla">
            </html:submit></td></tr></table>
            
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
