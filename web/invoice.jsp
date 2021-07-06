<%-- 
    Document   : invoice
    Created on : 3 May, 2017, 3:13:27 AM
    Author     : Sayantan
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.io.*,java.util.*" %>
<%@page import="javax.servlet.*,java.text.*" %>

<!DOCTYPE html>

<html>
    <head>
        <title>NSA - Invoice Copy</title>
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

    </head>

    <body>
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
        <br><br>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand disabled" href="index.jsp"><strong>NSA</strong> Warehouse</a>
                </div>
            </div>
        </nav>
        <%
            Date dNow = new Date();
            SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
            String idate = ft.format(dNow);
        %>
        <div class="container">
            <div class="jumbotron">
                <center>
                    <h1>NSA Warehouse</h1>
                    <h2>INVOICE</h2>
                    <br>
                    <br><br>
                </center>
                <div class="row">
                    <div class="col-md-6">
                        <p>
                            Invoice date: <strong><%=idate%></strong>
                        </p>
                    </div>
                    <div class="col-md-6">
                        <p>
                            Name: <strong><%=fnm%> <%=lnm%></strong><br>
                            Address: <strong><%=adr%></strong><br>
                            Phone No: <strong><%=phn%></strong><br>
                            Email: <strong><%=email%></strong><br>
                        </p>
                    </div>
                </div>
                <br>
                <hr>
                <br>
                
                <%
                    String planid, plan = null, space = null, price = null, pdate = null, edate = null, day = null;

                    planid = request.getParameter("invoice");

                    Class.forName("com.mysql.jdbc.Driver");
                    java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sst", "root", "roy94");
                    Statement st = conn.createStatement();
                    ResultSet rst = st.executeQuery("select * from plandb where planid='" + planid + "'");

                    while (rst.next()) {
                        plan = rst.getString(3);
                        space = rst.getString(4);
                        price = rst.getString(6);
                        pdate = rst.getString(7);
                        edate = rst.getString(8);
                        day = rst.getString(9);
                    }
                    
                    st.close();
                    conn.close();
                    
                    if (plan == null) {
                        getServletContext().getRequestDispatcher("/404.jsp").forward(request, response);
                    }

                    int p = Integer.parseInt(price);
                    int np = p - ((p * 7) / 100);
                %>
                
                <div class="row">
                    <center>
                        <h2>Transaction Details:</h2>
                    </center>
                    <br><br>
                    <div class="col-md-6">

                        <p>
                            Plan ID: <strong><%=planid%></strong><br>
                            Plan: <strong><%=plan%></strong><br>
                            Total alloted space: <strong><%=space%></strong><br>
                            Bought on: <strong><%=pdate%></strong><br>
                            Expiry: <strong><%=edate%></strong><br>
                            Validity: <strong><%=day%></strong>
                        </p>
                    </div>
                    <div class="col-md-6">
                        <p>
                            Net amount (INR): <strong><%=np%>/-</strong> Excl. Tax<br>
                            V.A.T: <strong>5%</strong><br>
                            Service Charges: <strong>2%</strong><br>
                            Total amount (INR): <strong><%=price%>/-</strong> Excl. Tax<br>
                            Status: <strong>PAID</strong><br>
                            Gateway: <strong>Internet Banking</strong><br>
                            Transaction ID: <strong>XXXXXXXXXX</strong><br>
                        </p>
                    </div>
                </div>
                <div>
                    <br><hr><br>
                    <center>
                        <code>This is a system generated invoice so no signature is required.</code>
                    </center>
                </div>
                <br><br>
                <center>
                    <button class="btn btn-primary btn-md" onclick="myFunction()">PRINT</button>
                </center>
            </div>
        </div>
        <script>
            function myFunction() {
                window.print();
            }
        </script>
    </body>

</html>
