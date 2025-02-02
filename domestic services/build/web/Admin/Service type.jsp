<%-- 
    Document   : Service type
    Created on : 30 Mar, 2023, 5:24:06 PM
    Author     : crist
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Service type</title>
    </head>
    <body>
         <%
         if(request.getParameter("Accept")!=null)         
         {
              if(request.getParameter("eid")!=null)
            {
                String upQry="update tbl_servicetype set servicetype_type='"+request.getParameter("servicename")+"' where servicetype_id='"+request.getParameter("eid")+"'";
                if(con.executeCommand(upQry))
                 {  
                
                %>
                <script>
                    alert("Data Updated");
                    window.location="Service type.jsp";
                </script>
                <%
             }  
            }
              else
              {
                
             String ins="insert into tbl_servicetype (servicetype_type)value('"+request.getParameter("servicename")+"')";
             if(con.executeCommand(ins))
             {
                
                 %>
                 <script>
                     alert("Data inserted");
                     window.location="Service type.jsp";
                 </script>
                 <%
             }
         }
         }
          if(request.getParameter("delID")!=null)
         {
             String delQry="delete from tbl_servicetype where servicetype_id='"+request.getParameter("delID")+"'";
             if(con.executeCommand(delQry))
             {
                
                 %>
                 <script>
                     alert("Data deleted");
                     window.location="Service type.jsp";
                 </script>
                 <%
             }
         }
          String seredit="";
    if(request.getParameter("eid")!=null)
    {
        String selQryedit="select * from tbl_servicetype where servicetype_id='"+request.getParameter("eid")+"'";
        ResultSet resedit = con.selectCommand(selQryedit);
        resedit.next();
        
        seredit= resedit.getString("servicetype_type");
    }
         %>
        <form method="post">
         <table border="3" align="center">
           <tr>
                <th>Service type</th>
                <td>
                    <input type="text" name="servicename" required value="<%=seredit%>">
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="Accept" value="Submit">
                    <input type="reset" name="Cancel" value="Cancel">      
               </td>
            </tr>
            </table>
            <br>
             <br>
             <table border="3" align="center">
                 <tr>
                     <td>SI.No</td>
                     <td>Name</td>
                     <td>Action</td>
                 </tr>
                 <%
                    int i=0;
                    String selQry="select * from tbl_servicetype";
                    ResultSet rsSer=con.selectCommand(selQry);
                    while(rsSer.next())
                    {
                        i++;
                                
                           
                 %>
                  <tr>
                     <td><%=i%></td>
                     <td><%=rsSer.getString("servicetype_type")%></td>
                     <td><a href="Service type.jsp?delID=<%=rsSer.getString("servicetype_id")%>">Delete</a>
                         <a href="Service type.jsp?eid=<%=rsSer.getString("servicetype_id")%>">Edit</a></td>
                 </tr>
                 <%
                 
                    }
                 %>
             </table>
        </form>
            
    </body>
</html>
