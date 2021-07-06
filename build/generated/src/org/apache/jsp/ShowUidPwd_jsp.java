package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.DriverManager;
import java.sql.Connection;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import java.text.*;

public final class ShowUidPwd_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>Ssshhhhhhh!!</title>\n");
      out.write("        <link rel=\"icon\" href=\"images/fevicon.jpeg\" type=\"image/gif\" sizes=\"16x16\">\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://bootswatch.com/flatly/bootstrap.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("\n");
      out.write("        <style>\n");
      out.write("            .top_space {\n");
      out.write("                padding-top: 70px;\n");
      out.write("            }\n");
      out.write("            a.disabled {\n");
      out.write("                pointer-events: none;\n");
      out.write("                cursor: default;\n");
      out.write("            }\n");
      out.write("            button.disabled {\n");
      out.write("                pointer-events: none;\n");
      out.write("                cursor: default;\n");
      out.write("            }\n");
      out.write("            select {\n");
      out.write("                margin: 5px;\n");
      out.write("                width: 200px !important;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            select.custom {\n");
      out.write("                background-image: url(\"data:image/svg+xml;charset=utf-8,%3Csvg%20version%3D%221.1%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20xmlns%3Axlink%3D%22http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink%22%20x%3D%220px%22%20y%3D%220px%22%20fill%3D%22%23555555%22%20%0A%09%20width%3D%2224px%22%20height%3D%2224px%22%20viewBox%3D%22-261%20145.2%2024%2024%22%20style%3D%22enable-background%3Anew%20-261%20145.2%2024%2024%3B%22%20xml%3Aspace%3D%22preserve%22%3E%0A%3Cpath%20d%3D%22M-245.3%2C156.1l-3.6-6.5l-3.7%2C6.5%20M-252.7%2C159l3.7%2C6.5l3.6-6.5%22%2F%3E%0A%3C%2Fsvg%3E\");\n");
      out.write("                padding-right: 25px;\n");
      out.write("                background-repeat: no-repeat;\n");
      out.write("                background-position: right center;\n");
      out.write("                -webkit-appearance: none;\n");
      out.write("                -moz-appearance: none;\n");
      out.write("                appearance: none;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            select.custom::-ms-expand {\n");
      out.write("                display: none;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("        ");

            session = request.getSession();
            if (session.getAttribute("uid") == null) {
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/404.jsp");
                dispatcher.forward(request, response);
            }
        
      out.write("\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <br><br>\n");
      out.write("        ");

            String uid = (String) session.getAttribute("uid");
            String pwd = null, alvl = null, fnm = null, lnm = null, adr = null, phn = null, dob = null, email = null, gndr = null;
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sst", "root", "roy94");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from custdb where uid='" + uid + "'");

            while (rs.next()) {
                System.out.println(uid + "    " + pwd + "    " + rs.getString(3) + "    " + rs.getString(4) + "    " + rs.getString(5) + "    " + rs.getString(6) + "    " + rs.getString(7) + "    " + rs.getString(8) + "    " + rs.getString(9) + "    " + rs.getString(10));
                pwd = rs.getString(2);
                fnm = rs.getString(3);
                lnm = rs.getString(4);
                adr = rs.getString(5);
                phn = rs.getString(6);
                dob = rs.getString(7);
                email = rs.getString(8);
                gndr = rs.getString(9);
                alvl = rs.getString(10);
            }
            stmt.close();
            con.close();
        
      out.write("\n");
      out.write("\n");
      out.write("        <nav class=\"navbar navbar-default navbar-fixed-top\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("                <div class=\"navbar-header\">\n");
      out.write("                    <a class=\"navbar-brand disabled\" href=\"#\"><strong>NSA</strong> Warehouse</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"jumbotron\">\n");
      out.write("                <h1>Welcome ");
      out.print(fnm);
      out.write("</h1>      \n");
      out.write("                <p>Please note down your credentials in a safe place. We will never ask for your User ID & Password :)</p>\n");
      out.write("                &nbsp;<kbd>USERNAME&nbsp;:&nbsp;</kbd>&nbsp;&nbsp;\n");
      out.write("                &nbsp;<code>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${uid}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</code>&nbsp;&nbsp;<br>\n");
      out.write("                &nbsp;<kbd>PASSWORD&nbsp;:&nbsp;</kbd>&nbsp;&nbsp;\n");
      out.write("                &nbsp;<code>");
      out.print(pwd);
      out.write("</code>&nbsp;&nbsp;\n");
      out.write("                <br><br>\n");
      out.write("                <p>Now, it's the perfect time to buy a premium subscription to our services. We arranged our logistics to keep your wallet happy & healthy ;)</p>\n");
      out.write("                <br><br>\n");
      out.write("                <p>Even if you skip this step now, you can also buy later when need more space or you can also upgrade your existing plan.</p>\n");
      out.write("            </div>\n");
      out.write("            <h1>Pricing <small>Choose a payment plan that works for you</small></h1>\n");
      out.write("            <div class=\"modal-body\">\n");
      out.write("                <div id=\"pricing\" class=\"container-fluid\">\n");
      out.write("                    <div class=\"row slideanim\">\n");
      out.write("                        <div class=\"col-sm-4 col-xs-12\">\n");
      out.write("                            <div class=\"panel panel-default text-center\">\n");
      out.write("                                <div class=\"panel-heading\">\n");
      out.write("                                    <h1>Basic</h1>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"panel-body\">\n");
      out.write("                                    <p><strong>1</strong> DAY</p>\n");
      out.write("                                    <p><strong>2000</strong> Square Feet</p>\n");
      out.write("                                    <p><strong>1</strong> Routine Check</p>\n");
      out.write("                                    <p><strong>Free</strong> Transportation</p>\n");
      out.write("                                    <p><strong>Unlimited</strong> Support</p>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"panel-footer\">\n");
      out.write("                                    <h3>6000/-</h3>\n");
      out.write("                                    <h4>per month</h4>\n");
      out.write("                                </div>\n");
      out.write("                            </div>      \n");
      out.write("                        </div>     \n");
      out.write("                        <div class=\"col-sm-4 col-xs-12\">\n");
      out.write("                            <div class=\"panel panel-default text-center\">\n");
      out.write("                                <div class=\"panel-heading\">\n");
      out.write("                                    <h1>Pro</h1>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"panel-body\">\n");
      out.write("                                    <p><strong>7</strong> DAYS</p>\n");
      out.write("                                    <p><strong>3000</strong> Square Feet</p>\n");
      out.write("                                    <p><strong>3</strong> Routine Check</p>\n");
      out.write("                                    <p><strong>Free</strong> Transportation</p>\n");
      out.write("                                    <p><strong>Unlimited</strong> Support</p>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"panel-footer\">\n");
      out.write("                                    <h3>40000/-</h3>\n");
      out.write("                                    <h4>per month</h4>\n");
      out.write("                                </div>\n");
      out.write("                            </div>      \n");
      out.write("                        </div>       \n");
      out.write("                        <div class=\"col-sm-4 col-xs-12\">\n");
      out.write("                            <div class=\"panel panel-default text-center\">\n");
      out.write("                                <div class=\"panel-heading\">\n");
      out.write("                                    <h1>Premium</h1>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"panel-body\">\n");
      out.write("                                    <p><strong>30</strong> DAYS</p>\n");
      out.write("                                    <p><strong>5000</strong> Square Feet</p>\n");
      out.write("                                    <p><strong>10</strong> Routine Check</p>\n");
      out.write("                                    <p><strong>Free</strong> Transportation</p>\n");
      out.write("                                    <p><strong>Unlimited</strong> Support</p>\n");
      out.write("                                </div>\n");
      out.write("                                <div class=\"panel-footer\">\n");
      out.write("                                    <h3>150000/-</h3>\n");
      out.write("                                    <h4>per month</h4>\n");
      out.write("                                </div>\n");
      out.write("                            </div>      \n");
      out.write("                        </div>      \n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            ");

                Date dNow = new Date();
                SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
                String pdate = ft.format(dNow);
            
      out.write("\n");
      out.write("            <div class=\"jumbotron\">\n");
      out.write("                <center>\n");
      out.write("                    <form class=\"form-inline\" method=\"post\" action=\"BuySpaceFirst\">\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <select class=\"form-control custom\" name=\"plan\">\n");
      out.write("                                <option value=\"None\">No plan at this time!</option>\n");
      out.write("                                <option value=\"Basic\">Basic</option>\n");
      out.write("                                <option value=\"Pro\">Pro</option>\n");
      out.write("                                <option value=\"Premium\">Premium</option>\n");
      out.write("                            </select>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <input type=\"text\" class=\"form-control\" name=\"pdate\" id=\"pdate\" value=\"");
      out.print(pdate);
      out.write("\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <button type=\"submit\" class=\"btn btn-primary\">PAY!</button>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("                </center>\n");
      out.write("                <br><br>\n");
      out.write("                <center>\n");
      out.write("                    <code>Due to some limitations (not having a trade license), we are unable to implement a PAYMENT GATEWAY for showing you the payments. For the time-being, let's assume the user has successfully paid after clicking on the payment option.</code>\n");
      out.write("                </center>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
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
