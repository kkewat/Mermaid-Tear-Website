<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Add_Brand.aspx.cs" Inherits="Add_Brand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
  <div class="form-horizontal">
    <h2 class="Center">Add Brands</h2>
    <div class="form-group">
        <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Brand Name"></asp:Label>
        <div class="col-md-3">
            <asp:TextBox ID="Brandname" CssClass="form-control"  runat="server"></asp:TextBox>
        </div>
    </div>

    <div class="Center">
        <br /><br />
        <asp:button id="AddBrand" runat="server" text="Add Brand" OnClick="AddBrand_Click" />
        <input id="Reset1" type="reset" value="reset" />
    </div>

  </div>
</div>

</asp:Content>

