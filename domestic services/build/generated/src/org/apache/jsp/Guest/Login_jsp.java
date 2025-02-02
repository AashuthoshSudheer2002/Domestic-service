package org.apache.jsp.Guest;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
      out.write('\n');
      DB.ConnectionClass con = null;
      synchronized (_jspx_page_context) {
        con = (DB.ConnectionClass) _jspx_page_context.getAttribute("con", PageContext.PAGE_SCOPE);
        if (con == null){
          con = new DB.ConnectionClass();
          _jspx_page_context.setAttribute("con", con, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>HappyHome::Login</title>\n");
      out.write("    </head>\n");
      out.write("    <body>+\n");
      out.write("\n");
      out.write("        ");

            String msg = "";
            if (request.getParameter("btnLogin") != null) {

                String selAdmin = "select * from tbl_admin where admin_email='" + request.getParameter("txtemail") + "' and admin_password='" + request.getParameter("txtpassword") + "'";
                ResultSet rsAdmin = con.selectCommand(selAdmin);
               
                
                String selService = "select * from tbl_serviceprovider where provider_email='" + request.getParameter("txtemail") + "' and provider_password='" + request.getParameter("txtpassword") + "' and provider_vstatus=1";
                ResultSet rspProvider = con.selectCommand(selService);
               
                
                String selUser = "select * from tbl_user where user_email='" + request.getParameter("txtemail") + "' and user_password='" + request.getParameter("txtpassword") + "'";
               // out.print(selUser);
                ResultSet rsuUser = con.selectCommand(selUser);
                
                 if (rsAdmin.next()) {
                    session.setAttribute("lgname", rsAdmin.getString("admin_name"));
                    session.setAttribute("lgid", rsAdmin.getString("admin_id"));
                   response.sendRedirect("../Admin/Homepage.jsp");
                } 
                else  if (rspProvider.next()) {
                    session.setAttribute("Spname", rspProvider.getString("provider_name"));
                    session.setAttribute("Spid", rspProvider.getString("provider_id"));
                    response.sendRedirect("../Service provider/Homepage.jsp");
                } 
               else if (rsuUser.next()) {
                    session.setAttribute("Urname", rsuUser.getString("user_name"));
                    session.setAttribute("Uremail", rsuUser.getString("user_email"));
                    session.setAttribute("Urid", rsuUser.getString("user_id"));
                   response.sendRedirect("../User/Homepage.jsp");
                } 
                else {
                    msg = "Invalid Login!!!";
                }
               
            }
             
        
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <form name=\"frmLogin\" method=\"post\">\n");
      out.write("            <table align=\"center\">\n");
      out.write("                <tr>\n");
      out.write("                    <td>Email</td>\n");
      out.write("                    <td><input type=\"text\" name=\"txtemail\" required=\"\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td>Password</td>\n");
      out.write("                    <td><input type=\"password\" name=\"txtpassword\" required=\"\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td colspan=\"2\" align=\"center\">\n");
      out.write("                        <input  type=\"submit\" name=\"btnLogin\" value=\"Login\">\n");
      out.write("                        <input  type=\"reset\" name=\"btnCancel\" value=\"Cancel\">\n");
      out.write("\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td colspan=\"2\" align=\"center\">");
      out.print(msg);
      out.write("</td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
