<%-- 
    Document   : ViewUserComplaint
    Created on : 19 May, 2023, 3:12:39 PM
    Author     : crist
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Complaints</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
        }

        h1 {
            text-align: center;
            color: #0066cc;
            margin-bottom: 20px;
        }

        .back-link {
            display: block;
            margin-bottom: 20px;
            text-align: center;
            color: #0066cc;
            text-decoration: none;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-spacing: 0;
        }

        th, td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        a {
            color: #0066cc;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
    </head>
    <body>
         <a href="Homepage.jsp">Homepage</a>
      <table border="1" align="center">
            <tr>
                <th>SNo</th>
                <th>Title</th>
                <th>Complaint</th>
                <th>Date</th>
                <th>Username</th>
                <th>Reply</th>
                <th>Action</th>
                
            </tr>    
            <%
                int i=0;
                String selPQry="select * from tbl_complaint c inner join tbl_user u on u.user_id=c.user_id  where c.user_id='"+session.getAttribute("Urid")+"'";
                ResultSet rspService=con.selectCommand(selPQry);
                while(rspService.next())
                {
                    i++;
                  %>
                  <tr>
                      <td><%=i%></td>
                      <td><%=rspService.getString("complaint_title")%></td>
                      <td><%=rspService.getString("complaint_content")%></td>
                      <td><%=rspService.getString("complaint_date")%></td>
                      <td><%=rspService.getString("user_name")%></td>
                      <td><%=rspService.getString("complaint_reply")%></td>
                      <td><a href="Reply.jsp?delID=<%=rspService.getString("complaint_id")%>">Reply</a>
                      
                  </tr>
                  <%
                }
                %>
        </table>
    </body>
</html>