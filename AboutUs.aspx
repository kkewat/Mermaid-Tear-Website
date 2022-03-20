<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="AboutUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About us</title>
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
    <div style="padding-top:150px">
    <div class="container">
        <div class="row">
        <div class="col-md-12">
            <div class="form-contol">
                <div class="Control-label"><b style="font-family:Algerian;font-size:xx-large;background-color:khaki">
                    <asp:Label ID="Label1" runat="server" Text="This is an demo website . Created for the purpose of college project and all the images and items are referred from google or the respected brands or websites and we dont have any copyright over it."></asp:Label>
                </b>
                </div>
            </div><br /><br />
            <div class="form-contol">
                <div class="Control-label"><b style="font-family:Algerian;font-size:xx-large;background-color:khaki">
                    <asp:Label ID="Label2" runat="server" Text="This website is for online jewellery shopping website and also no items booked will ever be delivered to you. Thankyou happy Browsing"></asp:Label>
                    </b>
                </div><br /><br />
            </div>
        </div>
        </div>
    </div>
    </div>
    </form>
</body>
</html>
