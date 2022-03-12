<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Show_User.aspx.cs" Inherits="Show_User" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="panel-heading">
                <center> All User </center><br /><hr />
            </div>
    <div class="col-md-12">
        <asp:GridView ID="User" style="word-wrap:break-word;width:100%;top:5px;table-layout:fixed" runat="server" AutoGenerateColumns="False" DataKeyNames="User_id" DataSourceID="SqlDataSource1" PageSize="20" AllowPaging="true">
            <Columns>
                <asp:BoundField DataField="User_id" HeaderText="User_id" InsertVisible="False" ReadOnly="True" SortExpression="User_id" />
                <asp:BoundField DataField="First_Name" HeaderText="First_Name" SortExpression="First_Name" />
                <asp:BoundField DataField="Last_Name" HeaderText="Last_Name" SortExpression="Last_Name" />
                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                <asp:BoundField DataField="Phone_no" HeaderText="Phone_no" SortExpression="Phone_no" />
                <asp:BoundField DataField="User_Type" HeaderText="User_Type" SortExpression="User_Type" />
                
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                
            </Columns>
            <HeaderStyle BackColor="#0000A0" Font-Bold="True" ForeColor="Red" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
            <EditRowStyle BackColor="Yellow" ForeColor="Blue"  />
            
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Gold_ShopConnectionString2 %>" SelectCommand="SELECT [User_id], [First_Name], [Last_Name], [Username], [Email], [Gender], [Phone_no], [User_Type] FROM [User_detail] WHERE ([User_Type] = @User_Type)" UpdateCommand="UPDATE User_detail SET First_Name = @First_Name, Last_Name = @Last_Name, Username = @Username, Email = @Email, Phone_no = @Phone_no, Gender = @Gender, User_Type = @User_Type Where User_id = @User_id " DeleteCommand="DELETE FROM User_detail WHERE (User_id = @User_id)">
            <SelectParameters>
                <asp:Parameter DefaultValue="User" Name="User_Type" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>


</asp:Content>

