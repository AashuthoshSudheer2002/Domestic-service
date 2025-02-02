<%-- 
    Document   : ProviderAccept
    Created on : 9 May, 2023, 11:41:43 AM
    Author     : crist
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Providerverification</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }

            table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                padding: 8px;
                border: 1px solid #ccc;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
            }

            img {
                max-width: 100px;
                max-height: 100px;
            }

            .btn {
                display: inline-block;
                padding: 6px 12px;
                margin-bottom: 0;
                font-size: 14px;
                font-weight: 400;
                line-height: 1.42857143;
                text-align: center;
                white-space: nowrap;
                vertical-align: middle;
                cursor: pointer;
                border: 1px solid transparent;
                border-radius: 4px;
                color: #fff;
                background-color: #337ab7;
                border-color: #2e6da4;
            }

            .btn:hover {
                color: #fff;
                background-color: #286090;
                border-color: #204d74;
            }

            .btn-primary {
                color: #fff;
                background-color: #337ab7;
                border-color: #2e6da4;
            }

            .btn-primary:hover {
                color: #fff;
                background-color: #286090;
                border-color: #204d74;
            }
        </style>
    </head>
    <body>
        <%
        if (request.getParameter("aid") != null) {
            String up = "update tbl_serviceprovider set provider_vstatus=1 where provider_id='" + request.getParameter("aid") + "'";
            con.executeCommand(up);
            response.sendRedirect("ProviderReject.jsp");

        }
        %>
        <a href="Homepage.jsp">Homepage</a>

        <table border="1" align="center">
            <tr>
                <th>SI.no</th>
                <th>Provider_name</th>
                <th>provider_email</th>
                <th>provider_contact</th>
                <th>provider_address</th>
                <th>provider_photo</th>
                <th>provider_qulifications</th>
                <th>provider_proof</th>
                <th>provider_idproof</th>
                <th>provider_gender</th>
                <th>provider_landmark</th>
                <th>district_name</th>
                <th>place_name</th>
                <th>Action</th>
            </tr>
            <%
            int i = 0;
            String selPQry = "select * from tbl_serviceprovider e inner join tbl_place d on d.place_id=e.place_id  inner join tbl_district f on f.district_id=d.district_id where provider_vstatus=2";
            ResultSet rspService = con.selectCommand(selPQry);
            while (rspService.next()) {
                i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rspService.getString("provider_name")%></td>
                    <td><%=rspService.getString("provider_email")%></td>
                    <td><%=rspService.getString("provider_contact")%></td>
                    <td><%=rspService.getString("provider_address")%></td>
                    <td><img src="../Assets/Files/ServiceProvider/<%=rspService.getString("provider_photo")%>" width="100" height="100"></td>
                    <td><%=rspService.getString("provider_qulifications")%></td>
                    <td><a href="../Assets/Files/ServiceProvider/<%=rspService.getString("provider_proof")%>" download class="btn btn-primary">Download</a></td>
                    <td><%=rspService.getString("provider_idproof")%></td>
                    <td><%=rspService.getString("provider_gender")%></td>
                    <td><%=rspService.getString("provider_landmark")%></td>
                    <td><%=rspService.getString("district_name")%></td>
                    <td><%=rspService.getString("place_name")%></td>
                    <td>
                        <a href="ProviderReject.jsp?aid=<%=rspService.getString("provider_id")%>" class="btn btn-primary">Accept</a>
                    </td>
                </tr>
                <%
            }
            %>
        </table>
    </body>
</html>
