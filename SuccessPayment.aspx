<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="SuccessPayment.aspx.cs" Inherits="SuccessPayment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<center>
    <div class="container">
        <div class="col-md-12">
            <span>
                <p>Thankyou for Shopping With us. Happy Shopping</p>
            </span>
            <br />
            <br />
           
            <asp:LinkButton ID="LinkButton1" runat="server"><a href="Cart.aspx">Continue Shopping</a></asp:LinkButton>
        </div>
    </div>
    </center>
</asp:Content>

