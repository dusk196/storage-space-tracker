<%-- 
    Document   : ShowUidPwdsp
    Created on : 23 Apr, 2017, 4:10:06 AM
    Author     : Sayantan
--%>
<!DOCTYPE html>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.io.*,java.util.*" %>
<%@page import="javax.servlet.*,java.text.*" %>

<html>
    <head>
        <title>Ssshhhhhhh!!</title>
        <link rel="icon" href="images/fevicon.jpeg" type="image/gif" sizes="16x16">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://bootswatch.com/flatly/bootstrap.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <style>
            .top_space {
                padding-top: 70px;
            }
            a.disabled {
                pointer-events: none;
                cursor: default;
            }
            button.disabled {
                pointer-events: none;
                cursor: default;
            }
            select {
                margin: 5px;
                width: 200px !important;
            }

            select.custom {
                background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg%20version%3D%221.1%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20xmlns%3Axlink%3D%22http%3A%2F%2Fwww.w3.org%2F1999%2Fxlink%22%20x%3D%220px%22%20y%3D%220px%22%20fill%3D%22%23555555%22%20%0A%09%20width%3D%2224px%22%20height%3D%2224px%22%20viewBox%3D%22-261%20145.2%2024%2024%22%20style%3D%22enable-background%3Anew%20-261%20145.2%2024%2024%3B%22%20xml%3Aspace%3D%22preserve%22%3E%0A%3Cpath%20d%3D%22M-245.3%2C156.1l-3.6-6.5l-3.7%2C6.5%20M-252.7%2C159l3.7%2C6.5l3.6-6.5%22%2F%3E%0A%3C%2Fsvg%3E");
                padding-right: 25px;
                background-repeat: no-repeat;
                background-position: right center;
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
            }

            select.custom::-ms-expand {
                display: none;
            }
        </style>
        <%
            session = request.getSession();
            if (session.getAttribute("uid") == null) {
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/404.jsp");
                dispatcher.forward(request, response);
            }
        %>

    </head>


    <body>
        <br><br>
        <%
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
        %>

        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand disabled" href="#"><strong>NSA</strong> Warehouse</a>
                </div>
            </div>
        </nav>

        <div class="container">
            <div class="jumbotron">
                <h1>Welcome <%=fnm%></h1>      
                <p>Please note down your credentials in a safe place. We will never ask for your User ID & Password :)</p>
                &nbsp;<kbd>USERNAME&nbsp;:&nbsp;</kbd>&nbsp;&nbsp;
                &nbsp;<code>${uid}</code>&nbsp;&nbsp;<br>
                &nbsp;<kbd>PASSWORD&nbsp;:&nbsp;</kbd>&nbsp;&nbsp;
                &nbsp;<code><%=pwd%></code>&nbsp;&nbsp;
                <br><br>
                <p>Now, it's the perfect time to buy a premium subscription to our services. We arranged our logistics to keep your wallet happy & healthy ;)</p>
                <br><br>
                <p>Even if you skip this step now, you can also buy later when need more space or you can also upgrade your existing plan.</p>
            </div>
            <h1>Pricing <small>Choose a payment plan that works for you</small></h1>
            <div class="modal-body">
                <div id="pricing" class="container-fluid">
                    <div class="row slideanim">
                        <div class="col-sm-4 col-xs-12">
                            <div class="panel panel-default text-center">
                                <div class="panel-heading">
                                    <h1>Basic</h1>
                                </div>
                                <div class="panel-body">
                                    <p><strong>1</strong> DAY</p>
                                    <p><strong>2000</strong> Square Feet</p>
                                    <p><strong>1</strong> Routine Check</p>
                                    <p><strong>Free</strong> Transportation</p>
                                    <p><strong>Unlimited</strong> Support</p>
                                </div>
                                <div class="panel-footer">
                                    <h3>6000/-</h3>
                                    <h4>per month</h4>
                                </div>
                            </div>      
                        </div>     
                        <div class="col-sm-4 col-xs-12">
                            <div class="panel panel-default text-center">
                                <div class="panel-heading">
                                    <h1>Pro</h1>
                                </div>
                                <div class="panel-body">
                                    <p><strong>7</strong> DAYS</p>
                                    <p><strong>3000</strong> Square Feet</p>
                                    <p><strong>3</strong> Routine Check</p>
                                    <p><strong>Free</strong> Transportation</p>
                                    <p><strong>Unlimited</strong> Support</p>
                                </div>
                                <div class="panel-footer">
                                    <h3>40000/-</h3>
                                    <h4>per month</h4>
                                </div>
                            </div>      
                        </div>       
                        <div class="col-sm-4 col-xs-12">
                            <div class="panel panel-default text-center">
                                <div class="panel-heading">
                                    <h1>Premium</h1>
                                </div>
                                <div class="panel-body">
                                    <p><strong>30</strong> DAYS</p>
                                    <p><strong>5000</strong> Square Feet</p>
                                    <p><strong>10</strong> Routine Check</p>
                                    <p><strong>Free</strong> Transportation</p>
                                    <p><strong>Unlimited</strong> Support</p>
                                </div>
                                <div class="panel-footer">
                                    <h3>150000/-</h3>
                                    <h4>per month</h4>
                                </div>
                            </div>      
                        </div>      
                    </div>
                </div>
            </div>
            <%
                Date dNow = new Date();
                SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
                String pdate = ft.format(dNow);
            %>
            <div class="jumbotron">
                <center>
                    <form class="form-inline" method="post" action="BuySpaceFirst">
                        <div class="form-group">
                            <select class="form-control custom" name="plan">
                                <option value="None">No plan at this time!</option>
                                <option value="Basic">Basic</option>
                                <option value="Pro">Pro</option>
                                <option value="Premium">Premium</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="pdate" id="pdate" value="<%=pdate%>">
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">PAY!</button>
                        </div>
                    </form>
                </center>
                <br><br>
                <center>
                    <code>Due to some limitations (not having a trade license), we are unable to implement a PAYMENT GATEWAY for showing you the payments. For the time-being, let's assume the user has successfully paid after clicking on the payment option.</code>
                </center>
            </div>
        </div>
    </body>
</html>