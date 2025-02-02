<%-- 
    Document   : Login
    Created on : 26 Apr, 2023, 5:30:23 PM
    Author     : crist
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HappyHome::Login</title>
    </head>
    <body>+

        <%
            String msg = "";
            if (request.getParameter("btnLogin") != null) {

                String selAdmin = "select * from tbl_admin where admin_email='" + request.getParameter("txtemail") + "' and admin_password='" + request.getParameter("txtpassword") + "'";
                ResultSet rsAdmin = con.selectCommand(selAdmin);
               
                
                String selService = "select * from tbl_serviceprovider where provider_email='" + request.getParameter("txtemail") + "' and provider_password='" + request.getParameter("txtpassword") + "' and provider_vstatus=1";
                ResultSet rspProvider = con.selectCommand(selService);
               
                
                String selUser = "select * from tbl_user where user_email='" + request.getParameter("txtemail") + "' and user_password='" + request.getParameter("txtpassword") + "'";
               // out.print(selUser);
                ResultSet rsuUser = con.selectCommand(selUser);
                
                 if (rsAdmin.next()) {
                    session.setAttribute("lgname", rsAdmin.getString("admin_name"));
                    session.setAttribute("lgid", rsAdmin.getString("admin_id"));
                   response.sendRedirect("../Admin/Homepage.jsp");
                } 
                else  if (rspProvider.next()) {
                    session.setAttribute("Spname", rspProvider.getString("provider_name"));
                    session.setAttribute("Spid", rspProvider.getString("provider_id"));
                    response.sendRedirect("../Service provider/Homepage.jsp");
                } 
               else if (rsuUser.next()) {
                    session.setAttribute("Urname", rsuUser.getString("user_name"));
                   
                    session.setAttribute("Urid", rsuUser.getString("user_id"));
                   response.sendRedirect("../User/Homepage.jsp");
                } 
                else {
                    msg = "Invalid Login!!!";
                }
               
            }
             
        %>


        <form name="frmLogin" method="post">
            <table align="center">
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="txtemail" required=""></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" name="txtpassword" required=""></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input  type="submit" name="btnLogin" value="Login">
                        <input  type="reset" name="btnCancel" value="Cancel">

                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><%=msg%></td>
                </tr>
            </table>
        </form>
    </body>
</html>