<%-- 
    Document   : Editprofile
    Created on : 27 Apr, 2023, 6:14:25 PM
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
        <%@include file="Header.jsp" %>
    </head>
    <body>
        <div id="tab" align="center">
        <a href="Homepage.jsp">Homepage</a>
         <form method="post" >
            <table border="2" align="center">
                       <%
        if(request.getParameter("btnupdate")!=null)
        {
               String upQry="update tbl_serviceprovider set provider_name='"+request.getParameter("txtname")+"',provider_contact='"+request.getParameter("txtcontact")+"',provider_email='"+request.getParameter("txtemail")+"',provider_address='"+request.getParameter("addrs")+"',provider_landmark='"+request.getParameter("land")+"' where provider_id='"+session.getAttribute("Spid")+"'";
              // out.print(upQry);
               con.executeCommand(upQry);
                 
        
                %>
                 <script>
                    alert("Data Updated");
                  window.location="Myprofile.jsp";
                </script>

            <%
        }
               
                String selPQry="select * from tbl_serviceprovider where provider_id='" +session.getAttribute("Spid")+ "'";
                ResultSet rspService=con.selectCommand(selPQry);
                 rspService.next();
              
              
                    
                  %>
                
           
              
                  <br>
                  <br>
              
                <tr>
                    <th>Name</th>

                    <td><input type="text" name="txtname" placeholder="enter type" value="<%=rspService.getString("provider_name")%>"></td>							

                </tr>
                <tr>
                    <th>Contact</th>

                    <td><input type="text" name="txtcontact" placeholder="enter type" value="<%=rspService.getString("provider_contact")%>"></td>							

                </tr>
                <tr>
                    <th>Email</th>

                    <td><input type="text" name="txtemail" placeholder="enter type" value="<%=rspService.getString("provider_email")%>"></td>							

                </tr>
                <tr>
                    <th>Address</th>

                    <td><textarea name="addrs" row="5" cols="20" ><%=rspService.getString("provider_address")%></textarea></td>							

                </tr>
                <tr>
                    <th>Landmark</th>

                    <td><textarea name="land"  ><%=rspService.getString("provider_landmark")%></textarea></td>							

                </tr>
                 <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btnupdate" value="update" >
                        <input type="reset" name="btnreset" value="cancel" >
                    </td>
                </tr>

              

            </table>

       

            
    </form>
                    </div>
    </body>
</html>
<%@include file="Footer.jsp" %>
