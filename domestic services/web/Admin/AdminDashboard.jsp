<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Vserv Website</title>
    <!-- HTML5 Shim and Respond.js IE11 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 11]>
    	<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    	<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    	<![endif]-->
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="" />
    <meta name="keywords" content="">
    <meta name="author" content="Phoenixcoded" />
    <!-- Favicon icon -->
    <link rel="icon" href="../Assets/Template/Admin/assets/images/favicon.ico" type="image/x-icon">

    <!-- vendor css -->
    <link rel="stylesheet" href="../Assets/Template/Admin/assets/css/style.css">
    
    

</head>
<body class="">
	<!-- [ Pre-loader ] start -->
	<div class="loader-bg">
		<div class="loader-track">
			<div class="loader-fill"></div>
		</div>
	</div>
	<!-- [ Pre-loader ] End -->
	<!-- [ navigation menu ] start -->
	<nav class="pcoded-navbar menu-light ">
		<div class="navbar-wrapper  ">
			<div class="navbar-content scroll-div " >
				
				<div class="">
					<div class="main-menu-header">
						<img class="img-radius" src="../Assets/Template/Admin/assets/images/user/avatar-2.jpg" alt="User-Profile-Image">
						<div class="user-details">
							<div id="more-details">Admin <i class="fa fa-caret-down"></i></div>
						</div>
					</div>
					<div class="collapse" id="nav-user-link">
						<ul class="list-unstyled">
							
                                                    <li class="list-group-item"><a href="Logout.jsp"><i class="feather icon-log-out m-r-5"></i>Logout</a></li>
						</ul>
					</div>
				</div>
				
				<ul class="nav pcoded-inner-navbar ">
					<li class="nav-item pcoded-menu-caption">
					    <label>Navigation</label>
					</li>
					<li class="nav-item">
                                            <a href="AdminDashboard.jsp" class="nav-link "><span class="pcoded-micon"><i class="feather icon-home"></i></span><span class="pcoded-mtext">Dashboard</span></a>
					</li>
					<li class="nav-item pcoded-hasmenu">
					    <a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-map"></i></span><span class="pcoded-mtext">Location</span></a>
					    <ul class="pcoded-submenu">
                                                <li><a href="District.jsp" target="_blank">District</a></li>
                                                <li><a href="Place.jsp" target="_blank">Place</a></li>
					    </ul>
					</li>
					
					<li class="nav-item pcoded-hasmenu">
					    <a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-box"></i></span><span class="pcoded-mtext">More</span></a>
					    <ul class="pcoded-submenu">
                                                <li><a href="Category.jsp">Category</a></li>
                                                <li><a href="Department.jsp">Department</a></li>
                                                <li><a href="Designation.jsp">Designation</a></li>
                                                <li><a href="Employee.jsp">Employeen</a></li>
                                                <li><a href="Service type.jsp">Service type</a></li>
                                                <li><a href="Subcategory.jsp">Subcategory</a></li>
                                                <li><a href="ViewUserComplaint.jsp">ViewUserComplaint</a></li>
					        
					    </ul>
					</li>
                                        <li class="nav-item pcoded-hasmenu">
					    <a href="#!" class="nav-link "><span class="pcoded-micon"><i class="feather icon-user"></i></span><span class="pcoded-mtext">Service Provider</span></a>
					    <ul class="pcoded-submenu">
                                                <li><a href="Providerverification.jsp">Providerverification</a></li>
                                                <li><a href="ProviderAccept.jsp">ProviderAccept</a></li>
                                                <li><a href="ProviderReject.jsp">ProviderReject</a></li>
                                              
					        
					    </ul>
					</li>
					
					
				</ul>
				
				
				
			</div>
		</div>
	</nav>
	<!-- [ navigation menu ] end -->
	<!-- [ Header ] start -->
	<header class="navbar pcoded-header navbar-expand-lg navbar-light header-blue">
		
			
				<div class="m-header">
					<a class="mobile-menu" id="mobile-collapse" href="#!"><span></span></a>
					<a href="#!" class="b-brand">
						<!-- ========   change your logo hear   ============ -->
						<img src="../Assets/Template/Admin/assets/images/logo.png" alt="" class="logo">
						<img src="../Assets/Template/Admin/assets/images/logo-icon.png" alt="" class="logo-thumb">
					</a>
					<a href="#!" class="mob-toggler">
						<i class="feather icon-more-vertical"></i>
					</a>
				</div>
				
				
			
	</header>
	<!-- [ Header ] end -->
	
	

<!-- [ Main Content ] start -->
<div class="pcoded-main-container">
    <div class="pcoded-content">
        <!-- [ breadcrumb ] start -->
        <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <div class="page-header-title">
                            <h5 class="m-b-10">Dashboard Analytics</h5>
                        </div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="AdminDashboard.jsp"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#!">Dashboard Analytics</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- [ breadcrumb ] end -->
        <!-- [ Main Content ] start -->
        <div class="row">
            
            <div class="col-lg-5 col-md-12">
                <!-- page statustic card start -->
                <div class="row">
                    <div class="col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-8">
                                    <%
                                    String selp="select count(provider_id)as pc from tbl_serviceprovider where provider_vstatus=1";
                                    ResultSet rsp=con.selectCommand(selp);
                                    rsp.next();
                                    %>
                                        <h4 class="text-c-yellow"><%=rsp.getString("pc")%></h4>
                                        <h6 class="text-muted m-b-0">Providers</h6>
                                    </div>
                                    <div class="col-4 text-right">
                                        <i class="feather icon-user f-28"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer bg-c-yellow">
                                <div class="row align-items-center">
                                    <div class="col-9">
                                      
                                    </div>
                                    <div class="col-3 text-right">
                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-8">
                                         <%
                                    String selu="select count(user_id)as uc from tbl_user ";
                                    ResultSet rsu=con.selectCommand(selu);
                                    rsu.next();
                                    %>
                                        <h4 class="text-c-green"><%=rsu.getString("uc")%></h4>
                                        <h6 class="text-muted m-b-0">Users</h6>
                                    </div>
                                    <div class="col-4 text-right">
                                        <i class="feather icon-user f-28"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer bg-c-green">
                                <div class="row align-items-center">
                                    <div class="col-9">
                                     
                                    </div>
                                    <div class="col-3 text-right">
                                      
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                <div class="col-lg-5 col-md-12">
                    <div class="row">
                    <div class="col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-8">
                                        <%
                                    String selb="select count(booking_id) as bd from tbl_servicebooking ";
                                    ResultSet rsb=con.selectCommand(selb);
                                    rsb.next();
                                    %>
                                        <h4 class="text-c-red"><%=rsb.getString("bd")%></h4>
                                        <h6 class="text-muted m-b-0">Booking</h6>
                                    </div>
                                    <div class="col-4 text-right">
                                        <i class="feather icon-calendar f-28"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer bg-c-red">
                                <div class="row align-items-center">
                                    <div class="col-9">
                                     
                                    </div>
                                    <div class="col-3 text-right">
                                     
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="row align-items-center">
                                    <div class="col-8">
                                          <%
                                    String selc="select count(booking_id) as bc from tbl_servicebooking where booking_status=3 ";
                                    ResultSet rsc=con.selectCommand(selc);
                                    rsc.next();
                                    %>
                                        <h4 class="text-c-blue"><%=rsc.getString("bc")%></h4>
                                        <h6 class="text-muted m-b-0">Completed </h6>
                                    </div>
                                    <div class="col-4 text-right">
                                        <i class="feather icon-star-on f-28"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer bg-c-blue">
                                <div class="row align-items-center">
                                    <div class="col-9">
                                       
                                    </div>
                                    <div class="col-3 text-right">
                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- page statustic card end -->
            </div>
            
            
           
            <!-- Latest Customers start -->
            <div class="col-lg-8 col-md-12">
                <div class="card table-card review-card">
                    <div class="card-header borderless ">
                        <h5>Customer Reviews</h5>
                       
                    </div>
                    <div class="card-body">
                        <div class="review-block">
                               <%
                                    String self="select * from tbl_review r inner join tbl_user u on u.user_id=r.user_id";
                                    ResultSet rsf=con.selectCommand(self);
                                   while(rsf.next())
                                   {
                                    %>
                            <div class="row">
                                
                                <div class="col-sm-auto p-r-0">
                                    <img src="../Assets/Files/User/<%=rsf.getString("user_photo")%>" alt="user image" class="img-radius profile-img cust-img m-b-15">
                                </div>
                                <div class="col">
                                    <h6 class="m-b-15"><%=rsf.getString("user_name")%> <span class="float-right f-13 text-muted"> <%=rsf.getString("review_datetime")%></span></h6>
                                   
                                    <p class="m-t-15 m-b-15 text-muted"><%=rsf.getString("user_review")%></p>
                                  
                                </div>
                            </div>
                           <%
                                   }
                           %>
                        </div>
                        
                    </div>
                </div>
                
            <!-- Latest Customers end -->
        </div>
        <!-- [ Main Content ] end -->
    </div>
</div>
<!-- [ Main Content ] end -->
    <!-- Warning Section start -->
    <!-- Older IE warning message -->
    <!--[if lt IE 11]>
        <div class="ie-warning">
            <h1>Warning!!</h1>
            <p>You are using an outdated version of Internet Explorer, please upgrade
               <br/>to any of the following web browsers to access this website.
            </p>
            <div class="iew-container">
                <ul class="iew-download">
                    <li>
                        <a href="http://www.google.com/chrome/">
                            <img src="../Assets/Template/Admin/assets/images/browser/chrome.png" alt="Chrome">
                            <div>Chrome</div>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.mozilla.org/en-US/firefox/new/">
                            <img src="../Assets/Template/Admin/assets/images/browser/firefox.png" alt="Firefox">
                            <div>Firefox</div>
                        </a>
                    </li>
                    <li>
                        <a href="http://www.opera.com">
                            <img src="../Assets/Template/Admin/assets/images/browser/opera.png" alt="Opera">
                            <div>Opera</div>
                        </a>
                    </li>
                    <li>
                        <a href="https://www.apple.com/safari/">
                            <img src="../Assets/Template/Admin/assets/images/browser/safari.png" alt="Safari">
                            <div>Safari</div>
                        </a>
                    </li>
                    <li>
                        <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                            <img src="../Assets/Template/Admin/assets/images/browser/ie.png" alt="">
                            <div>IE (11 & above)</div>
                        </a>
                    </li>
                </ul>
            </div>
            <p>Sorry for the inconvenience!</p>
        </div>
    <![endif]-->
    <!-- Warning Section Ends -->

    <!-- Required Js -->
    <script src="../Assets/Template/Admin/assets/js/vendor-all.min.js"></script>
    <script src="../Assets/Template/Admin/assets/js/plugins/bootstrap.min.js"></script>
    <script src="../Assets/Template/Admin/assets/js/ripple.js"></script>
    <script src="../Assets/Template/Admin/assets/js/pcoded.min.js"></script>

<!-- Apex Chart -->
<script src="../Assets/Template/Admin/assets/js/plugins/apexcharts.min.js"></script>


<!-- custom-chart js -->
<script src="../Assets/Template/Admin/assets/js/pages/dashboard-main.js"></script>
</body>

</html>
