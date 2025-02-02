<%-- 
    Document   : Servicebooking
    Created on : 18 May, 2023, 12:05:16 PM
    Author     : crist
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Header.jsp" %>
    </head>
    <body>
        <div id="tab" align="center">
        <form method="post">
        <table border="3" align="center">
            <% 
             if(request.getParameter("accept")!=null)
             {
                   String ins="insert into tbl_servicebooking(booking_fordate,booking_details,user_id,provider_id,booking_date)value('"+request.getParameter("date")+"','"+request.getParameter("detail")+"','"+session.getAttribute("Urid")+"','"+request.getParameter("eid")+"',curdate())";
                   
                 if(con.executeCommand(ins))
             {  
                
                 %>
                 <script>
                     alert("Data inserted");
                     window.location="Servicebooking.jsp";
                 </script>
                 <%
             }
             else
             {
                  %>
                 <script>
                     alert("Data not inserted");
                     window.location="Servicebooking.jsp";
                 </script>
                 <%
             }
                
            
             }
                          %>

            <tr>
                <td>Date</td>
                <td><input type="date"  name="date"></td>
            </tr>
            <tr>
                <td>Details</td>
                <td><textarea name="detail" row="10" cols="20" ></textarea></td>
                   
                   
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="accept" value="Submit">
                    <input type="reset" name="reject" value="Cancel">
            
                         
                </td>
            </tr>
        </table>
        </form>
                          </div>
    </body>
</html>
 <%@include file="Footer.jsp" %>