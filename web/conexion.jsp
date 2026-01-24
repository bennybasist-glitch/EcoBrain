<%-- 
    Document   : Conexion
    Created on : 21/01/2026, 09:11:07 PM
    Author     : benny
--%>

<%@page import="java.sql.*" %>
<%
    Connection conexion = null;
    try {
        // Usamos el nombre del driver para la versión 5.1.23 que tienes
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/db_ecobrain",
            "root",
            ""
        );
    } catch (Exception e) {
        out.print("Error de conexión: " + e.getMessage());
    }
%>