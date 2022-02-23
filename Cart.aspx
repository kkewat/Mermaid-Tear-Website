<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="css/cart.css"></link>
    <%--<style>
        .payment-info {
            background: blue;
            padding: 10px;
            border-radius: 6px;
            color: #fff;
            font-weight: bold;
        }

        .product-details {
            padding: 10px;
        }

        body {
            background: #eee;
        }

        .cart {
            background: #fff;
        }

        .p-about {
            font-size: 12px;
        }

        .table-shadow {
            -webkit-box-shadow: 5px 5px 15px -2px rgba(0, 0, 0, 0.42);
            box-shadow: 5px 5px 15px -2px rgba(0, 0, 0, 0.42);
        }

        .type {
            font-weight: 400;
            font-size: 10px;
        }

        label.radio {
            cursor: pointer;
        }

            label.radio input {
                position: absolute;
                top: 0;
                left: 0;
                visibility: hidden;
                pointer-events: none;
            }

            label.radio span {
                padding: 1px 12px;
                border: 2px solid #ada9a9;
                display: inline-block;
                color: #8f37aa;
                border-radius: 3px;
                text-transform: uppercase;
                font-size: 11px;
                font-weight: 300;
            }

            label.radio input:checked + span {
                border-color: #fff;
                background-color: blue;
                color: #fff;
            }

        .credit-inputs {
            background: rgb(102, 102, 221);
            color: #fff !important;
            border-color: rgb(102, 102, 221);
        }

            .credit-inputs::placeholder {
                color: #fff;
                font-size: 13px;
            }

        .credit-card-label {
            font-size: 9px;
            font-weight: 300;
        }

        .form-control.credit-inputs:focus {
            background: rgb(102, 102, 221);
            border: rgb(102, 102, 221);
        }

        .line {
            border-bottom: 1px solid rgb(102, 102, 221);
        }

        .information span {
            font-size: 12px;
            font-weight: 500;
        }

        .information {
            margin-bottom: 5px;
        }

        .items {
            -webkit-box-shadow: 5px 5px 4px -1px rgba(0, 0, 0, 0.25);
            box-shadow: 5px 5px 4px -1px rgba(0, 0, 0, 0.08);
        }

        .spec {
            font-size: 11px;
        }
    </style>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container rounded cart" style="position: fixed; left: 2px; right: 2px">
        <div class="d-flex flex-row align-items-center"><i class="fa fa-long-arrow-left"></i><a href="Products.aspx"><span class="ml-2 glyphicon glyphicon-arrow-left">Continue Shopping</span></a></div>
        <hr />
        <asp:Repeater ID="CartDatarptr" runat="server">
            <ItemTemplate>
                <div class="row no-gutters">
                    <div class="col-md-12">
                        <div class="product-details mr-2">

                            <div class="d-flex flex-row bd-highlight ">
                                <div class="col-md-2">
                                    <img class="rounded " src="<%# Eval("Image_Url") %>" width="125" height="100">
                                </div>
                                <div class="col-md-7"><span style="font-weight: bold; font-size: 20px"><%# Eval("Product_Name") %></span><br />
                                    <span class="spec" style="font-size: 14px;"><%# Eval("Size") %>, <%# Eval("Weight") %></span></div>
                                <div class="col-md-3">
                                    <asp:LinkButton ID="increment" runat="server" OnClick="increment_Click"><span aria-hidden="true" class="glyphicon glyphicon-plus"></span></asp:LinkButton>&nbsp
                                    <span class="d-block"><%# Eval("Quantity") %></span><asp:Label ID="id" runat="server" Text='<%#Eval("Cart_id") %>' Visible="false"></asp:Label>
                                    <asp:LinkButton ID="decrement" runat="server" OnClick="decrement_Click"><span aria-hidden="true" class="glyphicon glyphicon-minus"></span></asp:LinkButton>&nbsp
                                    <span class="d-block ml-5 font-weight-bold">Rs. <%# Eval("Price") %></span><i class="fa fa-trash-o ml-3 text-black-50"></i>
                                    <asp:LinkButton ID="del" runat="server" OnClick="del_Click"><span aria-hidden="true" class="glyphicon glyphicon-remove"></span></asp:LinkButton><asp:Label ID="id1" runat="server" Text='<%#Eval("Cart_id") %>' Visible="false"></asp:Label>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>

</asp:Content>

