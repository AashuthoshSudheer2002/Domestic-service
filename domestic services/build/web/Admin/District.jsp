<%-- 
    Document   : District
    Created on : 30 Mar, 2023, 5:23:32 PM
    Author     : crist
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>District</title>
    </head>
    <style>
        body
        {
            font-family: Arial, sans-serif;
        }

        table {
            border-collapse: collapse;
            margin: 20px auto;
        }

        th, td {
            padding: 8px;
            border: 1px solid #ccc;
        }

        th {
            background-color: #f2f2f2;
        }

        input[type="text"], input[type="submit"], input[type="reset"] {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
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
    <%@include file="Header.jsp" %>
</head>

    <body>
         <%
         if(request.getParameter("Accept")!=null)
         {
              if(request.getParameter("eid")!=null)
            {
                String upQry="update tbl_district set district_name='"+request.getParameter("districtname")+"' where district_id='"+request.getParameter("eid")+"'";
                if(con.executeCommand(upQry))
                 {  
                
                %>
                <script>
                    alert("Data Updated");
                    window.location="District.jsp";
                </script>
                <%
             }  
            }
             else
              {     
                
             String ins="insert into tbl_district (district_name)value('"+request.getParameter("districtname")+"')";
             if(con.executeCommand(ins))
             {
                
                 %>
                 <script>
                     alert("Data inserted");
                     window.location="District.jsp";
                 </script>
                 <%
             }
               }
         }
         if(request.getParameter("delID")!=null)
         {
             String delQry="delete from tbl_district where district_id='"+request.getParameter("delID")+"'";
             if(con.executeCommand(delQry))
             {
                
                 %>
                 <script>
                     alert("Data deleted");
                     window.location="District.jsp";
                 </script>
                 <%
             }
         }
         String disedit="";
    if(request.getParameter("eid")!=null)
    {
        String selQryedit="select * from tbl_district where district_id='"+request.getParameter("eid")+"'";
        ResultSet resedit = con.selectCommand(selQryedit);
        resedit.next();
        
        disedit= resedit.getString("district_name");
    }
         %>
         <form method="post">
         <table border="3" align="center">
            <tr>
                <th>District</th>
                <td>
                    <input type="text" name="districtname" required value="<%=disedit%>">					
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
            int i = 0;
            String selQry = "select * from tbl_district";
            ResultSet rsDis = con.selectCommand(selQry);
            while (rsDis.next()) {
                i++;
            %>
            <tr>
                <td><%=i%></td>
                <td><%=rsDis.getString("district_name")%></td>
                <td>
                    <form action="District.jsp" method="get" style="display: inline;">
                        <input type="hidden" name="delID" value="<%=rsDis.getString("district_id")%>">
                        <button type="submit">Delete</button>
                    </form>
                    <form action="District.jsp" method="get" style="display: inline;">
                        <input type="hidden" name="eid" value="<%=rsDis.getString("district_id")%>">
                        <button type="submit">Edit</button>
                    </form>
                </td>
            </tr>
            <%
            }
            %>
        </table>
        
    </body>
    <%@include  file="Footer.jsp" %>
</html>