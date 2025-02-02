<%-- 
    Document   : subcategory
    Created on : Apr 3, 2023, 6:07:34 PM
    Author     : Crist
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subcategory</title>
    </head>
    <body>
        <a href="Homepage.jsp">Homepage</a>
        <%
            if (request.getParameter("Accept") != null) {
                String ins = "insert into tbl_subcategory(subcategory_name,category_id)value('" + request.getParameter("txtsubcatname") + "','" + request.getParameter("ddlcategory") + "')";
                if (con.executeCommand(ins)) {

        %>
        <script>
            alert("Data inserted");
            window.location = "Subcategory.jsp";
        </script>
        <%                         }
            }

            if (request.getParameter("delID") != null) {
                String delQry = "delete from tbl_subcategory where subcategory_id='" + request.getParameter("delID") + "'";
                if (con.executeCommand(delQry)) {

        %>
        <script>
            alert("Data deleted");
            window.location = "Subcategory.jsp";
        </script>
        <%                         }
            }

        %>
        <form method="post">
            <table border="3" align="center">
                <tr>

                    <th>Category</th>
                    <td>
                        <select name="ddlcategory">
                            <%                               
                                String selQry = "select * from tbl_category";
                                ResultSet rscat = con.selectCommand(selQry);
                                while (rscat.next()) {
                            %>
                            <option value="<%=rscat.getString("category_id")%>"><%=rscat.getString("category_name")%></option>
                            <%
                                }
                            %>
                        </select>							
                    </td>

                </tr>
                <tr>
                    <th>Subcategory</th>
                    <td>
                        <input type="text" name="txtsubcatname" required>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="Accept" value="Save">
                        <input type="reset" name="Cancel" value="Reset">      
                    </td>
                </tr>
            </table>
            <br>
            <br>
            <table border="3" align="center">
                <tr>
                    <td>SI.No</td>
                    <td>Category</td>
                    <td>SubCategory</td>
                    <td>Action</td>
                </tr>
                <%                     int i = 0;
                    String selSub = "select * from tbl_subcategory sc inner join tbl_category c on sc.category_id=c.category_id";
                    ResultSet rssubcat = con.selectCommand(selSub);
                    while (rssubcat.next()) {
                        i++;


                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rssubcat.getString("category_name")%></td>
                    <td><%=rssubcat.getString("subcategory_name")%></td>
                    <td><a href="Subcategory.jsp?delID=<%=rssubcat.getString("subcategory_id")%>">Delete</a>
                </tr>
                <%

                    }
                %>
            </table>
        </form>
    </body>
</html>