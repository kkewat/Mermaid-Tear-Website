<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminViewCats.aspx.cs" Inherits="AdminViewCats" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<%-- Write Your Contents Here Start --%>
            <br /><br /><br />
            <div class="row" style="padding-top: 50px">
                <asp:Repeater ID="ViewRepeater" runat="server">
                    <ItemTemplate>
                        <div class="col-sm-3 col-md-3">
                            <a href="AdminView_Product.aspx?Product_id=<%#Eval("Product_id") %>" style="text-decoration: none">
                                <div class="thumbnail">
                                    <img src="Images\Product_Images\<%#Eval("Product_id") %>\<%#Eval("ImageName") %><%#Eval("Extension") %>" alt="<%#Eval("ImageName") %>" title="image taken from <%#Eval("Brand_Name") %>.com" style="height:300px; width:100%;" />
                                    <div class="caption">
                                        <div class="probrand"><%#Eval("Brand_Name") %></div>

                                        <div class="proName"><%#Eval("Product_Name") %></div>
                                        <div class="proPrice"><span class="pro_OriginalPrice">Rs. <%#Eval("Product_ListPrice","{0:0.00}") %></span> Rs.<%#Eval("Product_SellingPrice","{0:0.00}") %><span class="proPriceDiscount"> (Rs.<%#Eval("DiscountAmount","{0:0.00}") %> off)</span></div>
                                    </div>
                                </div>
                        </div>
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
                <hr />

            </div>
</asp:Content>

