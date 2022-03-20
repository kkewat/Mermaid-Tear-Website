<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="RequestDesign.aspx.cs" Inherits="RequestDesign" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="form-horizontal">
            <div class="col-md-12">
            <h2 class="Center">Request Designs</h2>
                <div class="form-group">
                    <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="enter the Type of item to make(eg.Ring,Necklace):"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="type" CssClass="form-control" runat="server"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" ControlToValidate="type" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" CssClass="col-md-2 control-label" runat="server" Text="enter the metal you want (eg. Gold,Silver):"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" ControlToValidate="textBox1" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label8" CssClass="col-md-2 control-label" runat="server" Text="Details/Specifications:"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="TextBox6" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Required" ControlToValidate="textBox2" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label3" CssClass="col-md-2 control-label" runat="server" Text="enter the your minimum price range in Rs.(eg. ):"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required" ControlToValidate="textBox2" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                
                <div class="form-group">
                    <asp:Label ID="Label4" CssClass="col-md-2 control-label" runat="server" Text="enter the your Maximum price range in Rs.(eg. ):"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required" ControlToValidate="textBox3" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label6" CssClass="col-md-2 control-label" runat="server" Text="enter your Phoneno.:"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="TextBox4" CssClass="form-control" TextMode="Phone" runat="server"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5"  runat="server" ErrorMessage="Required" ControlToValidate="textBox4" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label7" CssClass="col-md-2 control-label" runat="server" Text="enter your email:"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="TextBox5" TextMode="Email" CssClass="form-control" runat="server"></asp:TextBox><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Required" ControlToValidate="textBox5" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label5" CssClass="col-md-2 control-label" runat="server" Text="upload a design if you have :"></asp:Label>
                    <div class="col-md-3">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </div>
                </div>
                <asp:Button ID="Submit" CssClass="btn btn-success" runat="server" Text="Submit" OnClick="Submit_Click"  />
            </div>
        </div>
    </div>
</asp:Content>

