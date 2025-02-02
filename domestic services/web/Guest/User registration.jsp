<%-- 
    Document   : User registration
    Created on : 30 Mar, 2023, 5:25:14 PM
    Author     : crist
--%>



<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <%@include file="Header.jsp" %>
    </head>
    <body>
        <div id="tab" align="center">
        <a href="Homepage.jsp">Homepage</a>
         <p><h1 align="center">User Registration</h1></p>
    <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/UserAction.jsp">>
        <table border="3" align="center">
            <tr>
                <th>Name</th>
                <td><input type="text" name="txt_nm" required placeholder="Enter name" title="Name Allows Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$"></td>
            </tr>
            <tr>
                <th>Contact</th>
                <td><input type="number" name="contact_no" required pattern="[0-9]{10,12}" title="Phone number must be 10 or 12"></td>
            </tr>
            
             <tr>
                <th>Email</th>
                <td><input type="text" name="text_nm"></td>
            </tr>
            <tr>
                <th>Address</th>
                <td><textarea name="addrs" row="5" cols="20"></textarea></td>
            </tr>
            
            <tr>
                <th>Gender</th>
                <td>
                    <input type="radio" name="gender" value="M">Male
                    <input type="radio" name="gender" value="F">Female
                 </td>


            </tr>
            <tr>
                <th>District</th>
                
                    <td>
                        <select name="district_name" onchange="getplace(this.value)">
                            <%
                                String selQry = "select * from tbl_district";
                                ResultSet rs = con.selectCommand(selQry);
                                while(rs.next())
                                {
                                    %>
                                    <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                                    <a href="Login.jsp"></a>
                                    <%
                                        }
                                    %>
                        </select>            
                    </td>						
                
            </tr>
             <tr>
                <th>Place</th>
                <td>
                    <select name="place_name" id="place">
                            <%
                                String place="";
                                String selQryplace = "select * from tbl_place";
                                ResultSet rsplace = con.selectCommand(selQryplace);
                                while(rsplace.next())
                                {
                                    %>
                                    <option value="<%=rsplace.getString("place_id")%>" <%if(rsplace.getString("place_id").equals(place)) out.print("selected");%>><%=rsplace.getString("place_name")%></option>
                                    <%
                                        }
                                    %>
                        </select>            
                    </td>
                
                    
               
            </tr>
            
            
            <tr>
                <th>Photo</th>
                
				<td  align="right">
                    <input type="file" name="photoup" value="Choose file">
                            
                </td>
                        
            </tr>
            <tr>
                <th>Password</th>
                <td>
                    <input type="password" name="pass">
                </td>
               
            </tr>
            <tr>
                <th>Confirm Password</th>
                <td>
                    <input type="password" name="pass">
                </td>
               
            </tr>
            
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="accept" value="Submit">
                    <input type="reset" name="reject" value="Cancel">
            
                        
                </td>
            </tr>

        </table>

    </form>
    </div>
    </body>
</html>
<script src="../Assets/JQ/jQuery.js"></script>
                        <script>
                            function getplace(did)
                            {
                                $.ajax({url:"../Assets/AjaxPages/Ajaxplace.jsp?did=" + did,
                                success: function(result){
                                    $("#place").html(result);
                                }
                            })
                            }
                           
                        </script>
                        <%@include file="Footer.jsp" %>