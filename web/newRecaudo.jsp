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
    <body><center>
        <h1>Cargar un recaudo:</h1>
        
        <%RecaudoForm rf = (RecaudoForm) request.getAttribute("RecaudoForm");
            ArrayList<RecaudoForm> listaRecaudos = 
            ((ArrayList<RecaudoForm>) 
            request.getAttribute("listaRecaudos"));
            //la primera vez que entramos al jsp la lista de recaudos es nula
            if (listaRecaudos == null){
                 listaRecaudos = new ArrayList();    //seteamos como lista vacia
            }%>
        <p><%=rf.getCodigo_planilla()%></p>
        <html:form action="/gestionRecaudo" enctype="multipart/form-data" method="POST">
            <html:hidden property="codigo_planilla" value="<%=rf.getCodigo_planilla()%>"/>
            <html:select property="tipo_recaudo">
                <html:option value = "A"/>
                <html:option value = "B"/>
                <html:option value = "C"/>
                
            </html:select>
            
            <html:hidden property="operacionRecaudo" value="Agregar"/>
            <html:file  property="datos_recaudo"/>
            <html:submit property="submit" value ="Subir el recaudo"/>
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
                    
        
    </center></body>
</html>
