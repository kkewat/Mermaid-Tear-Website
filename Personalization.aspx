<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Personalization.aspx.cs" Inherits="Personalization" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h1><center>Personaliztion jewellery Requests</center></h1>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" style="word-wrap:break-word;width:100%;top:5px;table-layout:fixed" PageSize="20" AllowPaging="true">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            <asp:BoundField DataField="metal" HeaderText="metal" SortExpression="metal" />
            <asp:BoundField DataField="minimum_price" HeaderText="minimum_price" SortExpression="minimum_price" />
            <asp:BoundField DataField="maximum_price" HeaderText="maximum_price" SortExpression="maximum_price" />
            <asp:BoundField DataField="phone_no" HeaderText="phone_no" SortExpression="phone_no" />
            <asp:BoundField DataField="email_id" HeaderText="email_id" SortExpression="email_id" />
            <%--<asp:BoundField DataField="image_url" HeaderText="image_url" SortExpression="image_url" />--%>
            <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
            <asp:BoundField DataField="details" HeaderText="details" SortExpression="details" />
            <asp:TemplateField HeaderText="Sample Image">
            <ItemTemplate>
                <asp:Image ID="Image1" ImageUrl='<%# Eval("image_url") %>' runat="server" Style="height:60px;width:70px" />
            </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Gold_ShopConnectionString2 %>" SelectCommand="SELECT * FROM [Personalization_Request] ORDER BY [id] DESC"></asp:SqlDataSource>

</asp:Content>

