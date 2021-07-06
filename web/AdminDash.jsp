<%-- 
    Document   : AdminDash
    Created on : 7 May, 2017, 3:43:45 AM
    Author     : Sayantan
--%>

<%@page import="java.util.Properties"%>
<%@page import="java.util.Enumeration"%>
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
        <link href="https://bootswatch.com/yeti/bootstrap.css" rel="stylesheet">
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
            if (session.getAttribute("uid") == null || session.getAttribute("alvl") == "cust" || session.getAttribute("alvl") == "manager") {
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
                        <a class="navbar-brand fnts" href="AdminDash.jsp">#!/NSA/AdminPanel> <%=fnm%> _</a>
                    </div>
                    <!-- Top Menu Items -->
                    <ul class="nav navbar-right top-nav">
                        <li class="dropdown">
                            <a href="AdminDash.jsp" class="dropdown-toggle fnts" data-toggle="dropdown"><i class="fa fa-user"></i> ${uid} <b class="caret"></b></a>
                            
                            <ul class="dropdown-menu">
                                <li>
                                    <form class="form-inline" method="post" action = "logout">
                                        <center>
                                            <br><input class="form-group btn btn-primary btn-danger" type="submit" value = "Log Out"><br><br>
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
                                <a href="AdminDash.jsp"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
                            </li>
                            <li>
                                <a href="AdminWareDB.jsp"><i class="fa fa-database"></i> Warehouse DB</a>
                            </li>
                            <li>
                                <a href="AdminCustDB.jsp"><i class="fa fa-fw fa-bar-chart-o"></i> Customer DB</a>
                            </li>
                            <li>
                                <a href="AdminMsgDB.jsp"><i class="fa fa-braille"></i> Message DB</a>
                            </li>
                            <li>
                                <a href="AdminAddMan.jsp"><i class="fa fa-money"></i> Add Manager</a>
                            </li>
                            <li>
                                <a href="AdminInbox.jsp"><i class="fa fa-fw fa-envelope"></i> Inbox (<c:out value="${total - 1}" />)</a>
                            </li>
                            <li>
                                <a href="AdminProfile.jsp"><i class="fa fa-fw fa-wrench"></i> My Profile</a>
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

                        <%
                            Date createTime = new Date(session.getCreationTime());
                            Date lastAccessTime = new Date(session.getLastAccessedTime());
                        %>
                        <div class="row">
                            <div class="jumbotron">
                                <h1>Session Information:</h1>
                                <p>Session created on: <%=createTime%></p>
                                <p>Last accessed: <%=lastAccessTime%></p>
                                <a href="http://localhost/phpmyadmin/" target="_blank" class="btn btn-primary btn-lg">Edit Database</a>
                                <br><kbd>#!/NSA/AdminPanel> <%=fnm%> _</kbd>
                            </div>
                        </div>

                        <!-- /.row -->

                        <div class="row container-fluid">
                            <table class="table table-striped table-hover">
                                <tr>
                                    <th>Header Name</th>
                                    <th>Header Value(s)</th>
                                </tr>
                                <%
                                    Enumeration headerNames = request.getHeaderNames();
                                    while (headerNames.hasMoreElements()) {
                                        String paramName = (String) headerNames.nextElement();
                                        out.print("<tr><td>" + paramName + "</td>\n");
                                        String paramValue = request.getHeader(paramName);
                                        out.println("<td> " + paramValue + "</td></tr>\n");
                                    }
                                %>
                            </table>
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">CONSOLE</h3>
                                </div>
                                <div class="panel-body">

                                    <%
                                        Properties p = System.getProperties();
                                        Enumeration keys = p.keys();
                                        while (keys.hasMoreElements()) {
                                            String key = (String) keys.nextElement();
                                            String value = (String) p.get(key);
                                            out.print("<b>" + key + "</b>\n");
                                            out.println("" + value + "<br>\n");
                                        }
                                    %>

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

