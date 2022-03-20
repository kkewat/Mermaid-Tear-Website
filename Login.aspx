<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE-edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1"  />
    <link href="css/StyleSheet.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body style="text-align:center;background-image:url('Images/logo/logo2.png');background-repeat:no-repeat;background-attachment:fixed;background-size:cover;">
    <form id="form1" runat="server">
    <div>
    <h1>Login</h1>
    <br/><br />
    USERNAME : <asp:TextBox ID="username" runat="server" ></asp:TextBox><br />
    PASSWORD : <asp:TextBox ID="password" TextMode="Password" runat="server" MaxLength="12" ></asp:TextBox><br /><br />
        <asp:CheckBox ID="Remember_me" runat="server" Text="Remember me" /><br />
        <asp:Button ID="login" CssClass="btn btn-success" runat="server" Text="Login" OnClick="login_Click" /><br/><br />
        <asp:HyperLink ID="frgtpassword" runat="server" NavigateUrl="~/Forgot_Password.aspx"><b>Forgot Password</b></asp:HyperLink><br />
   <span> Don't have an account Signup first : <asp:HyperLink ID="HyperLink2" NavigateUrl="~/Registration.aspx" runat="server"><b>Register</b></asp:HyperLink></span><br />
        <b><asp:Label ID="Label1" runat="server" Text=""></asp:Label></b>
    </div>

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
