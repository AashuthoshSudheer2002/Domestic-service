<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link href="../Assets/Template/Main/css/login.css" rel="stylesheet">
            <title>Login/Register</title>
        </head>
        <body>
            <h2></h2>
        <%
            String msg = "";
            if (request.getParameter("btnLogin") != null) {

                String selAdmin = "select * from tbl_admin where admin_email='" + request.getParameter("txtemail") + "' and admin_password='" + request.getParameter("txtpassword") + "'";

                ResultSet rsAdmin = con.selectCommand(selAdmin);

                String selService = "select * from tbl_serviceprovider where provider_email='" + request.getParameter("txtemail") + "' and provider_password='" + request.getParameter("txtpassword") + "'";
                ResultSet rspProvider = con.selectCommand(selService);

                String selUser = "select * from tbl_user where user_email='" + request.getParameter("txtemail") + "' and user_password='" + request.getParameter("txtpassword") + "'";
                // out.print(selUser);
                ResultSet rsuUser = con.selectCommand(selUser);

                if (rsAdmin.next()) {
                    session.setAttribute("lgname", rsAdmin.getString("admin_name"));
                    session.setAttribute("lgid", rsAdmin.getString("admin_id"));
                    response.sendRedirect("../Admin/AdminDashboard.jsp");
                } else if (rspProvider.next()) {
                    session.setAttribute("Spname", rspProvider.getString("provider_name"));
                    session.setAttribute("Spid", rspProvider.getString("provider_id"));
                    response.sendRedirect("../Service provider/Homepage.jsp");
                } else if (rsuUser.next()) {
                    session.setAttribute("Urname", rsuUser.getString("user_name"));
                    session.setAttribute("Uremail", rsuUser.getString("user_email"));
                    session.setAttribute("Urid", rsuUser.getString("user_id"));
                    response.sendRedirect("../User/Homepage.jsp");
                } else {
                    msg = "Invalid Login!!!";
                }

            }

        %>
        <%            if (request.getParameter("Accept") != null) {
                String ins = "insert into tbl_user(user_name,user_contact,user_email,user_password)values ('" + request.getParameter("name") + "','" + request.getParameter("contact") + "','" + request.getParameter("email") + "','" + request.getParameter("txtpass") + "')";
                if (con.executeCommand(ins)) {

        %>
        <script>
            alert("Signed Up");
            window.location = "newlogin.jsp";
        </script>
        <%                                              }
            }
        %>


        <div class="container" id="container">
            <div class="form-container sign-up-container">
                <form name="frmLogin" method="post">
                    <h1>Create Account</h1>
                    <input type="text" name="name"placeholder="Name" required />
                    <input type="text" name="contact" placeholder="Contact" required pattern="[0-9]{10,12}" title="Phone number  must be 10 or 12 use 0-9 digits"/>
                    <input type="email"  name="email"placeholder="Email" required/>
                    <input type="password" name="txtpass" placeholder="Password" required/>
                    <p>Are you a Service provider?<a href="Service provider registraction.jsp" style="color : #0000FF;">Sign up</a></p>
                    <button type="submit" name="Accept" value="createacc">Sign Up</button>

                </form>
            </div>
            <div class="form-container sign-in-container">
                <form action="#" >
                    <h1>Sign in</h1>

                    <input type="email" name="txtemail" placeholder="Email" required="" />
                    <input type="password" name="txtpassword" placeholder="Password" required="" />

                    <button  type="submit" name="btnLogin" value="Sign In">Sign In</button>
                </form>
            </div>
            <div class="overlay-container">
                <div class="overlay">
                    <div class="overlay-panel overlay-left">
                        <h1>Hello, Friend!</h1>
                        <p>Enter your personal details and start journey with us</p>
                        <button class="ghost" id="signIn">Sign In</button>
                    </div>
                    <div class="overlay-panel overlay-right">
                        <h1>Welcome Back!</h1>
                        <p>To keep connected with us please login with your personal info</p>
                        <button class="ghost" id="signUp">Sign Up</button>
                    </div>
                </div>
            </div>
        </div>


        <script src="../Assets/Template/Main/js/login.js"></script>
    </body>
</html>