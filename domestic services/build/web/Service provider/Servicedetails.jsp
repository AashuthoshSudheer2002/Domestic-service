<%-- 
    Document   : servicedetails
    Created on : 17 May, 2023, 11:04:37 AM
    Author     : crist
--%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Service Details</title>
        <%@include file="Header.jsp" %>
        <style>
    /* Global styles */
    body {
        font-family: Arial, sans-serif;
        background-color: #f8f8f8;
    }

    /* Container styles */
    #tab {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
        background-color: #ffffff;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    /* Heading styles */
    h1 {
        color: #333333;
        text-align: center;
        margin-bottom: 20px;
        text-decoration: underline;
    }

    /* Table styles */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    th, td {
        padding: 10px;
        border-bottom: 1px solid #dddddd;
    }

    th {
        background-color: #333333;
        color: #ffffff;
        text-align: left;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    /* Form styles */
    input[type="hidden"],
    input[type="text"],
    input[type="number"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #cccccc;
        border-radius: 3px;
    }

    input[type="submit"] {
        background-color: #4CAF50;
        color: #ffffff;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
    }

    input[type="reset"] {
        background-color: #cccccc;
        color: #333333;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
    }

    /* Action links styles */
    .action-links {
        margin-right: 10px;
        color: #333333;
        text-decoration: none;
    }

    .action-links:hover {
        text-decoration: underline;
    }

    /* Custom styles */
    .details-input,
    .rate-input {
        color: #666666;
    }
</style>

    </head>
    <body>
        <div id="tab" align="center">
        <a href="Homepage.jsp">Homepage</a>
        <%
            String detail="",rate="",sid="";
        if(request.getParameter("accept")!=null)
        {
            if(request.getParameter("hidd").equals(""))
            {
               String insQry="insert into tbl_servicedetails  (sdetails_content,sdetails_rate,provider_id)values('"+request.getParameter("txt_details")+"','"+request.getParameter("rate")+"','"+session.getAttribute("Spid")+"')";
               if(con.executeCommand(insQry))
               {
                   %>
                   <script>
                       alert("Data inserted");
                       window.location="Servicedetails.jsp";
                   </script>
                   <%
               }
               else{
                    %>
                   <script>
                       alert("Data insertion failed");
                       window.location="Servicedetails.jsp";
                   </script>
                   <%
               }
        }  
            else{
                String up="update tbl_servicedetails set sdetails_content='"+request.getParameter("txt_details")+"',sdetails_rate='"+request.getParameter("rate")+"' where sdetails_id='"+request.getParameter("hidd")+"'";
                if(con.executeCommand(up))
                {
                    response.sendRedirect("Servicedetails.jsp");
                }
            }
        }
        if (request.getParameter("eid")!=null){
            String sel="select * from tbl_servicedetails where sdetails_id='"+request.getParameter("eid")+"'";
            ResultSet rs=con.selectCommand(sel);
            if(rs.next())
            {
                sid=rs.getString("sdetails_id");
                detail=rs.getString("sdetails_content");
                rate=rs.getString("sdetails_rate");
            }
                }
        
         if (request.getParameter("delID")!=null){
            String del="delete from tbl_servicedetails where sdetails_id='"+request.getParameter("delID")+"'";
            con.executeCommand(del);
            
                }
                
         %>
          <p><h1 align="center">Service Details</h1></p>
    <form method="post" >
        <table border="3" align="center">
            <tr>
                <th>Details</th>
                <td><input type="hidden" name="hidd" value="<%=sid%>">
                    <input type="text" name="txt_details" value="<%=detail%>" ></td>
            </tr>
            <tr>
                <th>Basic Rate</th>
                <td><input type="number" name="rate" value="<%=rate%>"></td>
            </tr>
             <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="accept" value="Submit">
                    <input type="reset" name="reject" value="Cancel">
                </td>
            </tr>
        </table>
         <br>
        <table border="1" align="center">
            <tr>
                <td><b>SI.no</b></td>
                <td><b>Details</b></td>
                <td><b>Basic Rate</b></td>
                <td>Action</td>
            </tr>    
             <%                     
                    int i = 0;
                   String selEmp = "SELECT * from tbl_servicedetails where provider_id='" +session.getAttribute("Spid")+"'";
                    
                    ResultSet rsemp = con.selectCommand(selEmp);
                    while (rsemp.next()) {
                        i++;


                %>
                  <tr>
                      <td><%=i%></td>
                      <td><%=rsemp.getString("sdetails_content")%></td>
                      <td><%=rsemp.getString("sdetails_rate")%></td>
                        
                       <td><a href="Servicedetails.jsp?delID=<%=rsemp.getString("sdetails_id")%>">Delete</a>
                           <a href="Servicedetails.jsp?eid=<%=rsemp.getString("sdetails_id")%>">Edit</a>
                  </tr>
                  <%
                }
                %>
        </table>
        </div>
    </body>
</html>
<%@include file="Footer.jsp" %>