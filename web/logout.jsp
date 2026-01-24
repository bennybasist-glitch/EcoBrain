<%-- 
    Document   : logout
    Created on : 22/01/2026, 01:21:16 PM
    Author     : benny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    HttpSession sesion = request.getSession();
    sesion.invalidate(); // Elimina los datos de la sesión
    response.sendRedirect("login.jsp"); // Regresa al inicio
%>