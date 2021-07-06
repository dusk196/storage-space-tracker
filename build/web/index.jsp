<%-- 
    Document   : index
    Created on : 23 Apr, 2017, 4:04:04 AM
    Author     : Sayantan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>NSA Warehouse :: HOME PAGE</title>
        <link rel="icon" href="images/fevicon.jpeg" type="image/gif" sizes="16x16">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://bootswatch.com/flatly/bootstrap.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <style>
            .top_space {
                padding-top: 80px;
            }
            a.disabled {
                pointer-events: none;
                cursor: default;
            }
            button.disabled {
                pointer-events: none;
                cursor: default;
            }
        </style>

    </head>
    <body>

        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand disabled" href="#"><strong>NSA</strong> Warehouse</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">HOME<span class="sr-only">(current)</span></a></li>
                        <li><a href="#" data-toggle="modal" data-target="#aboutUs">ABOUT US</a></li>
                        <li><a href="#" data-toggle="modal" data-target="#pricing">PRICING</a></li>
                        <li><a href="#" data-toggle="modal" data-target="#contactUs">CONTACT US</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#signup"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;Sign Up</a></li>
                        <li><a href="#login"><span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="modal fade" id="aboutUs" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Welcome to NSA Warehouse</h4>
                    </div>
                    <div class="modal-body">
                        <p class="text-justify">A premier Warehousing Agency in India, established during 2017 providing logistics support to various sectors and is one of the biggest public warehouse operators in the country offering logistics services to a diverse group of clients.<br /><br />NSA Warehouse is operating 22 acres of Warehousing complex in Jaipur with a storage capacity of 9 thousand tonnes providing warehousing services for a wide range of products ranging from agricultural produce to sophisticated industrial products.<br /><br />Warehousing activities of NSA include foodgrain warehouses, industrial warehousing, custom bonded warehouses, container freight stations, inland clearance depots and aircargo complexes.<br /><br />Apart from storage and handling, NSA also offers services in the area of clearing & forwarding, handling & transporation, procurement & distribution, disinfestation services, fumigation services and other ancillary activities.<br /><br />NSA also offers consultancy services/ training for the construction of warehousing infrastructure to different agencies.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="contactUs" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">We are just a click away!</h4>
                    </div>
                    <div class="row modal-body">
                        <div class="col-md-4">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Address</h3>
                                </div>
                                <div class="panel-body">123/A, ABC XYZ Road, Jaipur - 303807</div>
                            </div>
                            <div class="panel panel-success">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Contact Details</h3>
                                </div>
                                <div class="panel-body"><strong>Phone:</strong> +91 98300 54321<br /><strong>Email:</strong> nsa_warehouse@qwerty.in</div>
                            </div>
                            <div class="panel panel-warning">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Open hours (office)</h3>
                                </div>
                                <div class="panel-body"><strong>Weekdays:</strong> 9AM - 5PM<br />Except national holidays.</div>
                            </div>
                            <div>
                                <img src="images/glyphicons-social/glyphicons-social-31-facebook.png">
                                <img src="images/glyphicons-social/glyphicons-social-32-twitter.png">
                                <img src="images/glyphicons-social/glyphicons-social-39-skype.png">
                                <img src="images/glyphicons-social/glyphicons-social-18-linked-in.png">
                                <img src="images/glyphicons-social/glyphicons-social-62-whatsapp.png">
                            </div>
                        </div>

                        <div class="col-md-8">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3548.198627267543!2d75.69817231453128!3d27.212912982999278!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2zMjfCsDEyJzQ2LjUiTiA3NcKwNDInMDEuMyJF!5e0!3m2!1sen!2sin!4v1492515115251" width="100%" height="400" frameborder="0" style="border:0" allowfullscreen></iframe>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="pricing" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title" style="text-align:center;">C H E A P E S T&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;P R I C E&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;G U A R A N T E E D</h4>
                    </div>
                    <div class="modal-body">
                        <div id="pricing" class="container-fluid">
                            <div class="text-center">
                                <h2>Pricing</h2>
                                <h4>Choose a payment plan that works for you. You can select preferred package after <a href="#login">login</a>.</h4>
                            </div>
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
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-8 top_space">
            <div id="myCarousel" class="carousel slide" data-interval="3000" data-ride="carousel">

                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                    <li data-target="#myCarousel" data-slide-to="3"></li>
                </ol>

                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="images/1.jpg">
                        <div class="carousel-caption">
                            <h2>NSA WAREHOUSE</h2>
                            <p>Welcome to the automated Warehouse Space Management</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/2.jpg">
                        <div class="carousel-caption">
                            <h2>STORAGE SPACE TRACKER</h2>
                            <p>We use the algorithm of Storage Space Tracker is implemented to manage the space of this warehouse efficiently.</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/3.jpg">
                        <div class="carousel-caption">
                            <h2>FAST OR BEST - Choice is yours!</h2>
                            <p>We specifically use two algorithms specially to serve all your needs, based on how faster is the result (OR) how efficient it is.</p>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/4.jpg">
                        <div class="carousel-caption">
                            <h2>THE TEAM</h2>
                            <p>Made by: Sayantan Roy, Nabatanu Biswas & Aurodeep Roy under guidance of Asst. Prof. Subrat Gautam</p>
                        </div>
                    </div>
                </div>

                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>

                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
            <br />
            <div class="row">
                <div class="row container-fluid">
                    <div class="col-md-6">
                        <img style="width:100%" src="images/5.jpg">
                    </div>
                    <div class="col-md-6">
                        <blockquote class="blockquote-reverse">
                            <h2>BIGGER SPACE</h2>
                            <p>
                                NSA Warehouse is operating on 22 acres of Warehousing complex in Jaipur with a storage capacity of 9 thousand tonnes which is one of the largest warehousing complex in India.
                            </p>
                        </blockquote>
                    </div>
                </div>
                <br />
                <div class="row container-fluid">
                    <div class="col-md-6">
                        <blockquote class="blockquote-default">
                            <h2>LESSER PRICE</h2><p>Logistics which keeps your wallet happy & healthy ;)<br /><a href="#" data-toggle="modal" data-target="#pricing">Check out our pricing chart</a></p>
                        </blockquote>
                    </div>
                    <div class="col-md-6">
                        <img style="width:100%" src="images/6.jpg">
                    </div>
                </div>
                <br />

                <div class="row container-fluid">
                    <div class="col-md-6">
                        <img style="width:100%" src="images/7.jpg">
                    </div>
                    <div class="col-md-6">
                        <blockquote class="blockquote-reverse">
                            <h2>24*7 Surveillance System </h2><p>Your goods' security is our top-most priority. Advanced security & proximity alarm will never let any trespassers to housebreak.</p>
                        </blockquote>
                    </div>
                </div>
                <br />
                <div class="row container-fluid">
                    <div class="col-md-6">
                        <blockquote class="blockquote-default">
                            <h2>Advanced Fire Breakout Prevention</h2><p>We got top-grade sprinkler system & military-grade fire-extinguishers to prevent any kind of incineratation.</p>
                        </blockquote>
                    </div>
                    <div class="col-md-6">
                        <img style="width:100%" src="images/8.jpg">
                    </div>
                </div>
                <br />
                <div class="row container-fluid">
                    <div class="col-md-6">
                        <img style="width:100%" src="images/9.jpg">
                    </div>
                    <div class="col-md-6">
                        <blockquote class="blockquote-reverse">
                            <h2>Convenient Transportation</h2><p>Located right beside NH-52. Only 5KM away from Jaipur Railway Station & 15KM away from Jaipur Airport.</p>
                        </blockquote>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4 container-fluid top_space">
            <div class="jumbotron">
                <h1>Attention</h1>
                <p>This is fully-functional sample warehouse website, used to demonstrate a storage space tracker implemented as warehouse space management.</p>
                <p><a class="btn btn-primary btn-lg" href="ProjectSynopsis.jsp" target="_blank">Learn more</a></p>
            </div>
            <a name="login"></a>
            <div class="jumbotron">
                <form class="form-horizontal row" method="post" action="LoginAll">
                    <fieldset>
                        <nav class="navbar navbar-default container-fluid row">
                            <div class="container-fluid">
                                <div class="navbar-header">
                                    <a class="navbar-brand disabled" href="#">LOGIN</a>
                                </div>
                            </div>
                        </nav>
                        <div class="form-group">
                            <label for="inputPassword" class="col-lg-4 control-label">User ID</label>
                            <div class="col-lg-8">
                                <input type="text" class="form-control" name="uid" id="uid" value="" placeholder="Username" />
                            </div>
                        </div>	
                        <div class="form-group">
                            <label for="inputPassword" class="col-lg-4 control-label">Password</label>
                            <div class="col-lg-8">
                                <input type="password" class="form-control" name="pwd" id="pwd" value="" placeholder="Password" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="select" class="col-lg-4 control-label">Access Level</label>
                            <div class="col-lg-8">
                                <select class="form-control" name="alvl" id="alvl">
                                    <option value="cust">Customer</option>
                                    <option value="manager">Warehouse Managers</option>
                                    <option value="admin">SysAdmin</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="checkbox col-lg-8 col-lg-offset-4">
                                <label>
                                    <input type="checkbox">Remember Me
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-8 col-lg-offset-4">
                                <button type="reset" class="btn btn-default">Cancel</button>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>

            <a name="signup"></a>
            <div class="jumbotron">
                <form class="form-horizontal row" method="post" action="CustReg">
                    <fieldset>
                        <nav class="navbar navbar-default container-fluid row">
                            <div class="container-fluid">
                                <div class="navbar-header">
                                    <a class="navbar-brand disabled" href="#">Sign Up</a>
                                </div>
                            </div>
                        </nav>
                        <div class="form-group">
                            <label for="textArea" class="col-lg-4 control-label">First Name</label>
                            <div class="col-lg-8">
                                <input type="text" class="form-control" name="fnm" id="fnm" value="" placeholder="First Name" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="textArea" class="col-lg-4 control-label">Last Name</label>
                            <div class="col-lg-8">
                                <input type="text" class="form-control" name="lnm" id="lnm" value="" placeholder="Last Name" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="inputPassword" class="col-lg-4 control-label">User ID</label>
                            <div class="col-lg-8">
                                <input disabled type="text" class="form-control" placeholder="will be auto-generated">
                            </div>
                        </div>	
                        <div class="form-group">
                            <label for="inputPassword" class="col-lg-4 control-label">Password</label>
                            <div class="col-lg-8">
                                <input disabled type="password" class="form-control" id="inputPassword" placeholder="will be auto-generated">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="textArea" class="col-lg-4 control-label">Address</label>
                            <div class="col-lg-8">
                                <input type="text" class="form-control" name="adr" id="adr" value="" placeholder="Address" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="textArea" class="col-lg-4 control-label">Phone No.</label>
                            <div class="col-lg-8">
                                <input type="text" name="phn" class="form-control" id="phn" value="" placeholder="Phone Number" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-4 control-label">Gender</label>
                            <div class="col-lg-8">
                                <div class="radio">
                                    <label>
                                        <input type="radio" id="Male" name="gndr" value="Male" checked>
                                        Male
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" id="Female" name="gndr" value="Female">
                                        Female
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" id="Other" name="gndr" value="Other">
                                        Other
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="textArea" class="col-lg-4 control-label">Age</label>
                            <div class="col-lg-8">
                                <input type="text" class="form-control" name="dob" id="dob" value="" placeholder="D.O.B" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="textArea" class="col-lg-4 control-label">E-mail</label>
                            <div class="col-lg-8">
                                <input type="email" name="email" class="form-control" id="email" value="" placeholder="E-Mail" />
                            </div>
                        </div>
                        <div class="checkbox col-lg-8 col-lg-offset-4">
                            <label>
                                <input type="checkbox">I accept the Terms & Conditions
                            </label>
                        </div>
                        <br /><br /><br />
                        <div class="form-group">
                            <div class="col-lg-8 col-lg-offset-4">
                                <button type="reset" class="btn btn-default">Cancel</button>
                                <input type="submit" class="btn btn-primary" />
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>

        <div class="col-md-12">
            <div class="well well-sm" style="text-align:center;">
                <strong>Copyrights:</strong> NSA Warehouse, Jaipur. All rights reserved - 2017
            </div>
        </div>
    </body>
</html>