<%-- 
    Document   : CustWarehouse
    Created on : 1 May, 2017, 12:27:30 AM
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

        <title>NSA - Warehouse</title>

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
                        <li class="active">
                            <a href="CustWarehouse.jsp"><i class="fa fa-fw fa-bar-chart-o"></i> Warehouse</a>
                        </li>
                        <li>
                            <a href="CustInbox.jsp"><i class="fa fa-fw fa-envelope"></i> Inbox (<c:out value="${total - 1}" />)</a>
                        </li>
                        <li>
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
                    <div class="row">
                        <!-- Page Heading -->
                        <div class="row">
                            <div class="col-lg-12">
                                <h1 class="page-header">Warehouse at a glance</h1>
                                <ol class="breadcrumb">
                                    <li>
                                        <i class="fa fa-dashboard"></i>
                                        <a href="CustDash.jsp">Dashboard</a>
                                    </li>
                                    <li class="active">
                                        <i class="fa fa-table"></i>
                                        Warehouse
                                    </li>
                                </ol>
                            </div>
                        </div>
                        <!-- /.row -->

                        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/sst" user="root" password="roy94" />
                        <sql:query dataSource="${snapshot}" var="result">select * from plandb where uid = '${uid}';</sql:query>

                            <div class="row col-md-4">
                                <div class="jumbotron">
                                    <center><h1>SPACE</h1></center>
                                    <div class="table-responsive">
                                        <table class="table table-bordered table-hover table-striped" border="3">
                                            <thead>
                                                <tr>
                                                    <th>Space</th>
                                                    <th>Alloted</th>
                                                    <th>Free</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="row" items="${result.rows}">
                                                <tr>
                                                    <td><c:out value="${row.space}" /></td>
                                                    <td><c:out value="${row.usedspace}" /></td>
                                                    <td><c:out value="${row.freespace}" /></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- /.row -->

                        <div class="row col-md-8">
                            <div class="container-fluid">
                                <center>
                                    <h1>SUPPORT TICKETS</h1>
                                    <h2>Having issues? Contact a Warehouse Manager right away!</h2>
                                </center>
                                <form role="form" method="post" action="MsgSend">
                                    <div class="form-group">
                                        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/sst" user="root" password="roy94" />
                                        <sql:query dataSource="${snapshot}" var="result">select * from custdb where alvl = 'manager';</sql:query>
                                            <label>To</label>
                                            <select class="form-control" id="torecv" name="torecv">
                                            <c:forEach var="row" items="${result.rows}">

                                                <option value="${row.uid}">${row.uid}</option>

                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Issue</label>
                                        <select class="form-control" id="sub" name="sub">
                                            <option value="Ticket: Book my routine check">Book my routine check</option>
                                            <option value="Ticket: Query related to warehouse space">Query related to warehouse space</option>
                                            <option value="Ticket: Query relate to price">Query relate to price</option>
                                            <option value="Ticket: Request to increase space on basis of an emergency">Request to increase space on basis of an emergency</option>
                                            <option value="Ticket: Transporting goods before expiry (no refunds)">Transporting goods before expiry (no refunds)</option>
                                            <option value="Ticket: Technical error i.e wrong information on dashboard">Technical error i.e wrong information on dashboard</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Please explain in brief:</label>
                                        <textarea class="form-control" rows="3" id="msgbody" name="msgbody"></textarea>
                                    </div>
                                    <button type="submit" class="btn btn-default">Submit Button</button>
                                    <button type="reset" class="btn btn-default">Reset Button</button>
                                </form>
                            </div>
                        </div>

                        <!-- /.row -->

                        <div class="row col-md-12">
                            <div>
                                <center>
                                    <h2>Not feeling secured about your logistics?</h2>
                                    <h1>24*7 LIVE VIDEO FEED</h1>
                                </center>
                                <video autoplay="true" id="videoElement" height="100%" width="100%"></video>
                            </div>
                            <script>
                                var video = document.querySelector("#videoElement");
                                navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia || navigator.oGetUserMedia;
                                if (navigator.getUserMedia) {
                                    navigator.getUserMedia({video: true}, handleVideo, videoError);
                                }
                                function handleVideo(stream) {
                                    video.src = window.URL.createObjectURL(stream);
                                }
                                function videoError(e) {
                                }
                            </script>

                        </div>

                        <!-- /.row -->


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

