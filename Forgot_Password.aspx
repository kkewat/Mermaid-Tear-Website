<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Forgot_Password.aspx.cs" Inherits="Forgot_Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forgot Password</title>
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
        
        <div class="container">
           <h2>Recover Password</h2>
           <hr/>
           <h3></h3>
           <div class="form-group">
               Enter Email : <asp:TextBox ID="PasswordEmailRecovery" runat="server"></asp:TextBox><br/>
               <asp:Button ID="Recoverpassword" runat="server" Text="Send" OnClick="Recoverpassword_Click" />

               <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ErrorMessage="please Entter Email" ControlToValidate="PasswordEmailRecovery"></asp:RequiredFieldValidator>
           </div>
           <asp:Label ID="lblResetPassMsg" CssClass ="text-success " runat="server" ></asp:Label>
        </div>
    </div>
    </form>
    <%-- Page bottom Conents Starts --%>
    <footer class="footer_position">
        <div class="container">
            <p class="pull-right"><a href="">Back to top</a></p>
            <p>&copy; Mermaid Tears &middot; <a href="Default.aspx">Home </a>&middot; <a href="#">About</a>&middot;<a href="#">Contact us&middot;</a></p>
        </div>
    </footer>
    <%-- Page bottom Contents Ends --%>
</body>
</html>
