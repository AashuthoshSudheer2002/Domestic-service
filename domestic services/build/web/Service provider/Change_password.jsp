<%-- 
    Document   : Change_password
    Created on : 27 Apr, 2023, 6:15:48 PM
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
         <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 400px;
            margin: 50px auto;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .container h2 {
            text-align: center;
            margin-top: 0;
        }

        .container form {
            margin-top: 20px;
        }

        .container table {
            width: 100%;
        }

        .container th {
            text-align: left;
            padding: 10px 0;
        }

        .container td {
            padding: 10px 0;
        }

        .container input[type="text"] {
            width: 100%;
            padding: 5px;
        }

        .container input[type="submit"] {
            padding: 10px 20px;
            background-color: #4caf50;
            border: none;
            color: #fff;
            cursor: pointer;
        }

        .container input[type="submit"]:hover {
            background-color: #45a049;
        }

        .container a {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #333;
            text-decoration: none;
        }
    </style>
    </head>
    <body>
        <div id="tab" align="center">
        <%
            if(request.getParameter("btnupdate")!=null)
            {
                String sel="select * from tbl_serviceprovider where provider_id='" +session.getAttribute("Spid")+"' AND provider_password='"+request.getParameter("txtname")+"'";
                ResultSet rs=con.selectCommand(sel);
                if(rs.next())
                    
                {
                    if(request.getParameter("txtnew").equals(request.getParameter("txtre")))
                    {
                        String Update="update tbl_serviceprovider set provider_password='" +request.getParameter("txtnew")+ "' where provider_id='" +session.getAttribute("Spid")+ "'";
                        con.executeCommand(Update);
                        response.sendRedirect("Homepage.jsp");
                    }
                }
            }
            %>
            
        <a href="Homepage.jsp">Homepage</a>
         <form method="post" >
            <table border="2" align="center">
                <br>
                <br>
                <tr>
                    <th>Current Password</th>

                    <td><input type="text" name="txtname" placeholder="enter type" value=""></td>							

                </tr>
                <tr>
                    <th>New Password</th>

                    <td><input type="text" name="txtnew" placeholder="enter type" value=""></td>							

                </tr>
                <tr>
                    <th>Confirm new Password</th>

                    <td><input type="text" name="txtre" placeholder="enter type" value=""></td>							

                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnupdate" value="update" >
                    </td>
                </tr>

              

            </table>

       

            
    </form>
        </div>
    </body>
</html>
<%@include file="Footer.jsp" %>
