<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%
    
    String upQry = "update tbl_serviceprovider set provider_latitude='"+request.getParameter("latitude") +"',provider_longitude='"+request.getParameter("longitude") +"' where provider_id='"+session.getAttribute("Spid") +"'";
    if(con.executeCommand(upQry))
    {out.println("Updated");
    
    }
    else
    {
        out.println("Failed");
    }
%>