<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>HomePage</title>
    <style>
        /* CSS styles */
        body {
            font-family: "Times New Roman", Times, serif;
            margin: 0;
            padding: 20px;
            background-color: #f2f2f2;
        }

        p {
            font-size: 18px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #ffffff;
            border: 1px solid #dddddd;
        }

        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #dddddd;
        }

        th {
            background-color: #007bff;
            color: #ffffff;
        }

        td:nth-child(even) {
            background-color: #f8f8f8;
        }

        td:nth-child(odd) {
            background-color: #ffffff;
        }

        .link-button {
            display: inline-block;
            padding: 6px 12px;
            font-size: 16px;
            font-weight: 600;
            text-align: center;
            text-decoration: none;
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .link-button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <p>Welcome!</p>
    <%=session.getAttribute("lgname")%>
    <br><br>
    <table>
        <thead>
            <tr>
                <th colspan="4">Navigation</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><a href="District.jsp" class="link-button">District</a></td>
                <td><a href="Category.jsp" class="link-button">Category</a></td>
                <td><a href="Designation.jsp" class="link-button">Designation</a></td>
                <td><a href="Department.jsp" class="link-button">Department</a></td>
            </tr>
            <tr>
                <td><a href="Employee.jsp" class="link-button">Employee</a></td>
                <td><a href="Place.jsp" class="link-button">Place</a></td>
                <td><a href="Service type.jsp" class="link-button">Service_Type</a></td>
                <td><a href="Subcategory.jsp" class="link-button">SubCategory</a></td>
            </tr>
            <tr>
                <td><a href="ProviderAccept.jsp" class="link-button">ProviderAccept</a></td>
                <td><a href="ProviderReject.jsp" class="link-button">ProviderReject</a></td>
                <td><a href="ViewUserComplaint.jsp" class="link-button">View User Complaint</a></td>
                <td><a href="Providerverification.jsp" class="link-button">Providerverification</a></td>
            </tr>
        </tbody>
    </table>
</body>
</html>
