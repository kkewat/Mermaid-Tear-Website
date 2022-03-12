<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="css/cart.css" />
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container rounded cart" style="position: fixed; left: 2px; right: 2px">
        <div class="d-flex flex-row align-items-center"><i class="fa fa-long-arrow-left"></i><a href="Products.aspx"><span class="ml-2 glyphicon glyphicon-arrow-left">Continue Shopping</span></a></div>
        <hr style="border-width:thick" />
        <asp:Repeater ID="CartDatarptr" runat="server">
            <ItemTemplate>
                <div class="row no-gutters">
                    <div class="col-md-12">
                        <div class="product-details mr-2">

                            <div class="d-flex flex-row bd-highlight ">
                                <div class="col-md-2">
                                    <asp:CheckBox ID="selectid" runat="server" AutoPostBack="true" />
                                    <img class="rounded " src="<%# Eval("Image_Url") %>" width="125" height="100">
                                </div>
                                <div class="col-md-7"><span style="font-weight: bold; font-size: 20px"><%# Eval("Product_Name") %></span><br />
                                    <span class="spec" style="font-size: 14px;"><%# Eval("Size") %>, <%# Eval("Weight") %></span><br />
                                    <span class="spec" style="font-size: 16px;"><b>Per Unit Price: RS.<%#Eval("Price") %></b></span>
                                </div>
                                    
                                <div class="col-md-3">
                                    <asp:LinkButton ID="increment" runat="server" OnClick="increment_Click"><span aria-hidden="true" class="glyphicon glyphicon-plus"></span></asp:LinkButton>&nbsp
                                    <span class="d-block"><%# Eval("Quantity") %></span><asp:Label ID="id" runat="server" Text='<%#Eval("Cart_id") %>' Visible="false"></asp:Label>
                                    <asp:LinkButton ID="decrement" runat="server" OnClick="decrement_Click"><span aria-hidden="true" class="glyphicon glyphicon-minus"></span></asp:LinkButton>&nbsp
                                    <span class="d-block ml-5 font-weight-bold">Rs. <%# Convert.ToInt32(Eval("Price"))*Convert.ToInt32(Eval("Quantity"))%></span><i class="fa fa-trash-o ml-3 text-black-50"></i>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Convert.ToInt32(Eval("Price"))*Convert.ToInt32(Eval("Quantity"))%>' Visible="false"></asp:Label>
                                    <asp:LinkButton ID="del" runat="server" OnClick="del_Click"><span aria-hidden="true" class="glyphicon glyphicon-remove"></span></asp:LinkButton>
                                    <asp:Label ID="id1" runat="server" Visible="false" Text='<%#Eval("Cart_id") %>' ></asp:Label>
                                    <asp:Label ID="pi1" runat="server" Visible="false" Text='<%#Eval("Product_id") %>' ></asp:Label>
                                    <asp:Label ID="pn1" runat="server" Visible="false" Text='<%#Eval("Product_Name") %>'></asp:Label>
                                    <asp:Label ID="iu1" runat="server" Visible="false" Text='<%#Eval("Image_Url") %>'></asp:Label>
                                    <asp:Label ID="si1" runat="server" Visible="false" Text='<%#Eval("Size") %>'></asp:Label>
                                    <asp:Label ID="we1" runat="server" Visible="false" Text='<%#Eval("Weight") %>'></asp:Label>
                                    <asp:Label ID="pr1" runat="server" Visible="false" Text='<%#Eval("Price") %>'></asp:Label>
                                    <asp:Label ID="qu1" runat="server" Visible="false" Text='<%#Eval("Quantity") %>'></asp:Label>
                                </div>
                            </div>

                        </div>
                    </div>
                </div><hr style="border-width:medium"/>
            </ItemTemplate>
        </asp:Repeater>
        <b><asp:label ID="GrandPrice" runat="server" text="Grand Total : RS. " Font-Size="Medium"></asp:label></b>
        <hr />
        <b><asp:label ID="Label2" runat="server" text="Selected Items Price : RS. " Font-Size="Medium" Visible="false"></asp:label></b>
        <center><asp:Button ID="Buy" runat="server" Text="Buy" CssClass="btn btn-success" OnClick="Payment_Click" /></center>

    </div>

</asp:Content>

