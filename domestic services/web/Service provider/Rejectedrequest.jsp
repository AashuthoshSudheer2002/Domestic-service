<%-- 
    Document   : RejectedBooking
    Created on : 19 May, 2023, 10:23:17 AM
    Author     : crist
--%>


<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Request</title>
        <%@include file="Header.jsp" %>
    </head>
    <body>
        <div id="tab" align="center">
         <a href="Homepage.jsp">Homepage</a>
          <%
      if(request.getParameter("rid")!=null)
        {
            String up="update tbl_servicebooking set booking_status=1 where booking_id='"+request.getParameter("rid")+"'";
            con.executeCommand(up);
            response.sendRedirect("Rejectedrequest.jsp");
        }
        /*if(request.getParameter("rid")!=null)
        {
            String up1="update tbl_servicebooking set booking_status=2 where user_id='"+request.getParameter("rid")+"'";
            con.executeCommand(up1);
            response.sendRedirect("Acceptedrequests.jsp");
        }*/
        %>
        
        <table border="1" align="center">
            <tr>
                <th>SI.no</th>
                <th>Username</th>
                 <th>Contact</th>
                 <th>Address</th>
                <th>ForDate</th>
                <th>BookedDate</th>
                <th>Details</th>
                <th>Action</th>
                
            </tr>    
            <%
                int i=0;
                String selPQry="select * from tbl_servicebooking e inner join tbl_user u on u.user_id=e.user_id inner join tbl_serviceprovider p on p.provider_id=e.provider_id inner join tbl_servicetype st on st.servicetype_id=p.servicetype_id  where e.provider_id='"+session.getAttribute("Spid")+"'AND booking_status=2";
                ResultSet rspService=con.selectCommand(selPQry);
                while(rspService.next())
                {
                    i++;
                  %>
                  <tr>
                      <td><%=i%></td>
                    <td><%=rspService.getString("user_name")%></td>
                      <td><%=rspService.getString("user_contact")%></td>
                        <td><%=rspService.getString("user_address")%></td>
                        <td><%=rspService.getString("booking_fordate")%></td>
                        <td><%=rspService.getString("booking_date")%></td>
                      <td><%=rspService.getString("booking_details")%></td>
                   
                      <td> <a href="Rejectedrequest.jsp?rid=<%=rspService.getString("booking_id")%>">Accept</a></td>
                     
                        
                           
                      
                  </tr>
                  <%
                }
                %>
        </table>
             
        </form>
        </div>
    </body>
</html>
<%@include file="Footer.jsp" %>
