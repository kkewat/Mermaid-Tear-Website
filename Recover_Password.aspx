<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Recover_Password.aspx.cs" Inherits="Recover_Password" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Recover Passsword</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div class="container">
                <div class="form-horizontal">
                    <br />
                    <br />
                    <br />

                    <h2>
                        <center><b>Reset Password</b></center>
                    </h2>
                    <hr />
                    <h3></h3>
                    <div class="form-group">
                        <asp:Label ID="lblmsg" CssClass="col-md-2 control-label" runat="server" Visible="False" Font-Bold="True" Font-Size="X-Large"></asp:Label>

                    </div>


                    <div class="form-group">
                        <asp:Label ID="lblNewPassword" CssClass="col-md-2 control-label" runat="server" Text=" New Password" Visible="False"></asp:Label>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtNewPass" CssClass=" form-control" TextMode="Password" runat="server" Visible="False"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorNewPass" CssClass="Text-danger" runat="server" ErrorMessage="Enter Your New Password" ControlToValidate="txtNewPass" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="MatchExpression" runat="server" ErrorMessage="Password must be 8-10 characters long with at least one numeric,</br>one upper case character and one special character." Display="Dynamic" ValidationExpression="(?=^.{8,10}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+}{&quot;:;'?/>.<,])(?!.*\s).*$" ControlToValidate="txtNewPass" ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblConfirmPass" CssClass="col-md-2 control-label" runat="server" Text="Confirm New Password" Visible="False"></asp:Label>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtConfirmPass" CssClass=" form-control" TextMode="Password" runat="server" Visible="False"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPass" CssClass="Text-danger" runat="server" ErrorMessage="Enter Your Confirm New Password" ControlToValidate="txtConfirmPass" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidatorPass" CssClass="Text-danger" runat="server" ErrorMessage="confirm password not match...try again" ControlToCompare="txtConfirmPass" ForeColor="Red" ControlToValidate="txtNewPass"></asp:CompareValidator>
                        </div>

                    </div>


                    <div class="form-group">
                        <div class="col-md-2"></div>

                        <div class="col-md-6">
                            <asp:Button ID="btnResetPass" CssClass="btn btn-default" runat="server" Text="Reset" Visible="False" OnClick="btnResetPass_Click" />

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </form>
</body>
</html>
