<%-- 
    Document   : newTablaEquivalencia
    Created on : 28/09/2013, 11:59:04 PM
    Author     : andreso
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<%@page import="java.util.* , frijoles.*, modelo.*" %>

<!DOCTYPE html>

<html>
    
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>SIGE - Registrar Tabla de Equivalencias</title>
    </head>
    <body>
        
        
        <%-- Script auxiliar para confirmar los vinculos de retorno --%>
        <script type="text/javascript">
        
        
        <%-- Función que verifica que las instituciones Orig y Dest difieran --%>
        function verificar() {
            return true;
        }
           
            
            
        <%-- Funcion que pregunta si de verdad se desea abandonar la sesion --%>
            function confirmarExit(){
                var confirmarE = confirm("¿Desea abandonar la Sesión?");
                return confirmarE;       
            }
        </script>
        
        </script>
        
        <%TablaEquivalenciaForm teq = 
        ((TablaEquivalenciaForm)request.getAttribute("TablaEquivalenciaForm"));
        
          String codInstOrig = teq.getCodigoInstitucionOrigen(); 
          String codInstDest= teq.getCodigoInstitucionDestino();
          GestionInstitucion gestionInst = new GestionInstitucion();
        
          InstitucionForm instOrig = gestionInst.obtenerInstitucion(codInstOrig);
          InstitucionForm instDest = gestionInst.obtenerInstitucion(codInstDest);
          ArrayList<CarreraForm> listaCarrOrig = gestionInst.mostrarCarreras(codInstOrig);
          ArrayList<CarreraForm> listaCarrDest = gestionInst.mostrarCarreras(codInstDest);
          
          String nombreInstOrigen  = instOrig.getNombreInstitucion();
          String nombreInstDestino = instDest.getNombreInstitucion();%>
        
        <html:form action="/gestionTablaEquivalencia" method="POST">   
 
          
          <html:hidden  property = "codigoInstitucionOrigen" 
                        value    = "<%=codInstOrig%>"/>
                        
          <html:hidden  property = "codigoInstitucionDestino" 
                        value    = "<%=codInstDest%>"/>
            
        <table><tr>
                
               
            <td>  
               <p>Seleccione una Carrera de la Institucion <%=nombreInstOrigen%></p>
               
                  <html:select styleClass="button" property="codigoCarreraOrigen" >
                  
                      <%for (int i=0; i<listaCarrOrig.size();i++) { 
                            String codCarrOrig  = listaCarrOrig.get(i).getCodigoCarrera();
                            String nombCarrOrig = listaCarrOrig.get(i).getNombreCarrera();%>
                            <%-- Creamos la lista desplegable con las carreras --%>
                            <html:option value="<%=codCarrOrig%>"><%=nombCarrOrig%></html:option>
                            
                            <%}%>
                    </html:select>
                
               
            </td>
            
            
            <td>
               <p>Seleccione una Carrera de la Institucion <%=nombreInstDestino%></p>
               
               <html:select styleClass="button" property="codigoCarreraDestino">

                   <%for (int i=0; i<listaCarrDest.size();i++) { 
                            String codCarrDest  = listaCarrDest.get(i).getCodigoCarrera();
                            String nombCarrDest = listaCarrDest.get(i).getNombreCarrera();%>
                            <%-- Creamos la lista desplegable con las carreras --%>
                            <html:option value="<%=codCarrDest%>"><%=nombCarrDest%></html:option>
                            
                            <%}%>
               </html:select>

               
            </td>

        </tr></table>
                
               <br><br><br><br/><br/><br/>
                <center>
                    <html:hidden property="operacionTabla" value="Agregar" />
                                        
                    <html:submit 
                        styleClass   =   "button"
                        property     =   "submit"
                        value        =   "Agregar Tabla de Equivalencia"/>
                </center>
                            
        </html:form> 
        
        <br/><br/>
        <li><h2>Volver: </h2></li>
        <html:form action="/gestionTablaEquivalencia" method="POST">
            <html:hidden  property = "codigoInstitucionOrigen" 
                            value    = "<%=codInstOrig%>"/>

            <html:hidden  property = "codigoInstitucionDestino" 
                            value    = "<%=codInstDest%>"/>
                            
            <html:hidden property="operacionTabla" value="Listar_Tablas" />
            
            
            <html:submit 
                styleClass   =   "button"
                property     =   "submit"
                value        =   "Listar Tablas"/>           
        </html:form>
    </body>
    
</html>
