<%-- 
    Document   : Change_password
    Created on : 4 May, 2023, 12:01:39 PM
    Author     : crist
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
       
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            
            #container {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                height: 100vh;
            }
            
            .form-wrapper {
                max-width: 400px;
                padding: 20px;
                border: 2px solid #ccc;
                border-radius: 5px;
                background-color: #f9f9f9;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            
            h1 {
                text-align: center;
                margin-bottom: 20px;
            }
            
            .form-group {
                margin-bottom: 10px;
            }
            
            label {
                display: block;
                font-weight: bold;
                margin-bottom: 5px;
            }
            
            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 3px;
            }
            
            input[type="submit"] {
                width: 100%;
                padding: 8px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 3px;
                cursor: pointer;
            }
            
            .message {
                text-align: center;
                margin-top: 10px;
                color: #333;
            }
            
            a {
                display: block;
                text-align: center;
                margin-top: 20px;
                color: #333;
                text-decoration: none;
            }
            
            a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <%@include file="Header.jsp" %>
        <div id="container">
            <div class="form-wrapper">
                <h1>Change Password</h1>
                <form method="post">
                    <div class="form-group">
                        <label for="txtname">Current Password</label>
                        <input type="password" id="txtname" name="txtname" placeholder="Enter current password">
                    </div>
                    <div class="form-group">
                        <label for="txtnew">New Password</label>
                        <input type="password" id="txtnew" name="txtnew" placeholder="Enter new password">
                    </div>
                    <div class="form-group">
                        <label for="txtre">Confirm New Password</label>
                        <input type="password" id="txtre" name="txtre" placeholder="Confirm new password">
                    </div>
                    <input type="submit" name="btnupdate" value="Update">
                </form>
                <div class="message">
                    <%
                    if(request.getParameter("btnupdate")!=null)
                    {
                        String sel="select * from tbl_user where user_id='" +session.getAttribute("Urid")+"' AND user_password='"+request.getParameter("txtname")+"'";
                        ResultSet rs=con.selectCommand(sel);
                        if(rs.next())

                        {
                            if(request.getParameter("txtnew").equals(request.getParameter("txtre")))
                            {
                                String Update="update tbl_user set user_password='" +request.getParameter("txtnew")+ "' where user_id='" +session.getAttribute("Urid")+ "'";
                                con.executeCommand(Update);
                                response.sendRedirect("Homepage.jsp");
                            }
                        }
                    }
                    %>
                </div>
            </div>
            <a href="Homepage.jsp">Homepage</a>
        </div>
    </body>
</html>
<%@include file="Footer.jsp" %>
