<%--
    Document   : provider_verification
    Created on : 8 May, 2023, 2:41:52 PM
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

        a {
            color: #0066cc;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
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

        img {
            max-width: 100px;
            max-height: 100px;
        }

        .action-links {
            display: flex;
            justify-content: space-between;
        }

        .action-links a {
            margin-right: 10px;
        }
    </style>
</head>
<body>
<%
    if(request.getParameter("aid")!=null)
    {
        String up="update tbl_serviceprovider set provider_vstatus=1 where provider_id='"+request.getParameter("aid")+"'";

        boolean status = con.executeCommand(up);
        if (status == true) {

            DB.mailconnection m = new DB.mailconnection();
            String mailid[] = {request.getParameter("eid")};
            String name = request.getParameter("pname");
            String subject = "Verification Successful";

            String text = "Respected " + name + "  \r\n \r\n"
                    + " This is from admin Dash, thank you for signing up to our site. \r\n"
                    + " We are happy to inform you that your registration has been successfully verified. \r\n"
                    + " Now you can log in to the provider with your email and password.\r\n"
                    + " All the best. \r\n \r\n"
                    + " Team vServ.";
            boolean b = m.sendMail(mailid, subject, text);
            System.out.println(b);

            response.sendRedirect("Providerverification.jsp");

        }
    }
%>
<%
    if(request.getParameter("rid")!=null)
    {
        String up1="update tbl_serviceprovider set provider_vstatus=2 where provider_id='"+request.getParameter("rid")+"'";
        con.executeCommand(up1);
        boolean status = con.executeCommand(up1);
        if (status == true) {

            DB.mailconnection m = new DB.mailconnection();
            String mailid[] = {request.getParameter("eid")};
            String name = request.getParameter("pname");

            String subject = "Verification Failed";

            String text = "Respected " + name + "  \r\n \r\n"
                    + " This is from admin Dash, thank you for signing up to our site. \r\n"
                    + " We are sorry to inform you that your registration is not perfect. \r\n"
                    + " All the best. \r\n \r\n"
                    + " Team vServ.";
            boolean b = m.sendMail(mailid, subject, text);
            System.out.println(b);

            response.sendRedirect("Providerverification.jsp");

        }
    }
%>
<a href="Homepage.jsp">Homepage</a>

<table border="1" align="center">
    <tr>
        <th>SI.no</th>
        <th>provider_name</th>
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
        int i=0;
        String selPQry="select * from tbl_serviceprovider e inner join tbl_place d on d.place_id=e.place_id  inner join tbl_district f on f.district_id=d.district_id where provider_vstatus=0";
        ResultSet rspService=con.selectCommand(selPQry);
        while(rspService.next())
        {
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
        <td><a href="../Assets/Files/ServiceProvider/<%=rspService.getString("provider_proof")%>" download>Download</a></td>
        <td><%=rspService.getString("provider_idproof")%></td>
        <td><%=rspService.getString("provider_gender")%></td>
        <td><%=rspService.getString("provider_landmark")%></td>
        <td><%=rspService.getString("district_name")%></td>
        <td><%=rspService.getString("place_name")%></td>
        <td>
            <form method="post" action="Providerverification.jsp">
                <input type="hidden" name="aid" value="<%=rspService.getString("provider_id")%>">
                <input type="hidden" name="eid" value="<%=rspService.getString("provider_email")%>">
                <input type="hidden" name="pname" value="<%=rspService.getString("provider_name")%>">
                <button type="submit" name="accept" class="accept-button">Accept</button>
            </form>
            <form method="post" action="Providerverification.jsp">
                <input type="hidden" name="rid" value="<%=rspService.getString("provider_id")%>">
                <input type="hidden" name="eid" value="<%=rspService.getString("provider_email")%>">
                <input type="hidden" name="pname" value="<%=rspService.getString("provider_name")%>">
                <button type="submit" name="reject" class="reject-button">Reject</button>
            </form>
        </td>
    </tr>
    <%
        }
    %>
</table>

</body>
</html>
