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
   
         <p><h1 align="center">User Details</h1></p>
    <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/UserAction.jsp">
        <table border="3" align="center">
           
           
            <tr>
                <td style="color: black"><b>Photo</b></td>
                
				<td  align="right">
                    <input type="file" name="photoup" value="Choose file">
                            
                </td>
                        
            </tr>
            
            
            <tr>
                <td style="color: black"><b>Address</b></td>
                <td ><textarea name="addrs" row="5" cols="20" style="border-radius: 20px"></textarea></td>
            </tr>
            
            <tr>
                <td style="color: black"><b>Gender</b></td>
                <td>
                    <input type="radio" name="gender" value="M" >Male
                    <input type="radio" name="gender" value="F">Female
                 </td>

                  <tr>
                      <td style="color: black"><b>Landmark</b></td>
                <td>
                    <input type="text" name="land" style="border-radius: 20px">
                </td>
               
            </tr>
            </tr>
          
            
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="accept" value="Submit" style="border-radius: 10px">
                    <input type="reset" name="reject" value="Cancel" style="border-radius: 10px">
            
                        
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