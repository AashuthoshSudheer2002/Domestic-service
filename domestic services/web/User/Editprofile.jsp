<%-- 
    Document   : Editprofile
    Created on : 4 May, 2023, 12:02:02 PM
    Author     : crist
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit profile</title>
        <%@include file="Header.jsp" %>
         <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
    <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
    <link rel="stylesheet" href="../Assets/Template/Other/assets/css/cs-skin-elastic.css">
    <link rel="stylesheet" href="../Assets/Template/Other/assets/css/style.css">
    <link rel="stylesheet" href="../Assets/Template/Other/assets/css/lib/chosen/chosen.min.css">

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
    </head>
    <body>
        <form method="post">
              <%
        if(request.getParameter("accept")!=null)
        {
               String upQry="update tbl_user set user_name='"+request.getParameter("txt_nm")+"',user_contact='"+request.getParameter("contact_no")+"',user_email='"+request.getParameter("email")+"',user_address='"+request.getParameter("addrs")+"' where user_id='" +session.getAttribute("Urid")+ "'";
              // out.print(upQry);
               con.executeCommand(upQry);
                 
        
                %>
                 <script>
                    alert("Data Updated");
                   window.location="Myprofile.jsp";
                </script>

            <%
               }  
                String selPQry="select * from tbl_user where user_id='" +session.getAttribute("Urid")+ "'";
                ResultSet rsuUser=con.selectCommand(selPQry);
              rsuUser.next();
                   
                  %>
                  
                 
                    <div class="col-xs-6 col-sm-6">
                        <div class="card">
                            <div class="card-header">
                                <strong>Edit Your Profile</strong> 
                            </div>
                            <div class="card-body card-block">
                                <div class="form-group">
                                    <label class=" form-control-label">Name</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-user"></i></div>
                                        <input class="form-control"name="txt_nm" value="<%=rsuUser.getString("user_name")%>">
                                    </div>
                                   
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">Phone </label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-phone"></i></div>
                                        <input class="form-control"name="contact_no" value="<%=rsuUser.getString("user_contact")%>">
                                    </div>
                                   
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">Email</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-envelope"></i></div>
                                        <input class="form-control"name="email" value="<%=rsuUser.getString("user_email")%>">
                                    </div>
                                  
                                </div>
                                <div class="form-group">
                                    <label class=" form-control-label">Address</label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-home"></i></div>
                                        <input class="form-control" name="addrs" value="<%=rsuUser.getString("user_address")%>">
                                    </div>
                                 
                                </div>
                                
                                <div class="form-group">
                                    <div class="form-actions form-group"><button type="submit" name="accept" class="btn btn-success btn-sm">Submit</button></div>
                        
                                </div>
                            </div>
                        </div>
                    </div>
        </form>
    </body>
</html>
<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
<script src="../Assets/Template/Other/assets/js/main.js"></script>
<script src="../Assets/Template/Other/assets/js/lib/chosen/chosen.jquery.min.js"></script>

<script>
    jQuery(document).ready(function() {
        jQuery(".standardSelect").chosen({
            disable_search_threshold: 10,
            no_results_text: "Oops, nothing found!",
            width: "100%"
        });
    });
</script>
 <%@include file="Footer.jsp" %>