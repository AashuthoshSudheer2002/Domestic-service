<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("lgid") == null)
        {
            response.sendRedirect("../index.html");
        }
    %>