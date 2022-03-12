<%@ Page Title="" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="User_Order.aspx.cs" Inherits="User_Order" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <%-- All Orders Table Starts --%>
        <hr />
        <h1>Orders</h1>
        <hr />

        <div class="panel panel-default">
            <div class="panel-heading">
                <center> All Orders </center>
            </div>
            <asp:Repeater ID="OrderRepeater" runat="server">
                <HeaderTemplate>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Order id</th>
                                <th>Product id</th>
                                <th>User Name</th>
                                <th>Product Name</th>
                                <th>Size</th>
                                <th>Weight</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Payment Type</th>
                                <th>Payment Status</th>
                                <th>Date & Time</th>
                                <th></th>
                            </tr>
                        </thead>

                        <tbody>
                </HeaderTemplate>

                <ItemTemplate>
                    <tr>
                        <th><%# Eval("Order_id") %></th>
                        <td><%# Eval("Product_id") %></td>
                        <td><%# Eval("User_Name") %></td>
                        <td><%# Eval("Product_Name") %></td>
                        <td><%# Eval("Size") %></td>
                        <td><%# Eval("Weight") %></td>
                        <td><%# Eval("Quantity") %></td>
                        <td><%# Eval("Price") %></td>
                        <td><%# Eval("Payment_Type") %></td>
                        <td><%# Eval("Payment_Status") %></td>
                        <td><%# Eval("Date","{0:dd/MM/yyyy}") %><br />
                            <%# Eval("Time") %>
                        </td>
                        <td>
                            <asp:LinkButton ID="DeleteOrder" runat="server" CssClass="btn btn-primary" ToolTip="Delete a Brand." OnClientClick="javascript:return confirm('Are you sure to Cancel Order?')" OnClick="DeleteOrder_Click"><span aria-hidden="true" class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("Order_id") %>' Visible="false"></asp:Label>
                            <asp:Label ID="Label2" runat="server" Text='<%#Eval("Order_Status") %>' Visible="false"></asp:Label>
                            <asp:Label ID="Label3" runat="server" Text="Cancelled" Visible="false"></asp:Label>
                        </td>
                    </tr>
                </ItemTemplate>

                <FooterTemplate>
                    </tbody>
          </table>
                </FooterTemplate>
            </asp:Repeater>


        </div>

        <%-- All Orders Table Finish --%>
    </div>

</asp:Content>

