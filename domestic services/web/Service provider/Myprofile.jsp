<%--
    Document   : Myprofile
    Created on : 27 Apr, 2023, 6:15:22 PM
    Author     : crist
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My profile</title>
       

        <style>
    body {
        background-color: darkgrey; /* Change background color to dark grey */
        padding: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .phone-container {
        background-color: #fff;
        border-radius: 20px;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        padding: 40px;
        max-width: 400px;
        width: 100%;
    }

    .phone-container table {
        width: 100%;
    }

    .phone-container td:first-child {
        font-weight: bold;
        width: 40%;
        padding-right: 10px;
        text-align: right;
    }

    .phone-container img {
        display: block;
        margin: 0 auto;
        border-radius: 50%;
        max-width: 150px;
        height: auto;
        margin-bottom: 20px;
    }
</style>

    </head>
    <body>
        <div class="phone-container">
            <table>
                <%
                    String selPQry = "select * from tbl_serviceprovider where provider_id='" + session.getAttribute("Spid") + "'";
                    ResultSet rspService = con.selectCommand(selPQry);
                    rspService.next();
                %>
                <tr>
                    <td colspan="2" align="center"><img src="../Assets/Files/ServiceProvider/<%=rspService.getString("provider_photo")%>" width="150" height="150"></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><%=rspService.getString("provider_name")%></td>
                </tr>
                <tr>
                    <td>Contact</td>
                    <td><%=rspService.getString("provider_contact")%></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><%=rspService.getString("provider_email")%></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><%=rspService.getString("provider_address")%></td>
                </tr>
                <tr>
                    <td>Landmark</td>
                    <td><%=rspService.getString("provider_landmark")%></td>
                </tr>
                <tr>
                    <td>Gender</td>
                    <td><%=rspService.getString("provider_gender")%></td>
                </tr>
            </table>
        </div>

        
    </body>
</html>
