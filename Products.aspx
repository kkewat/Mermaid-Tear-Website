<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="View_Products" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>All Products</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h1 align="center">Welcome to view all Products</h1>

<div class="row" style="padding-top:50px">
    <asp:Repeater ID="ViewRepeater" runat="server">
    <ItemTemplate>   
    <div class="col-sm-3 col-md-3">
        <a href="View_Product.aspx?Product_id=<%#Eval("Product_id") %>" style="text-decoration:none">
        <div class="thumbnail">
            <img src="Images/Product_Images/<%#Eval("Product_id") %>/<%#Eval("ImageName") %><%#Eval("Extension") %>" alt="<%#Eval("ImageName") %>" title="image taken from <%#Eval("Brand_Name") %>.com" />
            <div class="caption">
               <div class="probrand"><%#Eval("Brand_Name") %></div>
               
               <div class="proName"><%#Eval("Product_Name") %></div>
               <div class="proPrice"><span class="pro_OriginalPrice">Rs. <%#Eval("Product_ListPrice") %></span> Rs.<%#Eval("Product_SellingPrice") %><span class="proPriceDiscount"> (Rs.<%#Eval("DiscountAmount") %> off)</span></div>
            </div>
        </div>
    </div>
        </a>
    </ItemTemplate>
    </asp:Repeater>
</div>

</asp:Content>

