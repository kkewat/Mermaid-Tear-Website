﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE-edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="css/StyleSheet.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body style="background-image:url('Images/logo/logo2.png');background-repeat:no-repeat;background-attachment:fixed;background-size:cover;">
    <form id="form1" runat="server">
    <div>
    <h1> Register </h1>
        <table align="center" controltovalidate="password"> 
            <tr>
                <td >First Name : </td>
                <td><asp:TextBox ID="first_name" Placeholder="Enter First Name" runat="server"></asp:TextBox></td>
                <td>
                <asp:RequiredFieldValidator ID="Required1" runat="server" ErrorMessage="RequiredFirst Name" ControlToValidate="first_name" ForeColor="Red"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td >Last Name : </td>
                <td><asp:TextBox ID="last_name" Placeholder="Enter Last Name" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="Required2" runat="server" ControlToValidate="last_name" ErrorMessage="Required Last Name" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td >UserName : </td>
                <td><asp:TextBox ID="username" Placeholder="Enter User Name" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="Required3" runat="server" ControlToValidate="username" ErrorMessage="Required Username" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td >Gender : </td>
                <td>
                <asp:DropDownList ID="gender" Placeholder="Select Gender" runat="server">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem Text="Male" Value="Male">Male</asp:ListItem>
                    <asp:ListItem Text="Female" Value="Female">Female</asp:ListItem>
                    <asp:ListItem Text="Other" Value="Other">Other</asp:ListItem>
               </asp:DropDownList></td>
               <td>
                   <asp:RequiredFieldValidator ID="Required4" runat="server" ControlToValidate="gender" ErrorMessage="Select Gender" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td >Email : </td>
                <td><asp:TextBox ID="email" Placeholder="Enter E-Mail" TextMode="Email" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="Required5" runat="server" ControlToValidate="email" ErrorMessage="Required Email" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td >Phone number : </td>
                <td><asp:TextBox ID="phone" TextMode="Phone" Placeholder="Enter Phone no." MaxLength="10" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="Required6" runat="server" ControlToValidate="phone" ErrorMessage="Required Phone no." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td >Password : </td>
                <td><asp:TextBox ID="password" TextMode="Password" Placeholder="Enter Password" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="Required7" runat="server" ControlToValidate="password" ErrorMessage="Password Required" ForeColor="Red"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="MatchExpression" runat="server" ErrorMessage="Password must be 8-10 characters long with at least one numeric,</br>one upper case character and one special character." Display="Dynamic" ValidationExpression="(?=^.{8,10}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+}{&quot;:;'?/>.<,])(?!.*\s).*$" ControlToValidate="password" ForeColor="Red"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td >Confirm Password : </td>
                <td><asp:TextBox ID="password1" Placeholder="Re-enter Password" TextMode="Password" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="Required8" runat="server" ErrorMessage="Required" ControlToValidate="password1" ForeColor="Red"></asp:RequiredFieldValidator><br/>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Didn't Match" ControlToCompare="password" ControlToValidate="password1" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
        </table>
        
        <center>
        <asp:Button ID="register_user" runat="server" Text="SUBMIT" OnClick="register" />&nbsp
        <input id="Reset1" type="reset" value="RESET" />&nbsp
        <br /> <br /><asp:Label ID="Label1" runat="server" Text=""></asp:Label><br />
        Already Have a Account then : <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Login.aspx" runat="server">Login</asp:HyperLink>
        </center>
    </div>

    <%-- Page bottom Conents Starts --%>
    <footer class="footer_position">
        <div class="container">
            <p class="pull-right"><a href="#">Back to top</a></p>
            <p>&copy; Mermaid Tears &middot; <a href="Default.aspx">Home </a>&middot; <a href="#">About</a>&middot;<a href="#">Contact us&middot;</a></p>
        </div>
    </footer>
    <%-- Page bottom Contents Ends --%>
    </form>
</body>
</html>
