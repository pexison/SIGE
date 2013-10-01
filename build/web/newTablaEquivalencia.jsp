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

        <title>SEA - Registrar Tabla de Equivalencia</title>
    </head>
    <body>
        
        <script type="text/javascript">
        <!--

        <%-- Función para verificar que los campos estén llenos --%>
        function validarCampos() {
            return true;
        }
        
        <%-- Función para confirmar que se desea modificar la institución --%>
        function confirmarAccion(){
            var confirmarM = confirm("¿Desea continuar?");
            return confirmarM;       
        }
        
        // -->
        </script>
        
        <html:form action="/gestionTablaEquivalencia" method="POST">   
           
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
          
          
          <html:hidden  property = "codigoInstitucionOrigen" 
                        value    = "<%=codInstOrig%>"/>
                        
          <html:hidden  property = "codigoInstitucionDestino" 
                        value    = "<%=codInstDest%>"/>
                        
        <%if (listaCarrOrig.isEmpty()) {%>
        
            <p>La institucion <%=nombreInstOrigen%> no tiene carreras registradas. 
               Por favor agregue una carrera para esta institucion antes de continuar</p>
        
        <%} else if (listaCarrDest.isEmpty()) {%>
        
            <p>La institucion <%=nombreInstDestino%> no tiene carreras registradas. 
               Por favor agregue una carrera para esta institucion antes de continuar</p>
        
        <%} else {%>
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
                
               <br><br><br><br><br><br/><br/><br/><br/><br/>
                <center>
                    <html:hidden property="operacionTabla" value="Agregar" />
                                        
                    <html:submit 
                        styleClass   =   "button"
                        property     =   "submit"
                        value        =   "Agregar Tabla de Equivalencia"/>
                </center>
        <%}%>
    
        </html:form>       
    
    </body>
    
</html>
