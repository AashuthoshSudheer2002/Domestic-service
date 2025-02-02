<%-- 
    Document   : Category
    Created on : 3 Apr, 2023, 6:08:37 PM
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
    </head>
    <body>
         <%
             if(request.getParameter("btnsubmit")!=null)
             {
                 //out.print("hi");
                 String ins="insert into tbl_category (category_name) value('"+request.getParameter("txtname")+"')";
                 //out.print(ins);
                 if(con.executeCommand(ins))
                 {
                     %>
                     <script>
                         alert("Data inserted");
                         window.location="Category.jsp";
                     </script>
                     <%
                 }                 
             }      
                                 
         %>
         
        <form method="post" >
        <table border="2" align="center">

             <tr>
                <th>Category</th>
                <td><input type="text" name="txtname" required="" placeholder="enter category"></td>    
            </tr>
            
        <tr>
            <td colspan="2" align="center">
                <input type="submit" name="btnsubmit" value="Save">
                <input type="reset" name="btncancel" value="Reset">
    
            </td>
        </tr>
   
        </table>
    </body>
</html>
