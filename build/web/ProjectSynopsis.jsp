<%-- 
    Document   : ProjectSynopsis
    Created on : 26 Apr, 2017, 8:04:42 PM
    Author     : Sayantan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Project Synopsis</title>
        <link rel="icon" href="images/fevicon.jpeg" type="image/gif" sizes="16x16">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            body {
                font: 400 15px Lato, sans-serif;
                line-height: 1.8;
                color: #818181;
            }
            h2 {
                font-size: 24px;
                text-transform: uppercase;
                color: #303030;
                font-weight: 600;
                margin-bottom: 30px;
            }
            h4 {
                font-size: 19px;
                line-height: 1.375em;
                color: #303030;
                font-weight: 400;
                margin-bottom: 30px;
            }  
            .jumbotron {
                background-color: #8080ff;
                color: #fff;
                padding: 100px 25px;
                font-family: Montserrat, sans-serif;
            }
            .container-fluid {
                padding: 60px 50px;
            }
            .bg-grey {
                background-color: #f6f6f6;
            }
            .logo-small {
                color: #8080ff;
                font-size: 50px;
            }
            .logo {
                color: #8080ff;
                font-size: 200px;
            }
            .thumbnail {
                padding: 0 0 15px 0;
                border: none;
                border-radius: 0;
            }
            .thumbnail img {
                width: 100%;
                height: 100%;
                margin-bottom: 10px;
            }
            .carousel-control.right, .carousel-control.left {
                background-image: none;
                color: #8080ff;
            }
            .carousel-indicators li {
                border-color: #8080ff;
            }
            .carousel-indicators li.active {
                background-color: #8080ff;
            }
            .item h4 {
                font-size: 19px;
                line-height: 1.375em;
                font-weight: 400;
                font-style: italic;
                margin: 70px 0;
            }
            .item span {
                font-style: normal;
            }
            .panel {
                border: 1px solid #8080ff; 
                border-radius:0 !important;
                transition: box-shadow 0.5s;
            }
            .panel:hover {
                box-shadow: 5px 0px 40px rgba(0,0,0, .2);
            }
            .panel-footer .btn:hover {
                border: 1px solid #8080ff;
                background-color: #fff !important;
                color: #8080ff;
            }
            .panel-heading {
                color: #fff !important;
                background-color: #8080ff !important;
                padding: 25px;
                border-bottom: 1px solid transparent;
                border-top-left-radius: 0px;
                border-top-right-radius: 0px;
                border-bottom-left-radius: 0px;
                border-bottom-right-radius: 0px;
            }
            .panel-footer {
                background-color: white !important;
            }
            .panel-footer h3 {
                font-size: 32px;
            }
            .panel-footer h4 {
                color: #aaa;
                font-size: 14px;
            }
            .panel-footer .btn {
                margin: 15px 0;
                background-color: #8080ff;
                color: #fff;
            }
            .navbar {
                margin-bottom: 0;
                background-color: #8080ff;
                z-index: 9999;
                border: 0;
                font-size: 12px !important;
                line-height: 1.42857143 !important;
                letter-spacing: 4px;
                border-radius: 0;
                font-family: Montserrat, sans-serif;
            }
            .navbar li a, .navbar .navbar-brand {
                color: #fff !important;
            }
            .navbar-nav li a:hover, .navbar-nav li.active a {
                color: #8080ff !important;
                background-color: #fff !important;
            }
            .navbar-default .navbar-toggle {
                border-color: transparent;
                color: #fff !important;
            }
            footer .glyphicon {
                font-size: 20px;
                margin-bottom: 20px;
                color: #8080ff;
            }
            .slideanim {visibility:hidden;}
            .slide {
                animation-name: slide;
                -webkit-animation-name: slide;
                animation-duration: 1s;
                -webkit-animation-duration: 1s;
                visibility: visible;
            }
            @keyframes slide {
                0% {
                    opacity: 0;
                    transform: translateY(70%);
                } 
                100% {
                    opacity: 1;
                    transform: translateY(0%);
                }
            }
            @-webkit-keyframes slide {
                0% {
                    opacity: 0;
                    -webkit-transform: translateY(70%);
                } 
                100% {
                    opacity: 1;
                    -webkit-transform: translateY(0%);
                }
            }
            @media screen and (max-width: 768px) {
                .col-sm-4 {
                    text-align: center;
                    margin: 25px 0;
                }
                .btn-lg {
                    width: 100%;
                    margin-bottom: 35px;
                }
            }
            @media screen and (max-width: 480px) {
                .logo {
                    font-size: 150px;
                }
            }
        </style>
    </head>
    <body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">

        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>                        
                    </button>
                    <a class="navbar-brand" href="#myPage"><strong>SST </strong> Project Synopsis</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#objective">OBJECTIVE</a></li>
                        <li><a href="#users">USERS</a></li>
                        <li><a href="#hlr">HLR</a></li>
                        <li><a href="#nfr">NFR</a></li>
                        <li><a href="#services">SERVICES</a></li>
                        <li><a href="#team">TEAM</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="jumbotron text-center">
            <h1>STORAGE SPACE TRACKER</h1> 
            <p>implemented in & as Warehouse Space Management</p> 
        </div>

        <!-- Container (Objective Section) -->
        <div id="objective" class="container-fluid">
            <div class="row">
                <div class="col-sm-4">
                    <span class="glyphicon glyphicon-eye-open logo"></span>
                </div>
                <div class="col-sm-8">
                    <h2>Objective</h2><br>
                    <h4 style="text-align:justify;">The client is a carrying and forwarding (C&F) agent with a warehouse, where the manufactured / shipped goods of various ultinational companies are stored before they are sent to the wholesale market. Due to increase in customers, it has become difficult for the client to manually manage the warehouse space and ensure that there is no loss of business. The system that the client needs should be able to manage the warehouse space smartly and ensure that there is no loss in business by keeping spaces vacant.</h4>
                </div>
            </div>
        </div>


        <!-- Container (Users Section) -->
        <div id="users" class="container-fluid">
            <div class="row">
                <div class="col-sm-4">
                    <span class="glyphicon glyphicon-list-alt logo"></span>
                </div>
                <div class="col-sm-8">
                    <h2>Users of the system</h2><br>
                    <h4>
                        Multiple profiles of users shall operate this system.
                        <ul>
                            <li>System Adminnistrator</li>
                            <li>Warehouse Manager</li>
                            <li>Customer</li>
                        </ul>
                    </h4>
                </div>
            </div>
        </div>


        <!-- Container (High Level Requirements Section) -->
        <div id="hlr" class="container-fluid">
            <div class="row">
                <div class="col-sm-4">
                    <span class="glyphicon glyphicon-tasks logo"></span>
                </div>
                <div class="col-sm-8">
                    <h2>High Level Requirements</h2><br>
                    <h4 style="text-align:justify;">
                        <ul>
                            <li>The system shall record information about the time that the goods / shipment arrive and leave the ware-house.</li>
                            <li>The system shall use the arrival and departure in-formation to calculate the current space available in the warehouse.</li>
                            <li>The system shall map the allocated space to the customer using a unique customer ID.</li>
                            <li>The system shall maintain information about the companies, the shipment list, and its carry and for-ward activities.</li>
                            <li>The system shall inform the clients as soon as their shipment leaves the warehouse premises, and about the availability of allocated space for them in the warehouse. This will ensure that there is minimal loss of business due to vacant space and ensure optimal usage of the available space by increasing clients. As soon as it receives the information about the departure of a shipment, the system shall retrieve con-tact information about the client using their unique ID.</li>
                            <li>The system shall print the information about the shipment, its arrival time, its departure time, and space that was allocated to the shipment in ware-house in a mail template.</li>
                            <li>The system shall send the mail to the client immediately after the shipment leaves the warehouse.</li>
                            <li>The system shall possess the capability to generate reports about the past and current shipment details for each client, the current shipment details for all the clients at a given point in time, and the current transactions in progress at a specific point in time.</li>
                        </ul>
                    </h4>
                </div>
            </div>
        </div>


        <!-- Container (Non Functional Requirements Section) -->
        <div id="nfr" class="container-fluid">
            <div class="row">
                <div class="col-sm-4">
                    <span class="glyphicon glyphicon-briefcase logo"></span>
                </div>
                <div class="col-sm-8">
                    <h2>Non Functional Requirements</h2><br>
                    <h4 style="text-align:justify;">
                        <ul>
                            <li>Internet Explorer 7.0 above browser compatibility</li>
                            <li>Proper user-id/password based user authentication to allow access to the system.</li>
                        </ul>
                    </h4>
                </div>
            </div>
        </div>


        <!-- Container (Services Section) -->
        <div id="services" class="container-fluid text-center">
            <h2>SERVICES</h2>
            <h4>What we offer</h4>
            <br>
            <div class="row slideanim">
                <div class="col-sm-4">
                    <span class="glyphicon glyphicon-heart logo-small"></span>
                    <h4>LOVE</h4>
                    <p>Lorem ipsum dolor sit amet..</p>
                </div>
                <div class="col-sm-4">
                    <span class="glyphicon glyphicon-lock logo-small"></span>
                    <h4>JOB DONE</h4>
                    <p>Come what it may, we get the job done...</p>
                </div>
                <div class="col-sm-4">
                    <span class="glyphicon glyphicon-wrench logo-small"></span>
                    <h4 style="color:#303030;">HARD WORK</h4>
                    <p>Lorem ipsum dolor sit amet..</p>
                </div>
            </div>
        </div>

        <!-- Container (Team Section) -->
        <div id="team" class="container-fluid text-center bg-grey">
            <h2>THE TEAM</h2><br>
            <h4>Minds behind this project...</h4>
            <div class="row text-center slideanim">
                <div class="col-sm-3">
                    <div class="thumbnail">
                        <img src="images/team/1.jpg" width="300" height="300">
                        <p><strong>SAYANTAN ROY</strong></p>
                        <p>Full stack developer</p>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="thumbnail">
                        <img src="images/team/2.jpg" width="300" height="300">
                        <p><strong>NABATANU BISWAS</strong></p>
                        <p>Front-end support</p>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="thumbnail">
                        <img src="images/team/3.jpg" width="300" height="300">
                        <p><strong>AURODEEP ROY</strong></p>
                        <p>Front-end support</p>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="thumbnail">
                        <img src="images/team/4.jpg" width="300" height="300">
                        <p><strong>SUBRAT GAUTAM</strong></p>
                        <p>MENTOR & GUIDE</p>
                    </div>
                </div>
            </div><br>

            <h2>And we can't be thankful enough to those who helped us to built it.</h2>
            <div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <h4>We thank<br><span>University of Engineering & Management</span>for support.</h4>
                    </div>
                    <div class="item">
                        <h4>We thank<br><span>University of Engineering & Management</span>for support.</h4>
                    </div>
                    <div class="item">
                        <h4>We thank<br><span>University of Engineering & Management</span>for support.</h4>
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>


        <footer class="container-fluid text-center">
            <a href="#myPage" title="To Top">
                <span class="glyphicon glyphicon-chevron-up"></span>
            </a>
            <p><strong>Copyrights:</strong> NSA Warehouse, Jaipur. All rights reserved - 2017</p>
        </footer>

        <script>
            $(document).ready(function () {
                // Add smooth scrolling to all links in navbar + footer link
                $(".navbar a, footer a[href='#myPage']").on('click', function (event) {
                    // Make sure this.hash has a value before overriding default behavior
                    if (this.hash !== "") {
                        // Prevent default anchor click behavior
                        event.preventDefault();

                        // Store hash
                        var hash = this.hash;

                        // Using jQuery's animate() method to add smooth page scroll
                        // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
                        $('html, body').animate({
                            scrollTop: $(hash).offset().top
                        }, 900, function () {

                            // Add hash (#) to URL when done scrolling (default click behavior)
                            window.location.hash = hash;
                        });
                    } // End if
                });

                $(window).scroll(function () {
                    $(".slideanim").each(function () {
                        var pos = $(this).offset().top;

                        var winTop = $(window).scrollTop();
                        if (pos < winTop + 600) {
                            $(this).addClass("slide");
                        }
                    });
                });
            });
        </script>

    </body>
</html>
