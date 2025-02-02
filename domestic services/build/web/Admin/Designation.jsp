<%-- 
    Document   : Designaton
    Created on : 13 Apr, 2023, 2:01:11 PM
    Author     : crist
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Designation</title>
    </head>
    <body>
        <a href="Homepage.jsp">Homepage</a>
        <%
         if (request.getParameter("btnsubmit") != null) 
         {
                if (request.getParameter("eid") != null) 
                {
                    String upQry = "update tbl_designation set designation_name='" + request.getParameter("designationname") + "' where designation_id='" + request.getParameter("eid") + "'";
                    out.print(upQry);
                    if (con.executeCommand(upQry)) 
                    {

                        %>
                        <script>
                            alert("Data Updated");
                            window.location = "Designation.jsp";
                        </script>
        
          <%
                    }
                }
                else
                {
                String ins="insert into tbl_designation (designation_name)value('"+request.getParameter("designationname")+"')";
                if(con.executeCommand(ins))
                {  
                
                    %>
                    <script>
                        alert("Data inserted");
                        window.location="Designation.jsp";
                    </script>
                    <%
                }
                else
                {
                    %>
                    <script>
                         alert("Data not inserted");
                         window.location="Designation.jsp";
                    </script>
                    <%
                }    
            }
      }
    if(request.getParameter("delID")!=null)
        {
            String delQry="delete from tbl_designation where designation_id='"+request.getParameter("delID")+"'";
            if(con.executeCommand(delQry))
            {  
                
                %>
                <script>
                    alert("Data deleted");
                    window.location="Designation.jsp";
                </script>
                <%
             }
            else
            {
                %>
                <script>
                    alert("Data not deleted");
                    window.location="Designation.jsp";
                </script>
                <%
            }    
         }
 
           String deptedit = "";
            if (request.getParameter("eid") != null) {
                String selQryedit = "select * from tbl_designation where designation_id='" + request.getParameter("eid") + "'";
                ResultSet rsedit = con.selectCommand(selQryedit);
                rsedit.next();
                deptedit = rsedit.getString("designation_name");
            }
       
                
       
     %>   <form method="post" >
        <table align="center" border="2">
            
                <tr>
 <th>Desig name</th>
 <td>
     <input type="text" name="designationname" required value="<%=deptedit%>">     
  </td>
</tr>
    
<tr>
            <td colspan="2" align="center">
                <input type="submit" name="btnsubmit" value="save">
                <input type="reset" name="btncancel" value="cancel">
    
            </td>
        </tr>

            
            
        </table>
        <br>
            <br>
            <table border="3" align="center">
                <tr>
                    <td>SI.No</td>
                    <td>Designation name</td>
                    <td>Action</td>
                </tr>
                <%  
                    int i = 0;
                    String selSub = "select * from tbl_designation";
                    ResultSet rssubcat = con.selectCommand(selSub);
                    while (rssubcat.next()) {
                        i++;


                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rssubcat.getString("designation_name")%></td>
                    <td><a href="Designation.jsp?delID=<%=rssubcat.getString("designation_id")%>">Delete</a>
                        <a href="Designation.jsp?eid=<%=rssubcat.getString("designation_id")%>">edit</a>
                </tr>
                <%

                    }
                %>
            </table>
    </body>
</html>