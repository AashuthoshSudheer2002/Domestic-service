<%-- 
    Document   : Department
    Created on : 13 Apr, 2023, 1:56:05 PM
    Author     : crist
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Department</title>
        <style>
            table {
                width: 50%;
                margin: 0 auto;
                border-collapse: collapse;
                background-color: #f2f2f2;
            }
            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #4CAF50;
                color: white;
            }
            form {
                text-align: center;
                margin-top: 20px;
            }
            input[type="text"], input[type="submit"], input[type="reset"] {
                padding: 8px;
                border-radius: 4px;
                border: 1px solid #ccc;
            }
            input[type="submit"], input[type="reset"] {
                background-color: #4CAF50;
                color: white;
                cursor: pointer;
            }
            input[type="submit"]:hover, input[type="reset"]:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <% if (request.getParameter("btnsubmit") != null) {
            if (request.getParameter("eid") != null) {
                String upQry = "update tbl_department set dept_name='" + request.getParameter("deptname") + "' where dept_id='" + request.getParameter("eid") + "'";
                out.print(upQry);
                if (con.executeCommand(upQry)) {
        %>
        <script>
            alert("Data Updated");
            window.location = "Department.jsp";
        </script>
        <% }
                } else {
                    String ins = "insert into tbl_department (dept_name)values('" + request.getParameter("deptname") + "')";
                    if (con.executeCommand(ins)) {
        %>
        <script>
            alert("Data Inserted");
            window.location = "Department.jsp";
        </script>
        <% } else {
        %>
        <script>
            alert("Data not updated");
            window.location = "Department.jsp";
        </script>
        <% }
                }
            }

            if (request.getParameter("delID") != null) {
                String delQry = "delete from tbl_department where dept_id='" + request.getParameter("delID") + "'";
                if (con.executeCommand(delQry)) {
        %>
        <script>
            alert("Data deleted");
            window.location = "Department.jsp";
        </script>
        <%  } else {
        %>
        <script>
            alert("Data not deleted");
            window.location = "Department.jsp";
        </script>
        <% }
            }

            String deptedit = "";
            if (request.getParameter("eid") != null) {
                String selQryedit = "select * from tbl_department where dept_id='" + request.getParameter("eid") + "'";
                ResultSet rsedit = con.selectCommand(selQryedit);
                rsedit.next();
                deptedit = rsedit.getString("dept_name");
            }
        %>
        <form method="post">
            <table>
                <tr>
                    <th>Department</th>
                    <td>
                        <input type="text" name="deptname" placeholder="Enter the department" required value="<%=deptedit%>">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnsubmit" value="Save">
                        <input type="reset" name="btncancel" value="Cancel">
                    </td>
                </tr>
            </table>
            <br>
            <br>
            <table>
                <tr>
                    <th>Sl.no</th>
                    <th>Dept Name</th>
                    <th>Action</th>
                </tr>
                <% int i = 0;
                String selQry = "select * from tbl_department";
                ResultSet rsDis = con.selectCommand(selQry);
                while (rsDis.next()) {
                    i++;
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rsDis.getString("dept_name")%></td>
                    <td><a href="Department.jsp?delID=<%=rsDis.getString("dept_id")%>">Delete</a></td>
                    <td><a href="Department.jsp?eid=<%=rsDis.getString("dept_id")%>">Edit</a></td>
                </tr>
                <% }
                %>
            </table>
        </form>
    </body>
</html>
