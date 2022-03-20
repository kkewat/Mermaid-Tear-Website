<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="FailurePayment.aspx.cs" Inherits="FailurePayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <center>
    <div class="container">
        <div class="col-md-12">
        
            <span>
                <p>The Transaction has Failed.<br /> Please Try again.<br /> </p>
            </span>
            <br />
            <br />
            <p>
                <br />
            </p>
            <asp:Label ID="TransactionId" runat="server" Text=""></asp:Label>
        </div>
        <div>
            <asp:LinkButton ID="LinkButton1" runat="server"><a href="Cart.aspx"> Continue Shopping</a></asp:LinkButton>
        </div>
    </div>
    </center>
</asp:Content>

