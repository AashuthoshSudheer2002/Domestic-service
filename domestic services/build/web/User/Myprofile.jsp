<%-- 
    Document   : Myprofile
    Created on : 27 Apr, 2023, 6:15:22 PM
    Author     : crist
--%>

<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>My profile</title>
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

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>
   
</head>

    <body>
    <%
               
                String selPQry="select * from tbl_user where user_id='" +session.getAttribute("Urid")+ "'";
                ResultSet rsuUser=con.selectCommand(selPQry);
                rsuUser.next();
                
                    
                  %>
                  <div align="center">
                   <div class="col-md-4">
                        <aside class="profile-nav alt">
                            <section class="card">
                                <div class="card-header user-header alt bg-dark">
                                    <div class="media">
                                        <a href="#">
                                            <img class="align-self-center rounded-circle mr-3" style="width:85px; height:85px;" alt="" src="../Assets/Files/User/<%=rsuUser.getString("user_photo")%>">
                                        </a>
                                        <div class="media-body">
                                            <h2 class="text-light display-6"><%=rsuUser.getString("user_name")%></h2>
                                            <p></p>
                                        </div>
                                    </div>
                                </div>


                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">
                                        <a href="#"> <i class="fa fa-envelope-o"></i>&nbsp;&nbsp;&nbsp;<%=rsuUser.getString("user_email")%></a>
                                    </li>
                                    <li class="list-group-item">
                                        <a href="#"> <i class="fa fa-phone"></i>&nbsp;&nbsp;&nbsp;<%=rsuUser.getString("user_contact")%></a>
                                    </li>
                                    <li class="list-group-item">
                                        <a href="#"> <i class="fa fa-home"></i>&nbsp;&nbsp;&nbsp;<%=rsuUser.getString("user_address")%></a>
                                    </li>
                                    <li class="list-group-item">
                                        <a href="#"> <i class="fa fa-user"></i>&nbsp;&nbsp;&nbsp; <%=rsuUser.getString("user_gender")%> </a>
                                    </li>
                                </ul>

                            </section>
                        </aside>
                    </div>
                  </div>
    </body>
    <a href="SearchServiceprovider.jsp"></a>
</html>
 <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
    <script src="../Assets/Template/Other/assets/js/main.js"></script>

 <%@include file="Footer.jsp" %>