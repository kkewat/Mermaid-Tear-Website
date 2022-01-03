<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Add_Subcategory.aspx.cs" Inherits="Add_Subcategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="container">
  <div class="form-horizontal">
    <h2 class="Center">Add Sub-Category</h2>
    <div class="form-group">
        <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Sub Category"></asp:Label>
        <div class="col-md-3">
            <asp:TextBox ID="SubCat" CssClass="form-control"  runat="server"></asp:TextBox>
        </div>
    </div>

    <div class="Center">
        <br /><br />
        <asp:button id="SubCategory" runat="server" text="Add Sub-Category" OnClick="SubCategory_Click" />
        <input id="Reset1" type="reset" value="reset" />
    </div>

  </div>
</div>

</asp:Content>

