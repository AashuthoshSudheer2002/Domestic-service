<%-- 
    Document   : Reply
    Created on : 19 May, 2023, 3:13:08 PM
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
        <p><h1 align="center">Complaints</h1></p>
    <form method="post">
        <a href="Reply.jsp"></a>
        
   
        <table border="3" align="center">
            <%
             if(request.getParameter("accept")!=null)
          {
             String ins="update tbl_complaint set complaint_status=1,complaint_reply='"+request.getParameter("reply")+"',complaint_replydate=curdate() where complaint_id='"+request.getParameter("eid")+"'";
                   
             if(con.executeCommand(ins))
             {  
                
                 %>
                 <script>
                     alert("Reply Submitted");
                     window.location="Reply.jsp";
                 </script>
                 <%
             }
            
        }
               if(request.getParameter("delID")!=null)
            {
                String delQry="delete from tbl_complaint where complaint_id='"+request.getParameter("delID")+"'";
                if(con.executeCommand(delQry))
                {  
                
                    %>
                    <script>
                        alert("Data deleted");
                        window.location="Complaint.jsp";
                    </script>
                    <%
                }
                {
                    %>
                    <script>
                        alert("Data not deleted");
                        window.location="Complaint.jsp";
                    </script>
                    <%
                }    
            }
             %>
         
             
              <tr>
                <td>Reply</td>
                <td><textarea name="reply" row="5" cols="20"></textarea></td>
            </tr>
              <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="accept" value="Submit">
                     <input type="reset" name="reject" value="Cancel">
            
                        
                </td>
            </tr>
        
    </form>
    </body>
</html>