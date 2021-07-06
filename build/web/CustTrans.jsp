<%--
    Document   : CustTrans
    Created on : 1 May, 2017, 3:43:59 PM
    Author     : Sayantan
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page import="java.io.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <link rel="icon" href="images/fevicon.jpeg" type="image/gif"
              sizes="16x16">

        <title>NSA - Transactions</title>

        <!-- Bootstrap Core CSS -->
        <link href="https://bootswatch.com/cosmo/bootstrap.css"
              rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/sb-admin.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="css/plugins/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet"
              type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
                    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
                    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
                <![endif]-->

        <link href='//fonts.googleapis.com/css?family=Ubuntu' rel='stylesheet'>

        <style>
            body {
                font-family: 'Ubuntu';
            }

            @media ( min-width :768px) {
                .side-nav {
                    background-color: #222222;
                }
                .top-nav>li>a {
                    color: #000000;
                }
                .fnts {
                    font-size: 22px;
                }
                .top-nav>li>a {
                    color: #ffffff;
                }
            }
        </style>

    </head>

    <%
        session = request.getSession();
        if (session.getAttribute("uid") == null || session.getAttribute("alvl").equals("manager") || session.getAttribute("alvl").equals("admin")) {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/404.jsp");
            dispatcher.forward(request, response);
        }
    %>

    <body>

        <%
            String uid = (String) session.getAttribute("uid");
            String pwd = null, alvl = null, fnm = null, lnm = null, adr = null, phn = null, dob = null, email = null, gndr = null;
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sst", "root", "roy94");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from custdb where uid='" + uid + "'");

            while (rs.next()) {
                System.out.println(uid + "    " + pwd + "    " + rs.getString(3) + "    " + rs.getString(4) + "    "
                        + rs.getString(5) + "    " + rs.getString(6) + "    " + rs.getString(7) + "    "
                        + rs.getString(8) + "    " + rs.getString(9) + "    " + rs.getString(10));
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

        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/sst" user="root" password="roy94" />
        <sql:query dataSource="${snapshot}" var="result">select * from msgdb where torecv = '${uid}';</sql:query>
        <c:set var="total" value="${1}" />
        <c:forEach var="row" items="${result.rows}">
            <c:set var="total" value="${total + 1}" />
        </c:forEach>


        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand fnts" href="CustDash.jsp">Hi <%=fnm%></a>
                </div>
                <!-- Top Menu Items -->
                <ul class="nav navbar-right top-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle fnts" data-toggle="dropdown"><i class="fa fa-user"></i> ${uid} <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="CustProfile.jsp"><i class="fa fa-fw fa-user"></i> Profile</a>
                            </li>
                            <li>
                                <a href="CustInbox.jsp"><i class="fa fa-fw fa-envelope"></i> Inbox (<c:out value="${total - 1}" />)</a>
                            </li>
                            <li>
                                <a href="CustProfile.jsp"><i class="fa fa-fw fa-gear"></i> Profile</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <form class="form-inline" method="post" action = "logout">
                                    <center>
                                        <input class="form-group btn btn-primary btn-danger" type="submit" value = "Log Out">
                                    </center>
                                </form>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav">
                        <li>
                            <a href="CustDash.jsp"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="CustWarehouse.jsp"><i class="fa fa-fw fa-bar-chart-o"></i> Warehouse</a>
                        </li>
                        <li>
                            <a href="CustInbox.jsp"><i class="fa fa-fw fa-envelope"></i> Inbox (<c:out value="${total - 1}" />)</a>
                        </li>
                        <li class="active">
                            <a href="CustTrans.jsp"><i class="fa fa-fw fa-table"></i> Transaction</a>
                        </li>
                        <li>
                            <a href="CustUpdateSpace.jsp"><i class="fa fa-fw fa-edit"></i> Update Space</a>
                        </li>
                        <li>
                            <a href="CustProfile.jsp"><i class="fa fa-fw fa-wrench"></i> My Profile</a>
                        </li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </nav>

            <div id="page-wrapper">

                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Your active subscriptions</h1>
                            <ol class="breadcrumb">
                                <li>
                                    <i class="fa fa-dashboard"></i>
                                    <a href="CustDash.jsp">Dashboard</a>
                                </li>
                                <li class="active">
                                    <i class="fa fa-table"></i>
                                    Transactions
                                </li>
                            </ol>
                        </div>
                    </div>
                    <!-- /.row -->

                    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/sst" user="root" password="roy94" />
                    <sql:query dataSource="${snapshot}" var="result">select * from plandb where uid = '${uid}';</sql:query>

                        <div class="row">
                            <h2>Your active subscriptions:</h2>
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>Plan ID</th>
                                            <th>Plan</th>
                                            <th>Space</th>
                                            <th>Routine Checks</th>
                                            <th>Price</th>
                                            <th>Activated on</th>
                                            <th>Expiry</th>
                                            <th>Validity</th>
                                            <th>Remaining</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="row" items="${result.rows}">
                                        <tr>
                                            <td><c:out value="${row.planid}" /></td>
                                            <td><c:out value="${row.plan}" /></td>
                                            <td><c:out value="${row.space}" /></td>
                                            <td><c:out value="${row.rc}" /></td>
                                            <td><c:out value="${row.price}" /></td>
                                            <td><c:out value="${row.pdate}" /></td>
                                            <td><c:out value="${row.edate}" /></td>
                                            <td><c:out value="${row.day}" /></td>
                                            <td>
                                                <sql:update dataSource="${snapshot}" var="count">
                                                    update plandb SET dayr=DATEDIFF(edate,NOW()) where planid='${row.planid}';
                                                </sql:update>
                                                <c:out value="${row.dayr}" />
                                            </td>
                                            <c:set var="total" value="${total + row.price}" />
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- /.row -->

                    <div class="row">
                        <div class="jumbotron">
                            <h2>Total amount paid: <c:out value="${total}" /> /- (till date incl. tax)</h2>
                            <h1>Need invoice?</h1>
                            <p>Please choose a correct Plan ID to generate invoice.</p>
                            <form class="form-inline" method="post" action="invoice.jsp" target="_blank">
                                <div class="form-group">
                                    <input type="text" class="form-control" name="invoice" id="invoice" value="" placeholder="Plan ID">
                                </div>
                                <div class="form-group">
                                    <button class="btn btn-primary btn-md">Generate invoice!</button>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>

            <ol class="breadcrumb" style="text-align: center;">
                <li class="active"><strong>Copyrights:</strong> NSA Warehouse,
                    Jaipur. All rights reserved - 2017</li>
            </ol>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

    </body>

</html>
