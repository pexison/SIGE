<%--
    Created on : May 28, 2013, 3:38:52 PM
    Author     : acs
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success</title>
    </head>
    <body>
        <h1>Se ha registrado satisfactoriamente</h1>

        <%-- Enlace para ir a la página principal --%>
        <html:link forward="login">Home</html:link>
    </body>
</html>
