<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="User_Account.aspx.cs" Inherits="User_Account" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="form-group">
                        <label>Username : </label>
                        <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server" AutoPostBack="true" ReadOnly="True"></asp:TextBox><br />
                        <br />
                        <label>First Name : </label>
                        <asp:TextBox ID="FirstName" CssClass="form-control" runat="server" AutoPostBack="true" ReadOnly="True"></asp:TextBox><br />
                        <br />
                        <label>Last Name : </label>
                        <asp:TextBox ID="LastName" CssClass="form-control" runat="server" AutoPostBack="true" ReadOnly="True"></asp:TextBox><br />
                        <br />
                        <label>Email id : </label>
                        <asp:TextBox ID="mail" CssClass="form-control" runat="server" AutoPostBack="true" ReadOnly="True"></asp:TextBox><br />
                        <br />
                        <label>Phone no. : </label>
                        <asp:TextBox ID="Phone_no" CssClass="form-control" runat="server" AutoPostBack="true" ReadOnly="True"></asp:TextBox><br />
                        <br />
                        <asp:RadioButton ID="psd" runat="server" Text="Change Password" AutoPostBack="true" /><br />
                        <asp:Label ID="Label1" runat="server" Text="New Password"></asp:Label><br />
                        <asp:TextBox ID="npsswd" runat="server"></asp:TextBox><asp:RegularExpressionValidator ID="MatchExpression" runat="server" ErrorMessage="Password must be 8-10 characters long with at least one numeric,</br>one upper case character and one special character." Display="Dynamic" ValidationExpression="(?=^.{8,10}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+}{&quot;:;'?/>.<,])(?!.*\s).*$" ControlToValidate="npsswd" ForeColor="Red"></asp:RegularExpressionValidator><br />
                        <a href="Forgot_Password.aspx" alt="forgot password" style="text-decoration:none">Forgot Password</a>
                        <asp:Button ID="changepsd" runat="server" Text="Save Password" OnClick="changepsd_Click" /><br /><br />
                        <asp:Button ID="delAccount" runat="server" CssClass="btn btn-danger" Text="Delete Account" OnClick="delAccount_Click" />
                       
                    </div>
            </div>
        </div>
    </div>

</asp:Content>

