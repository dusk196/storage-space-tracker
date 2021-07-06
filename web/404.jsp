<%-- 
    Document   : 404
    Created on : 30 Apr, 2017, 1:09:44 AM
    Author     : Sayantan
--%>

<!DOCTYPE html>

<html>
    <head>
        <title>!! 404 !!</title>
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
        <br><br>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="index.jsp"><strong>NSA</strong> Warehouse</a>
                </div>
            </div>
        </nav>

        <div class="container">
            <div class="jumbotron">
                <center>
                    <h1>Oh snap! It's 404!</h1>
                </center>
                <p style="text-align: center;">Either you session has been expired or the page or resource you're requesting is no longer available. If you're accessing a web page after quite sometime or just pressed back button after logging out then we recommended to login again. If this happened while accessing any data then we recommend to submit a ticket to the Warehouse Managers.</p>
                <center>
                    <kbd>IF YOU THINK THIS IS AN ERROR AND YOU WERE EXPECTING SOMETHING ELSE THEN PLEASE CONTACT OUR SYSTEM ADMINISTRATOR AT</kbd>
                    <br>
                    <code>sayantan.roy94@gmail.com</code>
                </center>
            </div>
            <h1>Login <small>Alternatively you can <a href ="index.jsp#signup">register here</a> if you don't have an account now.</small></h1>
            <div class="jumbotron">
                <center>
                    <form class="form-inline" method="post" action="LoginAll">
                        <div class="form-group">
                            <input type="text" class="form-control" name="uid" id="uid" value="" placeholder="Enter your User ID">
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" name="pwd" id="pwd" value="" placeholder="Input your password">
                        </div>
                        <div class="form-group">
                            <select class="form-control custom" name="alvl" id="alvl">
                                <option value="cust">Customer</option>
                                <option value="manager">Warehouse Managers</option>
                                <option value="admin">SysAdmin</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Log me in now!</button>
                        </div>
                        <div class="form-group">
                            <button type="reset" class="btn btn-default">No, I want to reset.</button>
                        </div>
                    </form>
                </center>
            </div>
        </div>
    </body>
</html>
