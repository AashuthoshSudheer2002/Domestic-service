<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("Urid") == null)
        {
            response.sendRedirect("../index.html");
        }
    %>