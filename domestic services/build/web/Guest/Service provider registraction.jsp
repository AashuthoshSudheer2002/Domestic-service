<%-- 
    Document   : Service provider registraction
    Created on : 30 Mar, 2023, 5:24:50 PM
    Author     : crist
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Service Provider Registration</title>
        <%@include file="Header.jsp" %>
    </head>
    <body>
        <div id="tab" align="center">
        <a href="Homepage.jsp">Homepage</a>
         <p><h1 align="center"> Service Provider Registration</h1></p>
    <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/ServiceProviderAction.jsp">
        <table  align="center" >
            <tr >
                <td style="color: black;background-color: #dfdfdf " ><b> Name</b></td>
                <td style="color: black;background-color: #dfdfdf "><input type="text" name="txt_nm" placeholder="Enter name" style="border-radius: 50px"></td>
            </tr>
            <tr>
                <td style="color: black;background-color: #dfdfdf " ><b>Email</b></td>
                <td style="color: black;background-color: #dfdfdf "><input type="text" name="txt_email" placeholder="Enter Email" style="border-radius: 50px"></td>
            </tr>
            <tr>
                <td style="color: black;background-color: #dfdfdf "><b>Contact</b></td>
                <td style="color: black;background-color: #dfdfdf "><input type="text" name="contact_no" placeholder="Enter Contact" style="border-radius: 50px"></td>
            </tr>
            <tr>
                <td style="color: black;background-color: #dfdfdf "><b>Service Type</b></td>
                <td style="color: black;background-color: #dfdfdf ">
                    <select name="service type"  style="border-radius: 50px">
                    <%                      
                                String servedit="";
                                String selQryy = "select * from tbl_servicetype";
                                ResultSet rsser = con.selectCommand(selQryy);
                                while (rsser.next()) {
                            %>
                            <option value="<%=rsser.getString("servicetype_id")%>" <%if(rsser.getString("servicetype_id").equals(servedit)) out.print("selected");%>><%=rsser.getString("servicetype_type")%></option>
                            <%
                                }
                            %>
                    </select>
                </td>
                
            </tr>
             <tr>
                 <td style="color: black;background-color: #dfdfdf "><b>Qualifications</b></td>
                <td style="color: black;background-color: #dfdfdf "><textarea name="addrs" row="10" cols="20" style="border-radius: 50px"></textarea></td>
            </tr>
             <tr>
                 <td style="color: black;background-color: #dfdfdf "><b>Qualification Proof</b></td>
                <td style="color: black;background-color: #dfdfdf "><input type="file" name="qualproof" ></td>
            </tr>
            <tr>
                <td style="color: black;background-color: #dfdfdf "><b>Address</b></td>
                <td style="color: black;background-color: #dfdfdf "><textarea name="addrs" row="5" cols="20" style="border-radius: 50px"></textarea></td>
            </tr>
             <tr>
                 <td style="color: black;background-color: #dfdfdf "><b>Landmark</b></td>
                <td style="color: black;background-color: #dfdfdf "><textarea name="addrs" row="5" cols="20" style="border-radius: 50px"></textarea></td>
            </tr>
            <tr>
                <td style="color: black;background-color: #dfdfdf "><b>Gender<b></td>
                <td style="color: black;background-color: #dfdfdf ">
                    <input type="radio" name="gender" value="M">Male
                    <input type="radio" name="gender" value="F">Female
                 </td>


            </tr>
            <tr>
                <td style="color: black;background-color: #dfdfdf "><b>District</td>
                 <td style="color: black;background-color: #dfdfdf ">
                    <select name="District" onchange="getplace(this.value)" style="border-radius: 50px">
                    <%                      
                                String disedit="";
                                String selQry = "select * from tbl_district";
                                ResultSet rsdis = con.selectCommand(selQry);
                                while (rsdis.next()) {
                            %>
                            <option value="<%=rsdis.getString("district_id")%>" <%if(rsdis.getString("district_id").equals(disedit)) out.print("selected");%>><%=rsdis.getString("district_name")%></option>
                            <%
                                }
                            %>
                    </select>
                </td>
                
            </tr>
             <tr>
                 <td style="color: black;background-color: #dfdfdf "><b>Place<b></td>
               <td style="color: black;background-color: #dfdfdf ">
                    <select name="Place" id="place" style="border-radius: 50px">
                    <%                      
                                String place="";
                                String selQryplace = "select * from tbl_place";
                                ResultSet rsplace = con.selectCommand(selQryplace);
                                while (rsplace.next()) {
                            %>
                            <option value="<%=rsplace.getString("place_id")%>" <%if(rsplace.getString("place_id").equals(place)) out.print("selected");%>><%=rsplace.getString("place_name")%></option>
                            <%
                                }
                            %>
                    </select>
                    
                </td>
                
                    
               
            </tr>
            
            
            <tr>
                <td style="color: black;background-color: #dfdfdf "><b>Photo</b></td>
                
				<td  align="right" style="color: black;background-color: #dfdfdf ">
                    <input type="file" name="photoupload" value="Choose file">
                            
                </td>
                        
            </tr>
            <tr>
                <td style="color: black;background-color: #dfdfdf "><b>Password</b></td>
                <td style="color: black;background-color: #dfdfdf ">
                    <input type="password" name="pass"  style="border-radius: 50px">
                </td>
               
            </tr>
            <tr>
                <td style="color: black;background-color: #dfdfdf "><b>Confirm Password</b></td>
                <td style="color: black;background-color: #dfdfdf ">
                    <input type="password" name="pass"  style="border-radius: 50px">
                </td>
               
            </tr>
            <tr>
                <td style="color: black;background-color: #dfdfdf "><b>ID Proof</b></td>
                <td style="color: black;background-color: #dfdfdf "><input type="file" name="proof"></td>
            </tr>
             <tr>
                 <td style="color: black;background-color: #dfdfdf "><b>Provider Details</b></td>
                <td style="color: black;background-color: #dfdfdf "><textarea name="detail" row="5" column="10"  style="border-radius: 50px"></textarea></td>
            </tr>
            <tr>
                <td style="color: black;background-color: #dfdfdf" colspan="2" align="center">
                    <input  type="submit" name="accept" value="Submit"  style="border-radius: 20px;">
                    <input type="reset" name="reject" value="Cancel"  style="border-radius: 20px">
            
                        
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
