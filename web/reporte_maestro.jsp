<%-- 
    Document   : reporte_maestro
    Created on : 22/01/2026, 02:20:26 PM
    Author     : benny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="conexion.jsp" %>
<%
    // Verificación de seguridad: solo el Maestro puede ver el reporte
    String rol = (String) session.getAttribute("usuarioRol");
    if (rol == null || !rol.equals("Maestro")) {
        response.sendRedirect("inicio.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reporte de Eco-Héroes - Eco-Brain</title>
    <link rel="stylesheet" type="text/css" href="css/estilos.css">
    <style>
        table { width: 100%; border-collapse: collapse; margin-top: 20px; background: white; }
        th, td { padding: 12px; border: 1px solid #ddd; text-align: left; }
        th { background-color: #22c55e; color: white; }
        tr:nth-child(even) { background-color: #f2f2f2; }
        .puntos-badge { background: #dcfce7; color: #16a34a; padding: 5px 10px; border-radius: 15px; font-weight: bold; }
    </style>
</head>
<body>
    <%@include file="nav.jsp" %>
    
    <div class="contenedor-principal">
        <h1>📊 Seguimiento de Reciclaje</h1>
        <p>Lista de alumnos y sus puntos acumulados por usar "El Cerebro":</p>

        <table>
            <thead>
                <tr>
                    <th>Nombre del Alumno</th>
                    <th>Correo</th>
                    <th>Puntos Totales</th>
                    <th>Nivel Actual</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        // Consultamos solo a los Alumnos ordenados por puntos
                        String sql = "SELECT nombre, correo, puntos FROM `usuario` WHERE rol='Alumno' ORDER BY puntos DESC";
                        Statement st = conexion.createStatement();
                        ResultSet rs = st.executeQuery(sql);

                        int contador = 0;
                        while(rs.next()){
                            contador++;
                            int pts = rs.getInt("puntos");
                %>
                <tr>
                    <td><%= rs.getString("nombre") %></td>
                    <td><%= rs.getString("correo") %></td>
                    <td><span class="puntos-badge"><%= pts %> pts</span></td>
                    <td><%= (pts >= 100) ? "⭐ Eco-Maestro" : "🌱 Recluta Verde" %></td>
                </tr>
                <%
                        }
                        if(contador == 0) {
                            out.print("<tr><td colspan='4'>Aún no hay alumnos registrados.</td></tr>");
                        }
                    } catch(Exception e) {
                        out.print("Error al cargar el reporte: " + e.getMessage());
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
