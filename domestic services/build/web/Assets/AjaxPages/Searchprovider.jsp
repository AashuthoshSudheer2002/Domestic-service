<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<table border="1" align="center">

                <%
                    int i = 0;
                    String selPQry = "select * from tbl_serviceprovider e inner join tbl_place d on d.place_id=e.place_id  inner join tbl_district f on f.district_id=d.district_id inner join tbl_servicetype t on t.servicetype_id=e.servicetype_id where provider_vstatus=1 and d.place_id='"+request.getParameter("did")+"'";
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
                            <br> 
                        <%=rspService.getString("provider_name")%><br>
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