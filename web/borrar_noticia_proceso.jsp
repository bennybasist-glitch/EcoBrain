<%-- 
    Document   : borrar_noticia_proceso
    Created on : 23/01/2026, 02:31:05 PM
    Author     : benny
--%>

<%@page import="java.sql.*"%>
<%@include file="conexion.jsp" %>
<%
    String id = request.getParameter("id");
    if(id != null) {
        try {
            // Operación DELETE filtrada por el ID de la noticia
            String sql = "DELETE FROM noticia WHERE id_noticia = ?";
            PreparedStatement ps = conexion.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
            
            // Regresamos al muro de noticias con éxito
            response.sendRedirect("noticia.jsp");
        } catch(Exception e) {
            out.print("Error al eliminar: " + e.getMessage());
        }
    }
%>