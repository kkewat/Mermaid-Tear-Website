﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Gold Shop Website</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE-edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/StyleSheet.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <script>
        $(document).ready(function myfunc() {
            $("#Cart").click(function myfunc() {
                window.location.href = "/Cart.aspx";
            });
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%-- Navigation Bar and Header start --%>
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
                                <img src="Images/logo/logo2.png" width="70px" height="40px" style="position: relative; top: -10px" />
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
                                        <li><a href="ViewCats.aspx?searchCat=Men">Men</a></li>
                                        <li><a href="ViewCats.aspx?searchCat=Women">Women</a></li>
                                        <li><a href="ViewCats.aspx?searchCat=Children">Kids</a></li>
                                        <li><a href="ViewCats.aspx?searchCat=Unisex">Unisex</a></li>
                                        <li role="separator" class="divider"></li>
                                        <li><a href="ViewCats.aspx?searchCat=Earrings">Earrings</a></li>
                                        <li><a href="ViewCats.aspx?searchCat=Pendants">Pendants</a></li>
                                        <li><a href="ViewCats.aspx?searchCat=Finger Rings">Finger Rings</a></li>
                                    </ul>
                                </li>

                                <li class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Chatbot & More<span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="Chatbot.html">Chatbot</a></li>
                                        <li><a href="AboutUs.aspx">About US</a></li>
                                        <li><a href="ContactUs">Contact us</a></li>
                                        <li><a href="Guide.aspx">Guide book</a></li>
                                    </ul>
                                </li>

                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li id="Registerbtn" runat="server"><a href="Registration.aspx"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>
                                <li id="loginbtn" runat="server"><a href="Login.aspx"><span class="glyphicon glyphicon-log-in"></span>Login</a></li>
                                <li>
                                    <asp:LinkButton runat="server" ID="Cart" type="button" OnClick="Cart_Click"><span aria-hidden="true" class="glyphicon glyphicon-shopping-cart">Cart</span><span id="num" class="badge" runat="server">6</span></asp:LinkButton>
                                </li>
                            </ul>
                        </div>
                        <form class="navbar-form navbar-left" action="/action_page.php">
                            <div class="input-group">
                                <%--<input id="search" type="text" class="form-control" placeholder="Search" name="search" />--%>
                                <asp:TextBox ID="search" runat="server" class="form-control" placeholder="Search" ></asp:TextBox>
                                <div class="input-group-btn">
                                    <%--<button id="searchbtn" runat="server" class="btn btn-default" type="submit" onclick="search_click">
                                        <i class="glyphicon glyphicon-search"></i>
                                    </button>--%>
                                    <asp:LinkButton ID="searchbtn" runat="server" class="btn btn-default" OnClick="searchbtn_Click" ><i class="glyphicon glyphicon-search"></i></asp:LinkButton>
                                </div>
                            </div>
                        </form>
                    </div>
                </nav>
            </div>
        </div>

        <hr />
        <%-- Navigation Bar and Header End --%>

        <%-- Image Slider Start --%>
        <br />
        <br />
        <br />
        <br />
        <hr />
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
                    <asp:Repeater ID="Imagerptr" runat="server">
                     <ItemTemplate>
                       <div class="item <%# GetActiveImage(Container.ItemIndex) %>">
                           <a href="ViewCats.aspx?searchCat=<%# Eval("Heading_Name") %>"> <asp:Image ID="Image1" ImageUrl='<%# Eval("ImageUrl") %>' runat="server" style="height: 386px; width: 100%;" Title="image taken from Google.com" /></a>
                         <%--<img src="Images/Product_Images/<%#Eval("Product_id") %>/<%#Eval("Name") %><%#Eval("Extension") %>" alt="<%#Eval("Name") %>" title="image taken from <%#Eval("Brand_name") %>.com" onerror="this.src='Images/no_img.png'" />--%>
                        <div class="carousel-caption">
                          
                        </div>
                      </div>
                    </ItemTemplate>
                  </asp:Repeater>
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
                <div class="col-xs-6 col-sm-3" style="background-color: lavender; text-align: center">
                    <a href="ViewCats.aspx?searchCat=Rings">
                        <img class="img-circle" src="Images/dod img/Rings_dod.jpg" title="image taken from Google.com" alt="Rings" height="150" width="150" />
                        <h2>Rings</h2>
                    </a>
                </div>

                <div class="col-xs-6 col-sm-3" style="background-color: lavenderblush; text-align: center">
                    <a href="ViewCats.aspx?searchCat=Floral Necklaces">
                        <img class="img-circle" src="Images/dod img/Neckalce_floral.JPG" alt="Floral Design Necklaces" title="image taken from Google.com" height="150" width="150" />
                        <h2>Floral Necklaces</h2>
                    </a>
                </div>

                <!-- Add clearfix for only the required viewport -->
                <div class="clearfix visible-xs"></div>
                <div class="col-xs-6 col-sm-3" style="background-color: lightcyan; text-align: center">
                    <a href="ViewCats.aspx?searchCat=Bangles">
                        <img class="img-circle" src="Images/dod img/Bangles.jpg" alt="Bangles" title="image taken from Google.com" height="150" width="150" />
                        <h2>Bangles </h2>
                    </a>
                </div>

                <div class="col-xs-6 col-sm-3" style="background-color: lightgray; text-align: center">
                    <a href="ViewCats.aspx?searchCat=Coin">
                        <img class="img-circle" src="Images/dod img/Gold coin.jpg" alt="Gold Coins" title="image taken from Google.com" height="150" width="150" />
                        <h2>Gold & Silver Coins</h2>
                    </a>
                </div>


            </div>
        </div>
        <hr />

        <%--Middle Page Contents To show Products Starts Here--%>

        <div class="panel panel-primary">
            <div class="panel-heading">
                Deals Of The Day
            </div>
            <div class="row" style="padding-top: 50px">
                <asp:Repeater ID="rptrProducts" runat="server">
                    <ItemTemplate>
                        <div class="col-sm-3 col-md-3">
                            <a href="View_Product.aspx?Product_id=<%#Eval("Product_id") %>" style="text-decoration: none;">
                                <div class="thumbnail">
                                    <img src="Images/Product_Images/<%#Eval("Product_id") %>/<%#Eval("ImageName") %><%#Eval("Extension") %>" alt="<%#Eval("ImageName") %>" title="image taken from <%#Eval("Brand_Name") %>.com" style="height: 300px; width: 100%;" />
                                    <div class="caption">
                                        <div class="probrand"><%#Eval("Brand_Name") %></div>

                                        <div class="proName"><%#Eval("Product_Name") %></div>
                                        <div class="proPrice">
                                            <span class="pro_OriginalPrice">Rs. <%#Eval("Product_ListPrice","{0:0.00}") %></span> Rs.<%#Eval("Product_SellingPrice","{0:0.00}") %>
                                            <span class="proPriceDiscount">(Rs.<%#Eval("DiscountAmount","{0:0.00}") %> off)</span>
                                        </div>
                                    </div>
                                </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>

        <%--Middle Page Contents To show Products Starts Here--%>

        <%-- Page Contents Ending --%>

        <%-- Page bottom Contents Starts --%>
        <footer>
            <div class="container">
                <p class="pull-right"><a href="#">Back to top</a></p>
                <p>&copy; Mermaid Tears &middot; <a href="Default.aspx">Home </a>&middot; <a href="#">About</a><a href="#">Contact us&middot;</a></p>
            </div>
        </footer>
        <%-- Page bottom Contents Ends --%>
    </form>
</body>
</html>

