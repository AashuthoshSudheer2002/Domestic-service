<%--
    Document   : Place
    Created on : 30 Mar, 2023, 5:40:18 PM
    Author     : crist
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Place</title>
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
            text-align: left;
        }

        th {
            background-color: #333;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a {
            text-decoration: none;
            color: #0000FF;
        }

        a:hover {
            text-decoration: underline;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 300px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"],
        input[type="reset"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<a href="Homepage.jsp">Homepage</a>
<%
    if (request.getParameter("btnsubmit") != null) {
        if (request.getParameter("eid") != null) {
            String upQry = "update tbl_place set place_name='" + request.getParameter("place") + "' where district_id='" + request.getParameter("eid") + "'";
            if (con.executeCommand(upQry)) {

                %>
                <script>
                    alert("Data Updated");
                    window.location = "Place.jsp";
                </script>
                <%
            }


        } else {
            String ins = "insert into tbl_place (place_name,district_id,place_pincode)value('" + request.getParameter("place_name") + "','" + request.getParameter("district_name") + "','" + request.getParameter("pincode") + "')";
            if (con.executeCommand(ins)) {

                %>
                <script>
                    alert("Data inserted");
                    window.location = "Place.jsp";
                </script>
                <%
            } else {
                %>
                <script>
                    alert("Data not inserted");
                    window.location = "Place.jsp";
                </script>
                <%
            }
        }
    }
    if (request.getParameter("delID") != null) {
        String delQry = "delete from tbl_place where place_id='" + request.getParameter("delID") + "'";
        if (con.executeCommand(delQry)) {

            %>
            <script>
                alert("Data deleted");
                window.location = "Place.jsp";
            </script>
            <%
        } {
            %>
            <script>
                alert("Data not deleted");
                window.location = "Place.jsp";
            </script>
            <%
        }
    }


    String placedit = "";
    String pinedit = "";
    if (request.getParameter("eid") != null) {
        String selQryedit = "select * from tbl_place where place_id='" + request.getParameter("eid") + "'";
        ResultSet resedit = con.selectCommand(selQryedit);
        resedit.next();
        pinedit = resedit.getString("place_pincode");
        placedit = resedit.getString("place_name");
    }

    %>
<form method="post">
    <table border="3" align="center">

        <tr>
            <td><b>Place</b></td>
            <td><input type="text" size="32" name="place_name" placeholder="Enter place" required value="<%=placedit%>"></td>
        </tr>
        <tr>
            <td><b>Pincode</b></td>
            <td><input type="number" size="32" name="pincode" placeholder="Enter pincode" required value="<%=pinedit%>"></td>
        </tr>
        <tr>
            <th>District</th>
            <td>
                <select name="district_name">
                    <%
                        String selQry = "select * from tbl_district";
                        ResultSet rs = con.selectCommand(selQry);
                        while (rs.next()) {
                            %>
                            <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                            <%
                        }
                    %>
                </select>
            </td>
        </tr>
        <tr>
            <td colspan="5" align="center">
                <input type="submit" name="btnsubmit" value="Submit">
                <input type="reset" name="cancelbtn" value="Cancel">
            </td>
        </tr>
    </table>
    <br>
    <br>
    <table border="1" align="center">
        <tr>
            <th>SI.no</th>
            <th>Place Name</th>
            <th>Pincode</th>
            <th>District Name</th>
            <th>Action</th>
        </tr>
        <%
            int i = 0;
            String selPQry = "select * from tbl_place e inner join tbl_district d on e.district_id=d.district_id";
            ResultSet rsDis = con.selectCommand(selPQry);
            while (rsDis.next()) {
                i++;
        %>
        <tr>
            <td><%=i%></td>
            <td><%=rsDis.getString("place_name")%></td>
            <td><%=rsDis.getString("place_pincode")%></td>
            <td><%=rsDis.getString("district_name")%></td>
            <td>
                <a href="Place.jsp?delID=<%=rsDis.getString("place_id")%>">Delete</a>
                <a href="Place.jsp?eid=<%=rsDis.getString("place_id")%>">Edit</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>

</form>
</body>
</html>
