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
        <title>Payment Updation</title>
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
           
        if(request.getParameter("accept")!=null)
        {
          
               String insQry="update tbl_servicebooking set payment_amount='"+request.getParameter("rate")+"', booking_paymentstatus=1 where booking_id='"+request.getParameter("pid")+"'";
               
               
        boolean status = con.executeCommand(insQry);
        if (status == true) {

            DB.mailconnection m = new DB.mailconnection();
            String mailid[] = {request.getParameter("eid")};
            String name = request.getParameter("pname");
            String rate = request.getParameter("rate");
            String subject = "Payment Completed";

            String text = "Respected " + name + "  \r\n \r\n"
                    + " This is from admin Dash, thank you for signing up to our site. \r\n"
                    + " We are happy to inform you that your work and payment Rs."+ rate +" has been successfully completed. \r\n"
                    + " All the best. \r\n \r\n"
                    + " Team vServ.";
            boolean b = m.sendMail(mailid, subject, text);
            System.out.println(b);

               response.sendRedirect("Completedrequest.jsp");
        }  
        }
         %>
          <p><h1 align="center">Service Details</h1></p>
    <form method="post" >
        <table border="3" align="center">
          
            <tr>
                <th>Paid Amount</th>
                <td><input type="number" name="rate" ></td>
            </tr>
             <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="accept" value="Submit">
                    <input type="reset" name="reject" value="Cancel">
                </td>
            </tr>
        </table>
       
        </div>
    </body>
</html>
<%@include file="Footer.jsp" %>