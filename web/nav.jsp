<%-- 
    Document   : nav
    Created on : 22/01/2026, 01:23:55 PM
    Author     : benny
--%>

<%
    // Esto quita el error en rojo porque define la variable miRol
    String miRol = (String) session.getAttribute("usuarioRol");
%>

<nav class="nav-escolar">
    <a href="inicio.jsp" class="nav-item btn-inicio">Inicio</a>
    <a href="consultar.jsp" class="nav-item btn-cerebro">El Cerebro</a>
    <a href="noticia.jsp" class="nav-item btn-noticias">Noticias</a>
    
    <%-- Esta parte solo sale si eres Maestro --%>
    <% if(session.getAttribute("usuarioRol") != null && session.getAttribute("usuarioRol").equals("Maestro")) { %>
        <a href="admin_noticias.jsp" class="nav-item btn-admin">Crear Anuncio</a>
    <% } %>

    <a href="perfil.jsp" class="nav-item btn-perfil">Mi Perfil</a>
    <a href="logout.jsp" class="nav-item btn-salir">Salir</a>
</nav>