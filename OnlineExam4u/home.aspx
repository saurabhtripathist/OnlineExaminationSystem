<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Online_Examination_System.home" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Home </title>
    <!-- Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
</head>

<body>
    <form id="form" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark text-white bg-primary">
            <div class="container">
                <a class="navbar-brand active" href="home.aspx">
                    <i class="bi bi-house"></i>
                    Home
                </a>
            </div>
        </nav>
        <div class=" container">
                <a class="btn btn-primary mt-2 p-auto m-auto" href="index.aspx" role="button">
                    <i class="bi bi-arrow-left-circle"></i>
                </a>
        <div class="row text-center mt-3">
            <div class="card-header bg-danger rounded-5 text-white">
                Login
            </div>
            <div class="col-offset-2 col-md-5 col-lg-6 mt-5">
                <div class="card">
                    <div class="card-body">
                       <i class="bi bi-person-circle"></i>
                        <h5 class="card-title bg-primary rounded-3 text-white pb-1">User Login</h5>  
                        <a href="login.aspx" class="btn btn-primary">Login Here</a>
                         <a href="register.aspx" class="btn btn-primary">User Register</a>
                    </div>
                </div>
            </div>
            <div class="col-offset-2 col-md-5 col-lg-6 mt-5">
                <div class="card">
                    <div class="card-body">
                         <i class="bi bi-person-circle"></i>
                        <h5 class="card-title bg-primary rounded-3 text-white pb-1">Admin Login</h5>
                        <a href="adminlogin.aspx" class="btn btn-primary">Login Here</a>
                         <a href="adminregister.aspx" class="btn btn-primary">Admin Register</a>
                    </div>
                </div>
            </div>
        </div>
            </div>

        <br />
        <br />
        <footer class="bg-primary text-center text-white">

            <div class="container pe-auto">

                <section class=" mb-auto">

                    <a class="btn btn-primary btn-floating m-0"
                        href="#!"
                        role="button">
                        <i class="bi bi-facebook"></i>
                    </a>

                    <a class="btn btn-primary btn-floating m-0"
                        href="#!"
                        role="button">
                        <i class="bi bi-linkedin"></i>
                    </a>

                    <a class="btn btn-primary btn-floating m-0"
                        href="#!"
                        role="button">
                        <i class="bi bi-instagram"></i>
                    </a>

                    <a class="btn btn-primary btn-floating m-0"
                        href="#!"
                        role="button">
                        <i class="bi bi-github"></i>
                    </a>
                </section>
            </div>

            <div class="text-center p-2 pb-2 m-1 bg-success">
                Copyright © 2022
    <a class=" text-white" href="#">OnlineExaminationSytem.com  </a>
            </div>

        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </form>
</body>


</html>
