<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Payment" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <asp:linkbutton ID="emptyorder" runat="server" OnClick="emptyorder_Click"><span aria-hidden="true" class="glyphicon glyphicon-back-arrow"> Continue Shopping </span></asp:linkbutton>
    </div>
    <div class="container">
        <div></div>
        <div class="row row-no-gutters">
            <div class="col-md-6 ">
                <h3 style="font-family: Algerian">Confirm Product Details</h3>
                <asp:Repeater ID="CartDatarptr" runat="server">
                    <ItemTemplate>
                        <div class="row no-gutters">
                            <div class="col-md-12">
                                <div class="product-details mr-2">

                                    <div class="d-flex flex-row bd-highlight ">
                                        <div class="col-md-2">
                                            <img class="rounded " src="<%# Eval("Image_url") %>" width="125" height="100">
                                        </div>
                                        <div class="col-md-7">
                                            <span style="font-weight: bold; font-size: 20px"><%# Eval("Product_Name") %></span><br />
                                            <span class="spec" style="font-size: 14px;"><%# Eval("Size") %>, <%# Eval("Weight") %></span><br />
                                            <span class="spec" style="font-size: 14px;"><b>Per Unit Price: <%#Eval("Price") %></b></span>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:LinkButton ID="increment" runat="server" OnClick="increment_Click"><span aria-hidden="true" class="glyphicon glyphicon-plus"></span></asp:LinkButton>&nbsp
                                    <span class="d-block"><%# Eval("Quantity") %></span><asp:Label ID="id" runat="server" Text='<%#Eval("Cart_id") %>' Visible="false"></asp:Label>
                                            <asp:LinkButton ID="decrement" runat="server" OnClick="decrement_Click"><span aria-hidden="true" class="glyphicon glyphicon-minus"></span></asp:LinkButton>&nbsp
                                    <span class="d-block ml-5 font-weight-bold">Rs. <%# Convert.ToInt32(Eval("Price"))*Convert.ToInt32(Eval("Quantity"))%></span><i class="fa fa-trash-o ml-3 text-black-50"></i>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Convert.ToInt32(Eval("Price"))*Convert.ToInt32(Eval("Quantity"))%>' Visible="false"></asp:Label>
                                            <asp:Label ID="id1" runat="server" Text='<%#Eval("Cart_id") %>' Visible="false"></asp:Label>
                                            <asp:LinkButton ID="del" runat="server" OnClick="del_Click"><span aria-hidden="true" class="glyphicon glyphicon-remove"></span></asp:LinkButton>
                                            <asp:Label ID="Label8" runat="server" Visible="false" Text='<%#Eval("Cart_id") %>'></asp:Label>
                                            <asp:Label ID="pi1" runat="server" Visible="false" Text='<%#Eval("Product_id") %>'></asp:Label>
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
                        </div>
                        <hr style="border-width: medium" />
                    </ItemTemplate>
                </asp:Repeater>
                <b>
                    <asp:Label ID="GrandPrice" runat="server" Text="Grand Total : RS. " Font-Size="Medium"></asp:Label></b>
                <asp:Label ID="TPrice" runat="server" Text="" Visible="false" ></asp:Label>
            </div>
            <div class="col-md-1">

            </div>
            <div class="col-md-5" >
                <h3>Select Payment Type</h3>
                <hr />
                <div class="form-horizontal">
                    <div class="form-group">
                        <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Name"></asp:Label>
                        <div class="col-md-3">
                            <asp:TextBox ID="Name" CssClass="form-control" runat="server"></asp:TextBox><br />
                        </div>
                    </div><br />
                    <div class="form-group">
                        <asp:Label ID="Label2" CssClass="col-md-2 control-label" runat="server" Text="Phone Number"></asp:Label>
                        <div class="col-md-3">
                            <asp:TextBox ID="Number" TextMode="Phone" runat="server"></asp:TextBox><br />
                        </div>
                    </div><br />
                    <div class="form-group">
                        <asp:Label ID="Label3" CssClass="col-md-2 control-label" runat="server" Text="Address"></asp:Label>
                        <div class="col-md-3">
                            <asp:TextBox ID="Address" TextMode="MultiLine" runat="server"></asp:TextBox><br />
                        </div>
                    </div><br />
                    <div class="form-group">
                        <asp:Label ID="Label4" CssClass="col-md-2 control-label" runat="server" Text="Pincode"></asp:Label>
                        <div class="col-md-3">
                            <asp:TextBox ID="Pincode" TextMode="Number" runat="server" MaxLength="6"></asp:TextBox><br />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label5" CssClass="col-md-2 control-label" runat="server" Text="City"></asp:Label>
                        <div class="col-md-3">
                            <asp:TextBox ID="City" runat="server"></asp:TextBox><br />
                        </div>
                    </div><br />
                    <div class="form-group">
                        <asp:Label ID="Label6" CssClass="col-md-2 control-label" runat="server" Text="State"></asp:Label>
                        <div class="col-md-3">
                            <asp:TextBox ID="State" runat="server"></asp:TextBox><br />
                        </div>
                    </div><br />
                    <div class="form-group">
                        <asp:Label ID="Label7" CssClass="col-md-2 control-label" runat="server" Text="Country"></asp:Label>
                        <div class="col-md-3">
                            <asp:TextBox ID="Country" runat="server"></asp:TextBox><br />
                        </div>
                    </div><br />
                    <div class="form-group">
                        <asp:Label ID="Label9" CssClass="col-md-2 control-label" runat="server" Text="E-Mail"></asp:Label>
                        <div class="col-md-3">
                            <asp:TextBox ID="E_Mail" TextMode="Email" runat="server"></asp:TextBox><br />
                        </div>
                    </div><br />
                    <%--Name:<asp:TextBox ID="Name1" CssClass="form-control" runat="server"></asp:TextBox><br />
                    Phone number :<asp:TextBox ID="Number1" TextMode="Phone" runat="server"></asp:TextBox><br />
                    Address:<asp:TextBox ID="Address1" runat="server"></asp:TextBox><br />
                    Pincode:<asp:TextBox ID="Pincode1" TextMode="Number" runat="server" MaxLength="6"></asp:TextBox><br />
                    City:<asp:TextBox ID="City1" runat="server"></asp:TextBox><br />
                    State:<asp:TextBox ID="State1" runat="server"></asp:TextBox><br />
                    Country:<asp:TextBox ID="Country1" runat="server"></asp:TextBox><br />--%>

                    <hr />
                </div>
                <div>
                    <asp:RadioButton ID="rbOffline" runat="server" GroupName="Payment_Method" Text="Offline" AutoPostBack="true" /><br />
                    <asp:RadioButton ID="rbOnline" runat="server" GroupName="Payment_Method" Text="Online" AutoPostBack="true" /><br />

                </div><br />
                <asp:Button ID="Buy" CssClass="btn btn-success" runat="server" Text="Button" OnClick="Buy_Click" Visible="false" /><br />
                <asp:Label ID="info" Style="background-color: firebrick;color:black;font-weight:800;font-size:16px" runat="server" Visible="false" Text="This Is a demo Website and no products are real and not deliverable and the Payment Gateway is for Demo purpose only but Real money will be Transferred from Bank. So think Before making payment."></asp:Label><br />
                <asp:Button ID="Buynow" style=" width: 150px;word-wrap:break-word; background-color: #25D721; text-align: center; font-weight: 800; padding: 11px 0px; color: white; font-size: 12px; display: inline-block; text-decoration: none; " runat="server" Text="Buy Now " OnClick="Buynow_Click" Visible="false" />
                <%--<div> <a style=" width: 150px; background-color: #25D721; text-align: center; font-weight: 800; padding: 11px 0px; color: white; font-size: 12px; display: inline-block; text-decoration: none; " href='https://pmny.in/OrlqdHW565Kw' > Buy Now </a> </div>--%>
            </div>
        </div>
    </div>

</asp:Content>

