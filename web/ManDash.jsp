<%-- 
    Document   : ManDash
    Created on : 3 May, 2017, 2:52:06 PM
    Author     : Sayantan
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.io.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>

<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <link rel="icon" href="images/fevicon.jpeg" type="image/gif" sizes="16x16">

        <title>NSA - Dashboard</title>

        <!-- Bootstrap Core CSS -->
        <link href="https://bootswatch.com/united/bootstrap.css" rel="stylesheet">
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

        <!-- Custom CSS -->
        <link href="css/sb-admin.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="css/plugins/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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

            @media(min-width:768px) {
                .side-nav {
                    background-color: #222222;
                }

                .top-nav>li>a {
                    color: #000000;
                }
                .fnts{
                    font-size: 22px;
                }          
                .top-nav>li>a {
                    color: #ffffff;
                }
            </style>

        </head>

        <%
            session = request.getSession();
            if (session.getAttribute("uid") == null || session.getAttribute("alvl").equals("cust") || session.getAttribute("alvl").equals("admin")) {
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
                    System.out.println(uid + "    " + pwd + "    " + rs.getString(3) + "    " + rs.getString(4) + "    " + rs.getString(5) + "    " + rs.getString(6) + "    " + rs.getString(7) + "    " + rs.getString(8) + "    " + rs.getString(9) + "    " + rs.getString(10));
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

            <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/sst" user="root" password="roy94" />
            <sql:query dataSource="${snapshot}" var="result">select * from plandb;</sql:query>
            <c:forEach var="row" items="${result.rows}">  
                <c:set var="totalspace" value="${totalspace + row.space}" />
                <c:set var="usedspace" value="${usedspace + row.usedspace}" />
                <c:set var="freespace" value="${freespace + row.freespace}" />
                <c:set var="totalprice" value="${totalprice + row.price}" />
            </c:forEach>


            <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/sst" user="root" password="roy94" />
            <sql:query dataSource="${snapshot}" var="result">select * from plandb;</sql:query>
            <c:set var="Pro" value="Pro" />
            <c:set var="Basic" value="Basic" />
            <c:set var="Premium" value="Premium" />
            <c:forEach var="row" items="${result.rows}"> 
                <c:choose>
                    <c:when test = "${row.plan == Pro}">
                        <c:set var="proprice" value="${proprice + row.price}" />
                        <c:set var="prospace" value="${prospace + row.space}" />
                    </c:when>
                    <c:when test = "${row.plan == Basic}">
                        <c:set var="basicprice" value="${basicprice + row.price}" />
                        <c:set var="basicspace" value="${basicspace + row.space}" />
                    </c:when>
                    <c:when test = "${row.plan == Premium}">
                        <c:set var="preprice" value="${preprice + row.price}" />
                        <c:set var="prespace" value="${prespace + row.space}" />
                    </c:when>
                    <c:otherwise>
                      </c:otherwise>
                </c:choose>
            </c:forEach>

            <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/sst" user="root" password="roy94" />
            <sql:query dataSource="${snapshot}" var="result">select * from plandb;</sql:query>
            <c:set var="Pro1" value="Pro" />
            <c:set var="Basic1" value="Basic" />
            <c:set var="Premium1" value="Premium" />
            <c:forEach var="row" items="${result.rows}"> 
                <c:choose>
                    <c:when test = "${row.plan == Pro1}">
                        <c:set var="procust" value="${procust + 1}" />
                    </c:when>
                    <c:when test = "${row.plan == Basic1}">
                        <c:set var="basiccust" value="${basiccust + 1}" />
                    </c:when>
                    <c:when test = "${row.plan == Premium1}">
                        <c:set var="precust" value="${precust + 1}" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="nonecust" value="${nonecust + 1}" />
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/sst" user="root" password="roy94" />
            <sql:query dataSource="${snapshot}" var="result">select * from custdb;</sql:query>
            <c:forEach var="row" items="${result.rows}">            
                <c:set var="totalusers" value="${totalusers + 1}" />
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
                        <a class="navbar-brand fnts" href="ManDash.jsp">Manager Dashboard : <%=fnm%></a>
                    </div>
                    <!-- Top Menu Items -->
                    <ul class="nav navbar-right top-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle fnts" data-toggle="dropdown"><i class="fa fa-user"></i> ${uid} <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="ManProfile.jsp"><i class="fa fa-fw fa-user"></i> Profile</a>
                                </li>
                                <li>
                                    <a href="ManInbox.jsp"><i class="fa fa-fw fa-envelope"></i> Inbox (<c:out value="${total - 1}" />)</a>
                                </li>
                                <li>
                                    <a href="ManWarehouse.jsp"><i class="fa fa-fw fa-gear"></i> Warehouse</a>
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
                            <li class="active">
                                <a href="ManDash.jsp"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
                            </li>
                            <li>
                                <a href="ManWarehouse.jsp"><i class="fa fa-database"></i> Warehouse DB</a>
                            </li>
                            <li>
                                <a href="ManCustDB.jsp"><i class="fa fa-fw fa-bar-chart-o"></i> Customer DB</a>
                            </li>
                            <li>
                                <a href="ManSpaceDB.jsp"><i class="fa fa-braille"></i> Space DB</a>
                            </li>
                            <li>
                                <a href="ManTransDB.jsp"><i class="fa fa-money"></i> Transaction DB</a>
                            </li>
                            <li>
                                <a href="ManInbox.jsp"><i class="fa fa-fw fa-envelope"></i> Inbox (<c:out value="${total - 1}" />)</a>
                            </li>
                            <li>
                                <a href="ManProfile.jsp"><i class="fa fa-fw fa-wrench"></i> My Profile</a>
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
                                <h1 class="page-header">
                                    Dashboard <small>Statistics Overview</small>
                                </h1>
                                <ol class="breadcrumb">
                                    <li class="active">
                                        <i class="fa fa-dashboard"></i> Dashboard
                                    </li>
                                </ol>
                            </div>
                        </div>
                        <!-- /.row -->

                        <div class="row">
                            <div class="col-lg-3 col-md-6">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <i class="fa fa-comments fa-5x"></i>
                                            </div>
                                            <div class="col-xs-9 text-right">
                                                <div class="huge"><c:out value="${total - 1}" /></div>
                                                <div>INBOX!</div>
                                            </div>
                                        </div>
                                    </div>
                                    <a href="ManInbox.jsp">
                                        <div class="panel-footer">
                                            <span class="pull-left">Read Now!</span>
                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                            <div class="clearfix"></div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="panel panel-green">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <i class="fa fa-tasks fa-5x"></i>
                                            </div>
                                            <div class="col-xs-9 text-right">
                                                <div class="huge"><c:out value="${150000-usedspace}" /></div>
                                                <div>Space Remaining</div>
                                            </div>
                                        </div>
                                    </div>
                                    <a href="ManSpaceDB.jsp">
                                        <div class="panel-footer">
                                            <span class="pull-left">Upgrade Now!</span>
                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                            <div class="clearfix"></div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="panel panel-yellow">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <i class="fa fa-shopping-cart fa-5x"></i>
                                            </div>
                                            <div class="col-xs-9 text-right">
                                                <div class="huge"><c:out value="${totalprice}" /></div>
                                                <div>Transactions (INR)</div>
                                            </div>
                                        </div>
                                    </div>
                                    <a href="ManTransDB.jsp">
                                        <div class="panel-footer">
                                            <span class="pull-left">Upgrade Now!</span>
                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                            <div class="clearfix"></div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6">
                                <div class="panel panel-red">
                                    <div class="panel-heading">
                                        <div class="row">
                                            <div class="col-xs-3">
                                                <i class="fa fa-support fa-5x"></i>
                                            </div>
                                            <div class="col-xs-9 text-right">
                                                <div class="huge"><c:out value="${totalusers - 1}" /></div>
                                                <div>Active Users!</div>
                                            </div>
                                        </div>
                                    </div>
                                    <a href="ManCustDB.jsp">
                                        <div class="panel-footer">
                                            <span class="pull-left">Details!</span>
                                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                            <div class="clearfix"></div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- /.row -->

                        <%
                            Date createTime = new Date(session.getCreationTime());
                            Date lastAccessTime = new Date(session.getLastAccessedTime());
                        %>
                        <div class="row">
                            <div class="jumbotron">
                                <h1>Session Information:</h1>
                                <p>Session created on: <%=createTime%></p>
                                <p>Last accessed: <%=lastAccessTime%></p>
                                <kbd>IF YOU NOTICE SOMETHING ODD PLEASE REPORT TO SYSTEM ADMIN AT sayantan.roy94@gmail.com</kbd>
                            </div>
                        </div>

                        <!-- /.row -->

                        <div class="row container-fluid">
                            <div class = "col-md-6">
                                <div class ="panel panel-primary">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">Space Allocation (per plan)</h3>
                                    </div>
                                    <div class="panel-body">
                                        <script type="text/javascript">
                                            google.charts.load("current", {packages: ["corechart"]});
                                            google.charts.setOnLoadCallback(drawChart);
                                            function drawChart() {
                                                var data = google.visualization.arrayToDataTable([
                                                    ['PLAN', 'Space in Sq. Ft.'],
                                                    ['PRO', <c:out value="${prospace}" />],
                                                    ['PREMIUM', <c:out value="${prespace}" />],
                                                    ['BASIC', <c:out value="${basicspace}" />]
                                                ]);

                                                var options = {
                                                    title: 'Space Allocation per plan',
                                                    legend: 'none',
                                                    pieSliceText: 'label',
                                                    slices: {3: {offset: 0.1},
                                                        0: {offset: 0.05},
                                                        1: {offset: 0.01},
                                                        2: {offset: 0.15},
                                                    },
                                                };

                                                var chart = new google.visualization.PieChart(document.getElementById('piechart'));
                                                chart.draw(data, options);
                                            }
                                        </script>
                                        <div id="piechart" style="width: 100%; height: 500px;"></div>
                                    </div>
                                </div>
                            </div>

                            <div class = "col-md-6">
                                <div class = "panel panel-primary">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">Price Allocation (per plan)</h3>
                                    </div>
                                    <div class="panel-body">
                                        <script type="text/javascript">
                                            google.charts.load("current", {packages: ["corechart"]});
                                            google.charts.setOnLoadCallback(drawChart);
                                            function drawChart() {
                                                var data = google.visualization.arrayToDataTable([
                                                    ['PLAN', 'Price in INR'],
                                                    ['Basic', <c:out value="${basicprice}" />],
                                                    ['Pro', <c:out value="${proprice}" />],
                                                    ['Premium', <c:out value="${preprice}" />]
                                                ]);

                                                var options = {
                                                    title: 'Price Allocation per plan',
                                                    is3D: true,
                                                };

                                                var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
                                                chart.draw(data, options);
                                            }
                                        </script>
                                        <div id="piechart_3d" style="width: 100%; height: 500px;"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- /.row -->

                        <div class="row container-fluid">
                            <div class = "col-md-6">
                                <div class = "panel panel-primary">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">Monitor Warehouse Space</h3>
                                    </div>
                                    <div class="panel-body">
                                        <script type="text/javascript">
                                            google.charts.load("current", {packages: ["corechart"]});
                                            google.charts.setOnLoadCallback(drawChart);
                                            function drawChart() {
                                                var data = google.visualization.arrayToDataTable([
                                                    ['SPACE', 'Sq. Ft.'],
                                                    ['TOTAL SPACE', <c:out value="${totalspace}" />],
                                                    ['FREE SPACE', <c:out value="${freespace}" />],
                                                    ['USED SPACE', <c:out value="${usedspace}" />]
                                                ]);

                                                var options = {
                                                    title: 'Graphical Space Allocation',
                                                    pieHole: 0.4,
                                                };

                                                var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
                                                chart.draw(data, options);
                                            }
                                        </script>
                                        <div id="donutchart" style="width: 100%; height: 500px;"></div>
                                    </div>
                                </div>
                            </div>

                            <div class = "col-md-6">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">User Ratio (per plan)</h3>
                                    </div>
                                    <div class="panel-body">
                                        <script type="text/javascript">
                                            google.charts.load("current", {packages: ["corechart"]});
                                            google.charts.setOnLoadCallback(drawChart);
                                            function drawChart() {
                                                var data = google.visualization.arrayToDataTable([
                                                    ["USER NO", "PLAN", {role: "style"}],
                                                    ["BASIC", <c:out value="${basiccust - 1}" />, "color: #00AA36"],
                                                    ["PRO", <c:out value="${procust - 1}" />, "color: #CA2E55"],
                                                    ["PREMIUM", <c:out value="${precust - 1}" />, "color: #FA700F"],
                                                    ["NONE", <c:out value="${nonecust} - 1" />, "color: #440A6E"]
                                                ]);

                                                var view = new google.visualization.DataView(data);
                                                view.setColumns([0, 1,
                                                    {calc: "stringify",
                                                        sourceColumn: 1,
                                                        type: "string",
                                                        role: "annotation"},
                                                    2]);

                                                var options = {
                                                    title: "User Ratio (per plan)",
                                                    bar: {groupWidth: "95%"},
                                                    legend: {position: "none"},
                                                };
                                                var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
                                                chart.draw(view, options);
                                            }
                                        </script>
                                        <div id="barchart_values" style="width: 100%; height: 500px;"></div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- /.row -->


                    </div>
                    <!-- /.container-fluid -->

                </div>
                <ol class="breadcrumb" style="text-align: center;">
                    <li class="active"><strong>Copyrights:</strong> NSA Warehouse, Jaipur. All rights reserved - 2017</li>
                </ol>
                <!-- /#page-wrapper -->

            </div>
            <!-- /#wrapper -->

            <!-- jQuery -->
            <script src="js/jquery.js"></script>

            <!-- Bootstrap Core JavaScript -->
            <script src="js/bootstrap.min.js"></script>

            <!-- Morris Charts JavaScript -->
            <script src="js/plugins/morris/raphael.min.js"></script>
            <script src="js/plugins/morris/morris.min.js"></script>
            <script src="js/plugins/morris/morris-data.js"></script>

        </body>

    </html>
