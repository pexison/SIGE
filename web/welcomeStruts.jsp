<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="welcome.title"/></title>
        <html:base/>
    </head>
    <body style="background-color: white">
        
        <logic:notPresent name="org.apache.struts.action.MESSAGE" scope="application">
            <div  style="color: red">
                ERROR:  Application resources not loaded -- check servlet container
                logs for error messages.
            </div>
        </logic:notPresent>
        
        <p> Universidad: </p>
        <select name="Universidad">
            <option>Universidad Simon Bolivar</option>
            <option>Universidad Central de Venezuela</option>
            <option>Universidad Catolica Andres Bello</option>
            <option>Universidad Santa Maria</option>
            <option>Universidad de Los Andes</option>
        </select>
        
        <p> Carrera: </p>
        <select name="Carrera">
            <option>Ing. Computacion</option>
            <option>Ing. Electrica</option>
            <option>Ing. Quimica</option>
            <option>Ing. Materiales</option>
            <option>Ing. Electronica</option>
        </select>
        
    </body>
</html:html>
