<%-- 
    Document   : Complaint
    Created on : 19 May, 2023, 12:36:21 PM
    Author     : crist
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Complaints</title>
    <%@include file="Header.jsp" %>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 40px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        h1 {
            text-align: center;
            margin-bottom: 30px;
            text-decoration: underline;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        th, td {
            padding: 10px;
            text-align: left;
        }
        
        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        
        textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 3px;
            resize: vertical;
        }
        
        input[type="text"],
        input[type="submit"],
        input[type="reset"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        
        input[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            cursor: pointer;
        }
        
        input[type="reset"] {
            background-color: #ccc;
            color: #333;
            cursor: pointer;
        }
        
        .message {
            text-align: center;
            margin-top: 20px;
            color: #333;
        }
        
        .message a {
            color: #333;
            text-decoration: none;
        }
        
        .message a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    
    <div class="container">
        <h1>Customer Complaint Page</h1>
        <form method="post">
            <table>
                <% 
                if(request.getParameter("accept") != null) {
                    String ins = "insert into tbl_complaint(complaint_title,complaint_content,complaint_date,user_id)value('"+request.getParameter("title")+"','"+request.getParameter("details")+"',curdate(),'"+session.getAttribute("Urid")+"')";
                    if(con.executeCommand(ins)) {
                        %>
                        <div class="message">
                            <p>Complaint Submitted</p>
                        </div>
                        <%
                    }
                }
                if(request.getParameter("delID") != null) {
                    String delQry = "delete from tbl_complaint where complaint_id='"+request.getParameter("delID")+"'";
                    if(con.executeCommand(delQry)) {
                        %>
                        <div class="message">
                            <p>Data deleted</p>
                        </div>
                        <%
                    } else {
                        %>
                        <div class="message">
                            <p>Data not deleted</p>
                        </div>
                        <%
                    }
                }
                %>
                <tr>
                    <th>Title</th>
                    <td><input type="text" name="title"></td>
                </tr>
                <tr>
                    <th>Complaint Details</th>
                    <td><textarea name="details" rows="5" cols="20"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" name="accept" value="Submit">
                        <input type="reset" name="reject" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
        <table>
            <tr>
                <th>SNo</th>
                <th>Title</th>
                <th>Complaint</th>
                <th>Date</th>
                <th>Reply</th>
                <th>Action</th>
            </tr>    
            <% 
            int i = 0;
            String selPQry = "select * from tbl_complaint where user_id='"+session.getAttribute("Urid")+"'";
            ResultSet rspService = con.selectCommand(selPQry);
            while(rspService.next()) {
                i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rspService.getString("complaint_title")%></td>
                    <td><%=rspService.getString("complaint_content")%></td>
                    <td><%=rspService.getString("complaint_date")%></td>
                    <td><%=rspService.getString("complaint_reply")%></td>
                    <td><a href="Complaint.jsp?delID=<%=rspService.getString("complaint_id")%>">Delete</a></td>
                </tr>
                <%
            }
            %>
        </table>
       
    </div>
</body>
</html>

