<%-- 
    Document   : newRecaudo
    Created on : Oct 17, 2013, 12:15:31 AM
    Author     : fertaku
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<%@page import="java.util.* , frijoles.*" %>
<!DOCTYPE html>
<html>
    <head>
         <link rel="stylesheet" type="text/css" href="style.css">
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>SIGE - Carga de Recaudos</title>
        
        
    </head>
    
    <script type="text/javascript">
        <%-- Función para confirmar si se desea salir --%>
        function esPdf(){
            if ((document.forms[0].datos_recaudo.value.toString().search(".pdf"))==-1){
               alert("Es necesario que el archivo tenga formato pdf");
               return false;
            } 
            return true;       
        }
        // -->
        </script>
    <body>
        <center><h1>Cargar un recaudo:</h1></center>
        
        <li><h2>Presione el boton finalizar para terminar con la carga
            de Recaudos</h2></li>
        <%RecaudoForm rf = (RecaudoForm) request.getAttribute("RecaudoForm");
            ArrayList<RecaudoForm> listaRecaudos = 
            ((ArrayList<RecaudoForm>) 
            request.getAttribute("listaRecaudos"));
            //la primera vez que entramos al jsp la lista de recaudos es nula
            if (listaRecaudos == null){
                 listaRecaudos = new ArrayList();    //seteamos como lista vacia
            }%>
        <p>Código de planilla: <%=rf.getCodigo_planilla()%></p>
        
        <html:form action="/gestionRecaudo" enctype="multipart/form-data" method="POST">
            <html:hidden property="codigo_planilla" value="<%=rf.getCodigo_planilla()%>"/>
            <html:select property="tipo_recaudo">
                <html:option value = "Diploma de Carrera Original"/>
                <html:option value = "Calificaciones"/>
                <html:option value = "Pensum de Estudios"/>
                
            </html:select>
            
            <html:hidden property="operacionRecaudo" value="Agregar"/>
            <html:file  property="datos_recaudo"/>
            <html:submit property="submit"
                         onclick = "return esPdf()" 
                         value ="Subir el recaudo"/>
        </html:form>
        
         <% if (!listaRecaudos.isEmpty()) { %>
               
                <h2>Archivos cargados:</h2>
                <%for (int i=0; i<listaRecaudos.size();i++) { 
       
                    String rutaArchivo=listaRecaudos.get(i).getRuta_datos_recaudo();
                    String[] results = rutaArchivo.split("/");
                    String nombreArchivo = results[results.length-1];%>
                    <li><td><%=nombreArchivo%></td><li>
                <%}%>
            
            <% } else { %>
                <li>No hay cargas realizadas. </li>
          <%}%>
                
        <li><h2>Presione el boton finalizar para terminar con la carga
            de Recaudos</h2></li>
        <%-- Enlace para salir del sistema --%>
        <html:form action="/gestionRecaudo" method="POST">
           
           <html:hidden property="operacionRecaudo" value="finalizar" />
           <html:hidden property="codigo_planilla" value="<%=rf.getCodigo_planilla()%>"/>
           <html:submit 
                    styleClass   =   "button"
                    property     =   "submit"
                    value        =   "Finalizar carga de Recaudos"/>
        </html:form>
        
        <html:link 
                 onclick    = "return confirmarExit()" 
                 forward    = "login"> Salir
        </html:link>
                 
    </center></body>
</html>
