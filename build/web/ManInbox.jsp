<%-- 
    Document   : ManInbox
    Created on : 3 May, 2017, 8:19:14 PM
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

        <title>NSA - INBOX</title>

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
                            <li class="active">
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
                                    My profile
                                </h1>
                                <ol class="breadcrumb">
                                    <li>
                                        <i class="fa fa-dashboard"></i>  <a href="ManDash.jsp">Dashboard</a>
                                    </li>
                                    <li class="active">
                                        <i class="fa fa-edit"></i> Inbox
                                    </li>
                                </ol>
                            </div>
                        </div>
                        <!-- /.row -->

                        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/sst" user="root" password="roy94" />
                        <sql:query dataSource="${snapshot}" var="result">select * from msgdb where torecv = '${uid}';</sql:query>

                            <div class="row">
                                <h1>INBOX</h1>
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th>MSG ID</th>
                                                <th>From</th>
                                                <th>Name</th>
                                                <th>Subject</th>
                                                <th>Message</th>
                                                <th>Date & Time</th>
                                                <th>Reply now!</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="row" items="${result.rows}">
                                        <div class="modal fade" id="${row.msgid}" role="dialog">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Send message</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form role="form" method="post" action="MsgSend">
                                                            <div class="form-group">
                                                                <label>To:</label>
                                                                <input class="form-control" id="torecv" name="torecv" value="${row.fromrecv}">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Subject:</label>
                                                                <input class="form-control" id="sub" name="sub" placeholder="message subject">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Message</label>
                                                                <textarea class="form-control" id="msgbody" name="msgbody" rows="5"></textarea>
                                                            </div>
                                                            <button type="submit" class="btn btn-default">SEND</button>
                                                            <button type="reset" class="btn btn-default">RE-TYPE</button>
                                                        </form> 
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <tr>
                                            <td><c:out value="${row.msgid}" /></td>
                                            <td><c:out value="${row.fromrecv}" /></td>
                                            <td><c:out value="${row.sndrfnm} ${row.sndrlnm}" /></td>
                                            <td><c:out value="${row.sub}" /></td>
                                            <td><c:out value="${row.msgbody}" /></td>
                                            <td><c:out value="${row.tym}" /></td>
                                            <td><a class="btn btn-primary btn-sm" href="#" data-toggle="modal" data-target="#${row.msgid}">REPLY</a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <!-- /.row -->

                        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/sst" user="root" password="roy94" />
                        <sql:query dataSource="${snapshot}" var="result">select * from msgdb where fromrecv = '${uid}';</sql:query>

                            <div class="row">
                                <h2>Sent messages</h2>
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>MSG ID</th>
                                                <th>To</th>
                                                <th>Name</th>
                                                <th>Subject</th>
                                                <th>Message</th>
                                                <th>Date & Time</th>
                                                <th>Forward</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="row" items="${result.rows}">
                                        <div class="modal fade" id="${row.msgid}" role="dialog">
                                            <div class="modal-dialog modal-lg">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title">Send message</h4>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form role="form" method="post" action="MsgSend">
                                                            <div class="form-group">
                                                                <label>To:</label>
                                                                <input class="form-control" id="torecv" name="torecv" value="" placeholder="Please input correct USER ID">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Subject:</label>
                                                                <input class="form-control" id="sub" name="sub" value="${row.sub}">
                                                            </div>
                                                            <div class="form-group">
                                                                <label>Message</label>
                                                                <input class="form-control" id="msgbody" name="msgbody" value="${row.msgbody}">
                                                            </div>
                                                            <button type="submit" class="btn btn-default">SEND</button>
                                                            <button type="reset" class="btn btn-default">RE-TYPE</button>
                                                        </form> 
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <tr>
                                            <td><c:out value="${row.msgid}" /></td>
                                            <td><c:out value="${row.torecv}" /></td>
                                            <td><c:out value="${row.sndrfnm} ${row.sndrlnm}" /></td>
                                            <td><c:out value="${row.sub}" /></td>
                                            <td><c:out value="${row.msgbody}" /></td>
                                            <td><c:out value="${row.tym}" /></td>
                                            <td><a class="btn btn-primary btn-sm" href="#" data-toggle="modal" data-target="#${row.msgid}">FORWARD</a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <!-- /.row -->


                        <div class="row jumbotron">
                            <h1>Send message</h1>
                            <br>
                            <form role="form" method="post" action="MsgSend">
                                <div class="form-group">
                                    <label>To:</label>
                                    <input class="form-control" id="torecv" name="torecv" placeholder="Please input correct USER ID">
                                </div>
                                <div class="form-group">
                                    <label>Subject:</label>
                                    <input class="form-control" id="sub" name="sub" placeholder="message subject">
                                </div>
                                <div class="form-group">
                                    <label>Message</label>
                                    <textarea class="form-control" id="msgbody" name="msgbody" rows="5"></textarea>
                                </div>
                                <button type="submit" class="btn btn-default">SEND</button>
                                <button type="reset" class="btn btn-default">RE-TYPE</button>
                            </form>
                        </div>

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
