<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("Spid") == null)
        {
            response.sendRedirect("../index.html");
        }
    %>