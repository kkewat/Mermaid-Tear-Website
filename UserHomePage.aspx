<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserHomePage.aspx.cs" Inherits="UserHomePage" EnableEventValidation="false" %>

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
                     <img src="Images/logo/logo2.png" width="70" height="40" style="position:relative;top:-10px"/>
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
                    <li ><a href="Products.aspx">All Products</a></li>
                  </ul>
                  <ul class="nav navbar-nav navbar-right">
                    <li>
                        <asp:Button ID="loginbtn" CssClass="btn btn-default navbar-btn glyphicon-log-in" runat="server" Text="Logout" OnClick="loginbtn_Click" />
                        <asp:Button ID="logoutbtn" CssClass="btn btn-default navbar-btn glyphicon-log-out" runat="server" Text="Logout" OnClick="logoutbtn_Click" />

                    </li>
                    <li><button id="Cart" class="btn btn-primary navbar-btn glyphicon glyphicon-shopping-cart" type="button" > Cart&nbsp<span id="num" class="badge" runat="server">6</span></button></li>
                  </ul>
            </div>
          <form class="navbar-form navbar-left" action="/action_page.php">
              <div class="input-group">
                <input type="text" class="form-control" placeholder="Search" name="search" />
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

<%-- Image Slider Start --%>
      <br/> <br /><br /><br /> <hr />
     <div class="container">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="Images/Slider/Slider7.jpg" alt="" title="image taken from google.com" style="height:386px; width:100%;" />
        <div class="carousel-caption">
        <h3>Bracelets</h3>
        <p>Flat 25% Off On Bracelets</p>
      </div>
      </div>

      <div class="item">
        <img src="Images/Slider/Slider9.jpg" alt="" style="height:386px; width:100%;" />
      </div>
    
      <div class="item">
        <img src="Images/Slider/Slider8.jpg" alt="" style="height:386px; width:100%;" />
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<%-- Image Slider End --%>
    
    <hr />
<%-- Page Contents Starting --%>
    <div class="container-fluid">
    <%--<h1>Hello World!</h1>--%>
  <div class="row">
    <div class="col-xs-6 col-sm-3" style="background-color:lavender;text-align:center">
      <a href="#">
      <img class="img-circle" src="Images/dod img/Rings_dod.jpg" alt="Rings" height="150" width="150" />
      <h2>Rings</h2>
      </a>
    </div>
    <div class="col-xs-6 col-sm-3" style="background-color:lavenderblush;text-align:center">
      <a href="#">
      <img class="img-circle" src="Images/dod img/Neckalce_floral.JPG" alt="Floral Design Necklaces" height="150" width="150"/>
      <h2>Floral Necklaces</h2>
      </a>
    </div>
    <!-- Add clearfix for only the required viewport -->
    <div class="clearfix visible-xs"></div>
    <div class="col-xs-6 col-sm-3" style="background-color:lightcyan;text-align:center">
      <a href="#">
      <img class="img-circle" src="Images/dod img/Bangles.jpg" alt="Bangles" height="150" width="150"/>
      <h2>Bangles </h2>
      </a>
    </div>
    <div class="col-xs-6 col-sm-3" style="background-color:lightgray;text-align:center">
      <a href="#">
      <img class="img-circle" src="Images/dod img/Gold coin.jpg" alt="Gold Coins" height="150" width="150"/>
      <h2>Gold & Silver Coins</h2>
      </a>
    </div>
  </div>
</div>
<hr/>


    </form>
<%-- Page bottom Contents Starts --%>
    <footer>
        <div class="container">
            <p class="pull-right"><a href="#">Back to top</a></p>
            <p>&copy; Mermaid Tears &middot; <a href="Default.aspx">Home </a>&middot; <a href="#">About</a><a href="#">Contact us&middot;</a></p>
        </div>
    </footer>
<%-- Page bottom Contents Ends --%>
</body>
</html>
