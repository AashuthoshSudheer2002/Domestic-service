<%-- 
    Document   : ViewMybooking
    Created on : 18 May, 2023, 2:37:01 PM
    Author     : crist
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My Request</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        
        h1 {
            text-align: center;
            margin-bottom: 30px;
            text-decoration: underline;
            color: #333;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        th {
            background-color: #f2f2f2;
            font-weight: bold;
            color: #333;
        }
        
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        
        .status-pending {
            color: orange;
        }
        
        .status-accepted {
            color: green;
        }
        
        .status-completed {
            color: blue;
        }
        
        .status-paid {
            color: purple;
        }
        
        .status-rejected {
            color: red;
        }
        
        .link-btn {
            display: inline-block;
            padding: 6px 12px;
            background-color: #4CAF50;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
        }
        
        .link-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <%@include file="Header.jsp" %>
    <div class="container">
        <h1>My Request</h1>
        <%
            if(request.getParameter("bid") != null) {
                String upd = "update tbl_servicebooking set payment_mode='"+request.getParameter("status")+"' where booking_id='"+request.getParameter("bid")+"'";
                //out.print(upd);
                if(con.executeCommand(upd)) {
                    if(request.getParameter("status").equals("Card")) {
                        %>
                        <script>
                            alert("Redirecting to payment");
                            window.location="Payment.jsp?bid=<%=request.getParameter("bid")%>&&eid=<%=session.getAttribute("Uremail")%>&&pname=<%=session.getAttribute("Urname")%>";
                        </script>
                        <%
                    } else {
                        %>
                        <script>
                            alert("Cash on Delivery");
                            window.location="ViewMyBooking.jsp";
                        </script>
                        <%
                    }
                }
            }
        %>
        <table>
            <tr>
                <th>SI.no</th>
                <th>Servicetype</th>
                <th>Provider</th>
                <th>Contact</th>
                <th>ForDate</th>
                <th>Status</th>
            </tr>    
            <% 
            int i = 0;
            String selPQry = "select * from  tbl_servicebooking sb inner join tbl_serviceprovider sp on sp.provider_id=sb.provider_id inner join tbl_servicetype st on st.servicetype_id=sp.servicetype_id inner join tbl_servicedetails sd on sd.provider_id=sb.provider_id where sb.user_id='"+session.getAttribute("Urid")+"'";
          // out.print(selPQry);
            ResultSet rspService = con.selectCommand(selPQry);
            while(rspService.next()) {
                i++;
                String status = rspService.getString("booking_status");
                String paymentStatus = rspService.getString("booking_paymentstatus");
                String providerId = rspService.getString("provider_id");
                String providerPhoto = rspService.getString("provider_photo");
                String providerName = rspService.getString("provider_name");
                String bookingId = rspService.getString("booking_id");
                String bookingRate = rspService.getString("sdetails_rate");
                String payment_mode=rspService.getString("payment_mode");
                
                %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rspService.getString("servicetype_type")%></td>
                    <td><%=rspService.getString("provider_name")%></td>
                    <td><%=rspService.getString("provider_contact")%></td>
                    <td><%=rspService.getString("booking_fordate")%></td>
                    <td>
                        <% 
                        if(status.equals("0")) {
                            out.print("<span class='status-pending'>Verification Pending</span>");
                        } else if (status.equals("1")) {
                            out.print("<span class='status-accepted'>Request Accepted</span>");
                            %>
                            <a href="Chat/Chat.jsp?cid=<%=providerId%>&cphoto=<%=providerPhoto%>&cname=<%=providerName%>" class="link-btn">Chat</a>
                            <%
                        } else if (status.equals("3") && paymentStatus.equals("0") && payment_mode.equals("mode")) {
                            out.print("<span class='status-completed'>Work Completed</span>");
                            %>
                            <a href="Chat/Chat.jsp?cid=<%=providerId%>&cphoto=<%=providerPhoto%>&cname=<%=providerName%>" class="link-btn">Chat</a>
                            
                            <a href="ViewMyBooking.jsp?bid=<%=bookingId%>&status=Card&amount=<%=rspService.getString("sdetails_rate")%>" class="link-btn">Credit Pay</a>
                            <a href="ViewMyBooking.jsp?bid=<%=bookingId%>&status=Cash" class="link-btn">Cash Pay</a> 
                           
                            <%
                        }else if (status.equals("3") && paymentStatus.equals("0") && payment_mode.equals("Cash")) {
                            out.print("<span class='status-paid'>Cash Mode</span>");
                         
                        }
                        else if (status.equals("3") && paymentStatus.equals("1") && payment_mode.equals("Cash")) {
                            out.print("<span class='status-paid'>Cash Paid Rs.</span>"+ rspService.getString("payment_amount"));
                          %>
                            <a href="ServiceProviderRating.jsp?lid=<%=providerId%>" class="link-btn">Rate Now</a>
                            <%
                        }
                        
                        else if (status.equals("3") && paymentStatus.equals("1")) {
                            out.print("<span class='status-paid'>Paid Rs.</span>"+ rspService.getString("payment_amount"));
                            %>
                            <a href="ServiceProviderRating.jsp?lid=<%=providerId%>" class="link-btn">Rate Now</a>
                            <%
                        } else {
                            out.print("<span class='status-rejected'>Request Rejected</span>");
                        }
                        %>
                    </td> 
                </tr>
                <%
            }
            %>
        </table>
    </div>
    <%@include file="Footer.jsp" %>
</body>
</html>
