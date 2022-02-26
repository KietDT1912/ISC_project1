<%-- 
    Document   : login.jsp
    Created on : Oct 23, 2020, 11:11:59 AM
    Author     : ThinkPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Shop Homepage - Start Bootstrap Template</title>

        <!-- Bootstrap core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/shop-homepage.css" rel="stylesheet">

    </head>

    <body>


        <!-- Page Content -->
        <div class="container">

            <div class="row">
                <div class="col-lg-3"></div>
                <div class="col-lg-6">
                    <form action="login" method="post">
                        <h3>Login Form</h3>
                        <div class="form-group">
                            <label for="exampleInputUsername1">Username</label>
                            <input name="username" type="text" class="form-control" id="exampleInputUsername1" aria-describedby="emailHelp" required>
                            <small id="emailHelp" class="form-text text-muted">We'll never share your username with anyone else.</small>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input name="password" type="password" class="form-control" id="exampleInputPassword1" required>
                            <small id="emailHelp" class="form-text text-muted">We'll never share your password with anyone else.</small>
                        </div>
                        <div class="form-group form-check">
                            <input name="remember" type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">Remember me</label>
                        </div>
                        <h3 style="color: red">${err}</h3>
                        <button type="submit" class="btn btn-primary">Login</button>
                        <button type="button" class="btn btn-warning" onclick="location.href='register'">Register</button>
                    </form>
                </div>
                <div class="col-lg-3"></div>
            </div>

        </div>
        <!-- /.container -->



        <!-- Bootstrap core JavaScript -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    </body>

</html>

