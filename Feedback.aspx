<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Feedback" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" style="word-wrap:break-word;width:100%;top:5px;table-layout:fixed" PageSize="20" AllowPaging="true" >
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
            <asp:BoundField DataField="Product_id" HeaderText="Product_id" SortExpression="Product_id" />
            <asp:BoundField DataField="Feedback" HeaderText="Feedback" SortExpression="Feedback" />
        </Columns>
        <HeaderStyle BackColor="DarkKhaki" Font-Bold="True" ForeColor="Red" />
            <RowStyle BackColor="Khaki" ForeColor="#4A3C8C" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Gold_ShopConnectionString2 %>" SelectCommand="SELECT * FROM [Feedback]"></asp:SqlDataSource>
</asp:Content>

