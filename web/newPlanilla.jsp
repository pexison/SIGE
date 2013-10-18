<%-- 
    Document   : newPlanilla
    Created on : 16/10/2013, 03:24:31 AM
    Author     : andreso
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<%@page import="java.util.* , modelo.* , frijoles.*" %>

<!DOCTYPE html>
<html>
    
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SIGE - Registro de Planilla</title>
    </head>
    
    <script type="text/javascript">
       <%-- Función para confirmar que todos los campos fueron llenados --%>
        function validarCampos() {
            var cedulaAsp    = document.forms["PlanillaForm"]["cedula_aspirante"].value;
            var codi_planilla = document.forms["PlanillaForm"]["codigo_planilla"].value;
            var edo_planilla = document.forms["PlanillaForm"]["estado_planilla"].value;
            var tipo_ingreso = document.forms["PlanillaForm"]["tipo_ingreso"].value;
            
            codi_planilla = codi_planilla.replace(/\s+/g,'');
            
            if (cedulaAsp == null || cedulaAsp == "") {
                alert("Por favor inserte su Cedula");
                return false;
            } else if (codi_planilla == null || codi_planilla == ""){
               alert("Por favor inserte el codigo de la planilla") 
               return false; 
            } else if (edo_planilla == null || edo_planilla == ""){
               alert("Por favor inserte el estado de la planilla") 
               return false; 
            } else if (tipo_ingreso == null || tipo_ingreso == ""){
               alert("Por favor inserte el tipo de ingreso") 
               return false; 
            } 
            
            return true;
        } 
        
         <%-- Función para confirmar que se desea continuar con la operacion --%>
        function confirmarAccion(){
            var confirmarM = confirm("¿Desea continuar?");
            return confirmarM;       
        } 
        
       <%-- Función para confirmar si se desea salir --%>
       function confirmarExit(){
           var confirmarE = confirm("¿Desea abandonar la Sesión?");
           return confirmarE;       
       }
       // -->
    </script>
    
    <body>
        <center><h1>Registro de la Planilla de Solicitud de Equivalencia</h1></center>
        
        <li><h2>Complemente debidamente la planilla con los datos solicitados.
        Al finalizar pulse el botón Aceptar.</h2></li>
        <center>
         
          <%PlanillaForm pf= (PlanillaForm) request.getAttribute("PlanillaForm");
             String cedula_aspirante  = pf.getCedula_aspirante();
            GestionAspirante ga = new GestionAspirante();
            AspiranteForm af = ga.obtenerAspiranteCedula(cedula_aspirante); %>  
          <html:form action="/gestionPlanilla" onsubmit="return validarCampos()" method="POST">
           
           <table>
               <tr>
                   
                   <%-- Muestra la cedula del aspirante. Solo lectura --%>
                    <td>Su cédula de Identidad:</td>
                        <td>
                            <html:text 
                                styleClass  =  "input" 
                                maxlength   =  "12" 
                                readonly    =  "TRUE"
                                property    =  "cedula_aspirante" 
                                value       =  "<%=cedula_aspirante%>"/>
                        </td>
               </tr>
               <html:hidden property="codigo_planilla" value="-1"/>

               <html:hidden 
                       property    =  "estado_planilla"
                       value       =  "Pendiente" />
  
               <tr>
                   <td> Institución de Origen: </td>
                   <td> <html:text 
                            styleClass  =  "input" 
                            maxlength   =  "100"
                            property    =  "nombre_institucion_origen"/></td>
               </tr>
               
               <tr>
                   <td> Carrera de Origen: </td>
                   <td> <html:text 
                            styleClass  =  "input" 
                            maxlength   =  "50"
                            property    =  "nombre_carrera_origen"/></td>
               </tr>
               
               <tr>
                   <td> Institución de Destino: </td>
                   <td> <html:text 
                            styleClass  =  "input" 
                            maxlength   =  "100"
                            property    =  "nombre_institucion_destino"/></td>
               </tr>
               
               <tr>
                   <td> Carrera de Destino: </td>
                   <td> <html:text 
                            styleClass  =  "input" 
                            maxlength   =  "50"
                            property    =  "nombre_carrera_destino"/></td>
               </tr>
               <tr>
                        <%-- Lista desplegable para el tipo de ingreso --%>
                        <td>Tipo de Ingreso:</td>
                         
                        <td><html:select styleClass="button" property="tipo_ingreso"> 
                            <html:option value="Graduado_Usb">Graduado Usb</html:option>
                            <html:option value="Ingreso">Ingreso</html:option>
                            <html:option value="Validacion">Validacion</html:option>
                        </html:select></td>
               </tr>
                <tr>
                        <td colspan="2">
                            <br/>
                            <%-- Botón para agregar la informacion de la planilla --%>
                            <html:submit 
                                styleClass  =  "button" 
                                property    =  "operacionPlanilla"
                                onclick     =  "return confirmarAccion()"
                                value       =  "Agregar"/>
                            &nbsp; &nbsp;
                            <%-- Botón para limpiar los campos --%>
                            <html:reset 
                                styleClass  =  "button" 
                                value       =  "Limpiar"/>
                        </td>
                </tr>
           </table>
           </html:form>
        </center>
    
        <li><h2>Volver:</h2></li>
        
         <html:form action="/gestionAspirante" method="POST">
            <html:hidden property="operacionAspirante" value="registrar_Aspirante" />
            <html:hidden property="id_usuario" value="<%=af.getId_usuario()%>" />
            <html:submit
                styleClass   =   "button"
                property     =   "submit" 
                value        =   "Volver al perfil del aspirante"/>                

        </html:form>
        
       <html:form action="/validar" method="POST">
            <html:hidden property="operacionValidar" value="retornar" />
            <html:hidden property="id_usuario" value="<%=af.getId_usuario()%>" />
            <html:submit
                styleClass   =   "button"
                property     =   "submit" 
                value        =   "Volver al Inicio"/>                

        </html:form>
        
        <%-- Enlace para salir del sistema --%>
        <html:link 
                 onclick    = "return confirmarExit()" 
                 forward    = "login"> Salir
        </html:link>
        
    </body>
    
</html>
