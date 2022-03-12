<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact us</title>
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
    <center>
    <div class="container">
        <div class="row">
        <div class="col-md-12">
            <div class="form-contol">
                <div class="Control-label">
                    <asp:Label ID="Label1" CssClass="glyphicon glyphicon-phone" runat="server" Text="9167389699"></asp:Label>
                </div>
            </div><br /><br />
            <div class="form-contol">
                <div class="Control-label">
                    <asp:Label ID="Label2" CssClass="glyphicon glyphicon-envelope" runat="server" Text="kewatkunal405@gmail.com"></asp:Label>
                </div><br /><br />
            </div>
        </div>
        </div>
    </div>
    </center>
    </form>
</body>
</html>
