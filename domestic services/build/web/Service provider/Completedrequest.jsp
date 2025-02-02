<%-- 
    Document   : Compledrequest
    Created on : 19 May, 2023, 11:14:19 AM
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
          
        
        <table border="1" align="center">
            <br><br><bR>
            <tr>
                <th>SI.no</th>
                <th>Username</th>
                 <th>Contact</th>
                 <th>Address</th>
                <th>ForDate</th>
                <th>BookedDate</th>
                <th>Details</th>
                <th>Status</th>
                
            </tr>    
            <%
                int i=0;
                String selPQry="select * from tbl_servicebooking e inner join tbl_user u on u.user_id=e.user_id inner join tbl_serviceprovider p on p.provider_id=e.provider_id inner join tbl_servicetype st on st.servicetype_id=p.servicetype_id  where e.provider_id='"+session.getAttribute("Spid")+"'AND booking_status=3";
               // out.print(selPQry);
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
                   <td><% 
                        
                         if (rspService.getString("booking_status").equals("3")&& rspService.getString("booking_paymentstatus").equals("1")&&rspService.getString("payment_mode").equals("Card"))
                         {
                             out.print("Paid");
                         }
                         else if (rspService.getString("booking_status").equals("3")&& rspService.getString("booking_paymentstatus").equals("0")&&rspService.getString("payment_mode").equals("Cash"))
                         {
                             out.print("Cash Mode");
                             %>
                             <a href="PaymentUpdation.jsp?pid=<%=rspService.getString("booking_id")%>&&eid=<%=rspService.getString("user_email")%>&&pname=<%=rspService.getString("user_name")%>">Payment Complete</a>
                             <%
                         }else if (rspService.getString("booking_status").equals("3")&& rspService.getString("booking_paymentstatus").equals("1")&&rspService.getString("payment_mode").equals("Cash"))
                         {
                             out.print("Cash Paid Rs." + rspService.getString("payment_amount"));
                             
                         }
                         
                         else{
                             out.print("Work Completed");
                         }
                        
                         
                         %></td>
                     
                           
                        
                           
                      
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