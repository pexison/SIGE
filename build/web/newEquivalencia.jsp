<%-- 
    Document   : newEquivalencia
    Created on : 29/09/2013, 02:37:23 AM
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

        <title>SEA - Registrar Equivalencia</title>
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
        
        
        <center>

            <h1>Registro de Equivalencias</h1>
        
        <html:form 
                onsubmit = "return validarCampos()"
                action   = "/gestionEquivalencia" 
                method   = "POST">
        <%TablaEquivalenciaForm teq = 
                ((TablaEquivalenciaForm)request.getAttribute("TablaEquivalenciaForm"));
        
          String codInstOrig  = teq.getCodigoCarreraOrigen();
          String codInstDest  = teq.getCodigoCarreraDestino();
          GestionInstitucion gestionInst = new GestionInstitucion();
          GestionAsignatura  gestionAsig = new GestionAsignatura();
        
          InstitucionForm instOrig = gestionInst.obtenerInstitucion(codInstOrig);
          InstitucionForm instDest = gestionInst.obtenerInstitucion(codInstDest);
          ArrayList<AsignaturaForm> listaAsigOrig = gestionAsig.listarAsignaturas(codInstOrig);
          ArrayList<AsignaturaForm> listaAsigDest = gestionAsig.listarAsignaturas(codInstDest);%>
        
        <table>
            <tr>    
                <%-- Campo para el código de la carrera --%>
                <td>Código de la Equivalencia:</td>        
                         <td>
                         <html:text 
                               styleClass  =  "input" 
                               maxlength   =  "12" 
                               styleId     =  "CodEquivalencia"
                               property    =  "codigoEquivalencia"/>
                         </td>
             </tr>
             
             <tr>
                 <td>Seleccione las materias de Origen a ser equivalidas:</td>  
                 
                  <html:select styleClass="button" property="asignaturasOrigen">

                    <% for (int i=0; i<listaAsigOrig.size();i++) { 
                    String nombreAsig=listaAsigOrig.get(i).getNombreAsignatura();
                    String codAsig = listaAsigOrig.get(i).getCodigoAsignatura();%>

                    <html:option value="<%=codAsig%>">
                            <%=codAsig%> - <%=nombreAsig%>
                    </html:option>

                    <%}%>
                </html:select>
                 
                 
                 
                 
                 
             </tr>

             <tr>
                 <td>Seleccione las materias de Destino a ser incluidas:</td> 
                 
                   <html:select styleClass="button" property="asignaturasDestino">

                    <% for (int i=0; i<listaAsigOrig.size();i++) { 
                    String nombreAsigDest=listaAsigDest.get(i).getNombreAsignatura();
                    String codAsigDest = listaAsigDest.get(i).getCodigoAsignatura();%>

                    <html:option value="<%=codAsigDest%>">
                            <%=codAsigDest%> - <%=nombreAsigDest%>
                    </html:option>

                    <%}%>
                </html:select>
                 
                 
             </tr>   
                 
                 
                 
                 
                 
        </html:form>
              
       </center>      
    </body>
    
    
</html>
