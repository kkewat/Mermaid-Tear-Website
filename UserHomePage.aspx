<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserHomePage.aspx.cs" Inherits="UserHomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE-edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/StyleSheet.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
          <div class="container-fluid">
               <div class="navbar-header">
               <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>                        
               </button>
                  <a class="navbar-brand" href="Default.aspx">
                     <img src="Images/logo/logo2.png" width="70px" height="40px" style="position:relative;top:-10px"/>
                  </a>
                  <a class="navbar-brand" href="Default.aspx">Mermaid Tears</a>
               </div>
             <div class="collapse navbar-collapse" id="myNavbar">
                  <ul class="nav navbar-nav">
                    <li class="active"><a href="Default.aspx">Home</a></li>

                    <li class="dropdown">
                      <a class="dropdown-toggle" data-toggle="dropdown" href="#">Categories <span class="caret"></span></a>
                      <ul class="dropdown-menu">
                        <li class="dropdown-header">Gender</li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Men</a></li>
                        <li><a href="#">Women</a></li>
                        <li><a href="#">Kids</a></li>
                        <li><a href="#">Unisex</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Earings</a></li>
                        <li><a href="#">Pendants</a></li>
                        <li><a href="#">Finger Rings</a></li>
                      </ul>
                    </li>

                     <li class="dropdown">
                      <a class="dropdown-toggle" data-toggle="dropdown" href="#">More<span class="caret"></span></a>
                      <ul class="dropdown-menu">
                        <li><a href="#">About US</a></li>
                        <li><a href="#">Contact us</a></li>
                        <li><a href="#">Guide book</a></li>
                      </ul>
                    </li>

                  </ul>
                  <ul class="nav navbar-nav navbar-right">
                    <li><a href="Registration.aspx"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                    <li><a href="Login.aspx"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                  </ul>
            </div>
          <form class="navbar-form navbar-left" action="/action_page.php">
              <div class="input-group">
                <input type="text" class="form-control" placeholder="Search" name="search">
                <div class="input-group-btn">
                  <button class="btn btn-default" type="submit">
                    <i class="glyphicon glyphicon-search"></i>
                  </button>
                </div>
              </div>
        </form>
         </div>
        </nav>
        </div><br/><br/><br/><br/><hr/>

        <asp:Label ID="LblSuccess" runat="server" CssClass="text-success"></asp:Label>
    <%-- Page bottom Conents Starts --%>
    <footer class="footer_position">
        <div class="container">
            <p class="pull-right"><a href="">Back to top</a></p>
            <p>&copy; Mermaid Tears &middot; <a href="Default.aspx">Home </a>&middot; <a href="#">About</a>&middot;<a href="#">Contact us&middot;</a></p>
        </div>
    </footer>
    <%-- Page bottom Contents Ends --%>
    </form>
</body>
</html>
