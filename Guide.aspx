<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Guide.aspx.cs" Inherits="Guide" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Guide Book</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE-edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/StyleSheet.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style>
        #logo_wrapper image {
            max-width: 100%;
            height: auto;
        }
    </style>
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
                            <a class="navbar-brand" href="UserHomePage.aspx">
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
            <br />
            <br />
            <br />
            <br />
            <hr />
            <%-- Navigation bar ends --%>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div id="logo_wrapper">
                        <hr /><h3><b>Ring sizes</b></h3><hr />
                        <center>
                        <asp:Image ID="ring_size" runat="server" src="Images\Guide\ring-size-chart.jpg" style="border:0;max-width:100%;height:auto" title="google.com"/>
                        </center>
                    </div>
                    <div>
                        <hr /><h3><b>Diamond And Stones Weight and Carat Sizes</b></h3><hr />
                        <center>
                        <asp:Image ID="Image1" runat="server" src="Images\Guide\carat weights.jpg" style="border:0;max-width:100%;height:auto" title="google.com" /><br /><hr />
                        <asp:Image ID="Image2" runat="server" src="Images\Guide\diamond-carat-size-chart-21.jpg" style="border:0;max-width:100%;height:auto" title="jewellersmutual.com"/>
                        </center>
                    </div>
                    <div>
                        <hr /><h3><b>Necklace Sizes</b></h3><hr />
                        <center>
                        <asp:Image ID="Image3" runat="server" src="Images\Guide\standard-necklace-lengths-women-men-children.png" style="border:0;max-width:100%;height:auto" title="jewelerytalk.com" /><br />
                        </center>
                    </div>
                </div><br />

                <div>
                    <hr /><h2><b>1. What is jewellery?</b></h2>
                    <p>Jewellery is a decorative object worn on your body or clothing. These items are typically made from precious metals, such as silver or gold, or adorned with precious stones. However, jewellery can be made of the simplest and cheapest materials and is often worn for aesthetic appeal rather than intrinsic value. </p>
                    <p>Jewellery has been worn for almost as long as humans have walked the earth. Evidence of jewellery has been discovered all over the world and as far back as prehistoric times. The significance of jewellery has changed over the centuries and often signalled the importance and status of the wearer. </p>
                    <br />
                </div>

                <div>
                    <h2><b>2. Types of jewellery</b></h2>
                    <br />

                    <h4><b>Anklets</b></h4>
                    <p>Anklets, as the name would suggest, is a piece of bracelet-like jewellery worn around the ankle. Popular in the East, particularly in India, anklets have been worn for centuries, with examples found from Persia and Egypt. They are regularly adorned with jewels, charms and bells that gently ring as the wearer walks.</p>
                    <h4><b>Armlets</b></h4>
                    <br />
                    <p>Armlets are decorative bands worn on the arm. Unlike a bracelet, armlets are typically worn on the upper arm. Historically, armlets were worn by men but now are worn mainly by women for their decorative beauty. They are usually made of precious metal, such as gold, and twist around the arm.</p>
                    <br />
                    <h4><b>Bangles</b></h4>
                    <p>Bangles are solid bracelets without a closure that slides over the wrist. Typically made from a precious metal such as gold or silver, they are popular in India and considered good luck.</p>
                    <br />
                    <h4><b>Beads and Charms</b></h4>
                    <p>Beads and charms are small decorative items that typically adorn either bracelets or necklaces. Charms were believed to possess magical qualities, but are now worn for their decorative appeal. Most charms are cast in the shape of animals and objects, and given as sentimental gifts.</p>
                    <h4><b>Bracelets</b></h4>
                    <p>Bracelets are one of the most popular and widely worn pieces of jewellery. They wrap around the wrist and come in practically every material, from precious metals and gemstones to wood and leather. Bracelets possess different cultural significance around the world and have been worn by women and men for centuries.</p>
                    <br />
                    <h4><b>Brooches</b></h4>
                    <p>Brooches are decorative pins that fasten to clothing. They are both ornamental and functional while being used throughout history and across cultures. Initially used to secure garments together, such as cloaks and tunics, they are now used predominantly for decoration. They are typically made in gold and silver with gemstone or enamel embellishments. During the Victorian era, they were popular as mourning wear. People used them to hold hair or a keepsake from a departed loved one.</p>
                    <br />
                    <h4><b>Chains</b></h4>
                    <p>Chains are a particular type of necklace with interlocking parts, be they rings, balls or material twisted together to look like rope. Chains are arguably the most popular and common form of necklace style for both men and women. From chunky gold chains to delicate silver curb chains, they come in many shapes and styles. Due to their flexibility they are perfect for laying flat against the wearer's chest and staying in place when the wearer is in motion.</p>
                    <br />
                    <h4><b>Chokers</b></h4>
                    <p>Chokers are tightly-fitted necklaces often made from softer materials like velvet or leather. Like many jewellery designs, chokers have been around for centuries and appear across cultures. In the west, they became popular in the 19th Century and continue to be a popular fashion accessory today.</p>
                    <br />
                    <h4><b>Cufflinks</b></h4>
                    <p>Cufflinks are used to fasten the cuffs of dress shirts. They are typically worn for formal and business wear and come in many designs and materials. Precious metals, such as gold and silver, remain the most popular. Designs vary greatly and can offer subtle decorative embellishments to a man's outfit.</p>
                    <br />
                    <h4><b>earrings</b></h4>
                    <p>Earrings are the most popular form of jewellery and are regularly worn no matter the occasion. Earrings come in many shapes and styles, including hooped, drop and stud. They are worn around the world and have been a regular fashion accessory through the centuries, adapting to changing tastes and fashions. Typically worn in pairs, they are often made from precious metals and embellished with gemstones, pearls, enamel or ornate detailing. Only in the late 17th Century and 18th Century, when wigs and headdresses obscured the ears, did earrings fall out of fashion.</p>
                    <br />
                    <h4><b>Necklaces</b></h4>
                    <p>Along with rings and earrings, necklaces are the most popular type of jewellery and can be worn by both men and women. Necklaces have been worn for almost as long as humans have walked the planet. Early examples were made from bone but since the Bronze Age, most necklaces are made from harder wearing metals. Necklaces can be simple chains or they may be adorned with gemstones, enamel or a pendant.</p>
                    <br />
                    <h4><b>Pendants</b></h4>
                    <p>Pendants are ornamental jewellery suspended from a necklace, bracelet or earring. Pendants date back to the Stone Age where people would wear amulets around their neck. For centuries, pendants often carried religious significance. Religious pendants remain popular today, but most are worn for their decorative appeal.</p>
                    <br />
                </div>
                <hr />
                <div>
                <h5 style="color:red"><b>Site Reffered and to Know more Click and check below link : </b></h5><br />
                <br />
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="https://www.naj.co.uk/advice/Ultimate-Jewellery-Buying-Guide"><span style="text-size-adjust:14px"><b>Know more</b></span></asp:HyperLink><br />
                </div><br /><br /><hr />
            </div>
        </div>
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
