<%-- 
    Document   : Viewmoreservice
    Created on : 18 May, 2023, 12:04:51 PM
    Author     : crist
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>More Page</title>
        <%@include file="Header.jsp" %>
    </head>
    <body>
        <div id="tab" align="center">
        <table border="3" align="center">
            
             <%
                 String detail="",rate="",edid="";
            String sel="select * from tbl_servicedetails e inner join tbl_serviceprovider t on t.provider_id=e.provider_id inner join tbl_servicetype st on st.servicetype_id=t.servicetype_id where e.provider_id='"+request.getParameter("eid")+"'";
            ResultSet rss=con.selectCommand(sel);
           if(rss.next())
            {
              
        %>
            <tr>
                <td>Servicetype</td>
                <td><%=rss.getString("servicetype_type")%></td>
                  
            </tr>
            <tr>
                <td>Details</td>
                <td><%=rss.getString("Sdetails_content")%></td>
            </tr>
            <tr>
                <td>Basic Rate</td>
                <td><%=rss.getString("Sdetails_rate")%></td>
            </tr>
            <td><a href="Servicebooking.jsp?eid=<%=rss.getString("provider_id")%>">Request</a></td>
            <td>  <a href="ViewLocation.jsp?lat=<%=rss.getString("provider_latitude")%>&lon=<%=rss.getString("provider_longitude")%>">View Location</a></td>
        <%
            }
        %>
         </table>
         </div>
    </body>
</html>
 <%@include file="Footer.jsp" %>