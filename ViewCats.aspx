<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewCats.aspx.cs" Inherits="ViewCats" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
            <%-- Navigation bar starts --%>
            <div>
                <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="UserHomePage.aspx" onclick="">
                                <img src="Images/logo/logo2.png" width="70px" height="40px" style="position: relative; top: -10px" />
                            </a>
                            <a class="navbar-brand" href="UserHomePage.aspx" alt="UserHomePage">Mermaid Tears</a>
                        </div>
                        <div class="collapse navbar-collapse" id="myNavbar">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="UserHomePage.aspx">Home</a></li>

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
                                        <li><a href="ViewCats.aspx?searchCat=Earrings">Earings</a></li>
                                        <li><a href="ViewCats.aspx?searchCat=Pendants">Pendants</a></li>
                                        <li><a href="ViewCats.aspx?searchCat=Finger Rings">Finger Rings</a></li>
                                    </ul>
                                </li>

                                <li class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">More<span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">About US</a></li>
                                        <li><a href="#">Contact us</a></li>
                                        <li><a href="Guide.aspx">Guide book</a></li>
                                    </ul>
                                </li>

                                <li class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">User<span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="User_Account.aspx">Account</a></li>
                                        <li><a href="User_Order.aspx">Orders</a></li>
                                    </ul>
                                </li>

                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li>
                                    <asp:Button ID="loginbtn" CssClass="btn btn-default navbar-btn" runat="server" Text="Login" OnClick="loginbtn_Click" />
                                    <asp:Button ID="logoutbtn" CssClass="btn btn-default navbar-btn" runat="server" Text="Logout" OnClick="logoutbtn_Click" />

                                </li>
                                <li>
                                    <asp:LinkButton runat="server" ID="Cart" type="button" OnClick="Cart_Click"><span aria-hidden="true" class="glyphicon glyphicon-shopping-cart">Cart</span><span id="num" class="badge" runat="server">6</span></asp:LinkButton>
                                </li>
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
            </div>
            <%-- Navigation bar ends --%>

            <%-- Write Your Contents Here Start --%>
            <br /><br /><br />
            <div class="row" style="padding-top: 50px">
                <asp:Repeater ID="ViewRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col-sm-3 col-md-3">
                            <a href="View_Product.aspx?Product_id=<%#Eval("Product_id") %>" style="text-decoration: none">
                                <div class="thumbnail">
                                    <img src="Images\Product_Images\<%#Eval("Product_id") %>\<%#Eval("ImageName") %><%#Eval("Extension") %>" alt="<%#Eval("ImageName") %>" title="image taken from <%#Eval("Brand_Name") %>.com" style="height:300px; width:100%;" />
                                    <div class="caption">
                                        <div class="probrand"><%#Eval("Brand_Name") %></div>

                                        <div class="proName"><%#Eval("Product_Name") %></div>
                                        <div class="proPrice"><span class="pro_OriginalPrice">Rs. <%#Eval("Product_ListPrice","{0:0.00}") %></span> Rs.<%#Eval("Product_SellingPrice","{0:0.00}") %><span class="proPriceDiscount"> (Rs.<%#Eval("DiscountAmount","{0:0.00}") %> off)</span></div>
                                    </div>
                                </div>
                        </div>
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
                <hr />

            </div>

            <%-- Write your contents ends here--%>
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
