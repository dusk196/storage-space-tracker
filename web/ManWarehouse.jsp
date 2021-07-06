<%-- 
    Document   : ManWarehouse
    Created on : 3 May, 2017, 8:22:06 PM
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

        <title>NSA - Warehouse</title>

        <!-- Bootstrap Core CSS -->
        <link href="https://bootswatch.com/united/bootstrap.css" rel="stylesheet">

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
                            <li>
                                <a href="ManDash.jsp"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
                            </li>
                            <li class="active">
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
                                    NSA Space Database
                                </h1>
                                <ol class="breadcrumb">
                                    <li>
                                        <i class="fa fa-dashboard"></i>  <a href="ManDash.jsp">Dashboard</a>
                                    </li>
                                    <li class="active">
                                        <i class="fa fa-edit"></i> Space Database
                                    </li>
                                </ol>
                            </div>
                        </div>
                        <!-- /.row -->
                        <div class="row jumbotron">
                            <div class="col-md-6">
                                <h2>Space calculator per user:</h2>
                                <form class="form-inline" method="post" action="ManWarehouse.jsp">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="acpus" id="acpus" value="" placeholder="User ID">
                                    </div>
                                    <div class="form-group">
                                        <button class="btn btn-primary btn-md">Calculate!</button>
                                    </div>
                                </form>
                                <%
                                    String planid = null, plan = null, space = null, price = null, pdate = null, edate = null, day = null, acpus, usedspace = null, freespace = null;

                                    int ts = 0, fs = 0, us = 0;

                                    acpus = request.getParameter("acpus");

                                    Class.forName("com.mysql.jdbc.Driver");
                                    java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sst", "root", "roy94");
                                    Statement st = conn.createStatement();
                                    ResultSet rst = st.executeQuery("select * from plandb where uid='" + acpus + "'");

                                    while (rst.next()) {
                                        space = rst.getString(4);
                                        ts = ts + (Integer.parseInt(space));
                                        usedspace = rst.getString(11);
                                        us = us + (Integer.parseInt(usedspace));
                                        freespace = rst.getString(12);
                                        fs = fs + (Integer.parseInt(freespace));
                                    }
                                    st.close();
                                    conn.close();
                                %>
                                <br>
                                <p>Total Space:<strong> <%=ts%> Sq. Ft.</strong></p>
                                <p>Used Space:<strong> <%=us%> Sq. Ft.</strong></p>
                                <p>Free Space:<strong> <%=fs%> Sq. Ft.</strong></p>
                            </div>
                            <!-- /.row -->

                            <div class="col-md-6">
                                <h2>Space calculator per plan:</h2>
                                <form class="form-inline" method="post" action="ManWarehouse.jsp">
                                    <div class="form-group">
                                        <label>Choose plan to check:</label>
                                        <select class="form-control" id="ptl" name="pts">
                                            <option value="Basic">Basic</option>
                                            <option value="Premium">Premium</option>
                                            <option value="Pro">Pro</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <button class="btn btn-primary btn-md">Calculate!</button>
                                    </div>
                                </form>
                                <%
                                    int tsp = 0, fsp = 0, usp = 0;

                                    String pts = request.getParameter("pts");

                                    Class.forName("com.mysql.jdbc.Driver");
                                    java.sql.Connection connn = DriverManager.getConnection("jdbc:mysql://localhost:3306/sst", "root", "roy94");
                                    Statement stt = connn.createStatement();
                                    ResultSet rstt = stt.executeQuery("select * from plandb where plan='" + pts + "'");

                                    while (rstt.next()) {
                                        space = rstt.getString(4);
                                        tsp = tsp + (Integer.parseInt(space));
                                        usedspace = rstt.getString(11);
                                        usp = usp + (Integer.parseInt(usedspace));
                                        freespace = rstt.getString(12);
                                        fsp = fsp + (Integer.parseInt(freespace));
                                    }

                                    stt.close();
                                    connn.close();
                                %>
                                <br>
                                <p>Total Space:<strong> <%=tsp%> Sq. Ft.</strong></p>
                                <p>Used Space:<strong> <%=usp%> Sq. Ft.</strong></p>
                                <p>Free Space:<strong> <%=fsp%> Sq. Ft.</strong></p>
                            </div>
                            <!-- /.row -->
                        </div>

                        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/sst" user="root" password="roy94" />
                        <sql:query dataSource="${snapshot}" var="result">select * from plandb;</sql:query>

                            <div class="row">
                                <h2>NSA Warehouse total transactions:</h2>
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>Plan ID</th>
                                                <th>User ID</th>
                                                <th>Plan</th>
                                                <th>Space</th>
                                                <th>Used Space</th>
                                                <th>Free Space</th>
                                                <th>Update</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="row" items="${result.rows}">
                                            <tr>
                                        <form method="post" action="ManSpaceUpdate">
                                            <td><input readonly type="text" name="planid" id="planid" value="${row.planid}"></td>
                                            <td><c:out value="${row.uid}" /></td>
                                            <td><c:out value="${row.plan}" /></td>
                                            <td><c:out value="${row.space}" /></td>
                                            <td><input type="text" name="newusedspace" id="newusedspace" value="${row.usedspace}"></td>
                                            <td><c:out value="${row.freespace}" /></td>
                                            <td><button class="btn btn-primary btn-sm" type="submit">UPDATE!</button></td>
                                        </form>
                                        <c:set var="totalspace" value="${totalspace + row.space}" />
                                        <c:set var="spaceu" value="${spaceu + row.usedspace}" />
                                        <c:set var="spacef" value="${spacef + row.freespace}" />
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- /.row -->

                        <div class="row jumbotron">
                            <h2>Total space bought: <strong><c:out value="${totalspace}" /></strong> Sq. Ft.</h2>
                            <h2>Total space used: <strong><c:out value="${spaceu}" /></strong> Sq. Ft.</h2>
                            <h2>Total space free: <strong><c:out value="${spacef}" /></strong> Sq. Ft.</h2>
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

        </body>

    </html>

