<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Orders" %>

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
                                <th>Address</th>
                                <th>City</th>
                                <th>State</th>
                                <th>Pincode</th>
                                <th>Country</th>
                                <th>Payment Type</th>
                                <th>Payment Status</th>
                                <th>Date & Time</th>
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
                        <td><%# Eval("Address") %></td>
                        <td><%# Eval("City") %></td>
                        <td><%# Eval("State") %></td>
                        <td><%# Eval("Pincode") %></td>
                        <td><%# Eval("Country") %></td>
                        <td><%# Eval("Payment_Type") %></td>
                        <td><%# Eval("Payment_Status") %></td>
                        <td><%# Eval("Date","{0:dd/MM/yyyy}") %><br />
                            <%# Eval("Time") %></td>

                        <asp:Label ID="id" runat="server" Text='<%#Eval("Order_id") %>' Visible="false"></asp:Label>
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

