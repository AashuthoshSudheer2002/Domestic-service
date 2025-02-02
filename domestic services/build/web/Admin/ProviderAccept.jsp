<%-- 
    Document   : ProviderAccept
    Created on : 9 May, 2023, 11:41:43 AM
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
    </head>
    <body>
        <%
        
        if(request.getParameter("rid")!=null)
        {
            String up1="update tbl_serviceprovider set provider_vstatus=2 where provider_id='"+request.getParameter("rid")+"'";
            con.executeCommand(up1);
            response.sendRedirect("ProviderAccept.jsp");
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
                String selPQry="select * from tbl_serviceprovider e inner join tbl_place d on d.place_id=e.place_id  inner join tbl_district f on f.district_id=d.district_id where provider_vstatus=1";
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
                             <a href="ProviderAccept.jsp?rid=<%=rspService.getString("provider_id")%>">Reject</a></td>
                              
                      
                  </tr>
                  <%
                }
                %>
        </table>
             
        </form>
    </body>
</html>