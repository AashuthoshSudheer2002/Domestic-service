<%-- 
    Document   : SearchServiceprovider
    Created on : 13 May, 2023, 12:12:27 PM
    Author     : crist
--%>

<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
        <%@include file="Header.jsp" %>
    </head>
    <body>
        <div id="tab" align="center">
        <p><h1 align="center">Search ServiceProvider</h1></p>
    <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/UserAction.jsp">
        <table border="3" align="center">

            <tr>

                <th>District</th>
                <td>
                    <select name="District" onchange="getplace(this.value)">
                        <%
                            String disedit = "";
                            String selQry = "select * from tbl_district";
                            ResultSet rscat = con.selectCommand(selQry);
                            while (rscat.next()) {
                        %>
                        <option value="<%=rscat.getString("district_id")%>" <%if (rscat.getString("district_id").equals(disedit)) {
                                    out.print("selected");
                                }%>><%=rscat.getString("district_name")%></option>
                        <%
                            }
                        %>
                    </select>
                </td>


                <th>Place</th>
                <td>
                    <select name="place" id="place" onchange="getserviceprovider(this.value)">
                        <%
                            String place = "";
                            String selQryplace = "select * from tbl_place";
                            ResultSet rsplace = con.selectCommand(selQryplace);
                            while (rsplace.next()) {
                        %>
                        <option value="<%=rsplace.getString("place_id")%>" <%if (rsplace.getString("place_id").equals(place)) {
                                    out.print("selected");
                                }%>><%=rsplace.getString("place_name")%></option>
                        <%
                            }
                        %>
                    </select>
                </td>


        </table>
        <div id="search">
            <table border="1" align="center">

                <%
                    int i = 0;
                    String selPQry = "select * from tbl_serviceprovider e inner join tbl_place d on d.place_id=e.place_id  inner join tbl_district f on f.district_id=d.district_id inner join tbl_servicetype t on t.servicetype_id=e.servicetype_id where provider_vstatus=1";
                    ResultSet rspService = con.selectCommand(selPQry);
                    while (rspService.next()) {
                        i++;
                              System.out.println(i);

                                                            int average_rating = 0;
                                                            int total_review = 0;
                                                            int five_star_review = 0;
                                                            int four_star_review = 0;
                                                            int three_star_review = 0;
                                                            int two_star_review = 0;
                                                            int one_star_review = 0;
                                                            int total_user_rating = 0;

                                                            String query = "SELECT * FROM tbl_review where provider_id = '" + rspService.getString("provider_id") + "' ORDER BY review_id DESC";
                                                            ResultSet rs1 = con.selectCommand(query);
                                                            while (rs1.next()) {
                                                                if (rs1.getString("user_rating").equals("5")) {
                                                                    five_star_review++;
                                                                }
                                                                if (rs1.getString("user_rating").equals("4")) {
                                                                    four_star_review++;
                                                                }
                                                                if (rs1.getString("user_rating").equals("3")) {
                                                                    three_star_review++;
                                                                }
                                                                if (rs1.getString("user_rating").equals("2")) {
                                                                    two_star_review++;
                                                                }
                                                                if (rs1.getString("user_rating").equals("1")) {
                                                                    one_star_review++;
                                                                }
                                                                total_review++;
                                                                total_user_rating = total_user_rating + Integer.parseInt(rs1.getString("user_rating"));
                                                            }
                                                            if (total_user_rating > 0) {
                                                                average_rating = total_user_rating / total_review;
                                                            }

                %>


                <tr>
                    <td colspan="2" align="center"><img src="../Assets/Files/ServiceProvider/<%=rspService.getString("provider_photo")%>" width="100" height="100"><br>
 <!--Rating star code start-->
                            
                         
                                                                <h style="color:Red"> Rating  </h>&nbsp;
                                                                  <%

                                                                        if (average_rating == 5) {
                                                                    %> 
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                 <%
                                                                    }
                                                                    if (average_rating == 4) {
                                                                %>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                 <%
                                                                    }
                                                                    if (average_rating == 3) {
                                                                %>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                 <%
                                                                    }
                                                                    if (average_rating == 2) {
                                                                %>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                   <%
                                                                    }
                                                                    if (average_rating == 1) {
                                                                %>
                                                                <i class="fas fa-star" style="color:yellow;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                <%
                                                                    }
                                                                    if (average_rating == 0) {
                                                                %>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                <i class="fas fa-star" style="color:grey;"></i>
                                                                <%
                                                                    }


                                                                %>
                                                            
                            
                            
                            
                            
                            
                            
                            
                            
                            <!--Rating star code end-->
                            <br>    <%=rspService.getString("provider_name")%><br>
                        <%=rspService.getString("provider_email")%><br>
                        <%=rspService.getString("provider_contact")%><br>
                        <%=rspService.getString("provider_address")%><br>
                        <%=rspService.getString("servicetype_type")%><br>
                        <a href="Viewmoreservice.jsp?eid=<%=rspService.getString("provider_id")%>">View Details</a>
                     </td>





                    <%
                            if (i == 3) {
                                out.print("</tr>");
                                i = 0;
                                out.print("<tr>");
                            }
                        }
                    %>
            </table>
        </div>
    </form>
        </div>
</body>
</html>
<script src="../Assets/JQ/jQuery.js"></script>
<script>
function getplace(did)
{
    $.ajax({url: "../Assets/AjaxPages/Ajaxplace.jsp?did=" + did,
        success: function(result) {
            $("#place").html(result);
        }
    })
}
function getserviceprovider(did)
{
    $.ajax({url: "../Assets/AjaxPages/Searchprovider.jsp?did=" + did,
        success: function(result) {
            $("#search").html(result);
        }
    })
}

       </script>
 <%@include file="Footer.jsp" %>