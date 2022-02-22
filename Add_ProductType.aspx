<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Add_ProductType.aspx.cs" Inherits="Add_ProductType" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="container">
  <div class="form-horizontal">
    <h2 class="Center">Add Product Type</h2>
    <div class="form-group">
        <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Product Type"></asp:Label>
        <div class="col-md-3">
            <asp:TextBox ID="PType" CssClass="form-control"  runat="server"></asp:TextBox><br />
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Add Product Type" ControlToValidate="PType" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="Center">
        <br /><br />
        <asp:button id="AddPType" CssClass="btn btn-success" runat="server" text="Add Type" OnClick="AddPType_Click" />
        <input id="Reset1" type="reset" value="reset" />
    </div>

  </div>
  <%-- All Product Type Table Starts --%>
  <hr />
  <h1><center>Product Type</center></h1>
  <hr />

  <div class="panel panel-default">
     <div class="panel-heading" ><center> All Product Type </center></div>
      <asp:Repeater ID="PTypeRepeater" runat="server">
          <HeaderTemplate>
              <table class="table">
                  <thead>
                     <tr>
                        <th>id</th>
                        <th>Product Type Name</th>
                        <th>Edit</th>
                        <th>Delete</th>
                     </tr>
                  </thead>

                  <tbody>
          </HeaderTemplate>

          <ItemTemplate>
              <tr>
                    <th><%# Eval("ProductType_id") %></th>
                    <td><%# Eval("Product_Type_Name") %></td>
                    <td><a href="Edit_PType.aspx?Type_id=<%# Eval("ProductType_id") %>">edit</a></td>
                    <td><asp:LinkButton ID="Delete" runat="server" CssClass="btn btn-primary" ToolTip="Delete a record." OnClientClick="javascript:return confirm('Are you sure to delete record?')" OnClick="Delete_Click" ><span aria-hidden="true" class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                    <asp:Label ID="id" runat="server" Text='<%#Eval("ProductType_id") %>' Visible="false"></asp:Label></td>
              </tr>
          </ItemTemplate>

          <FooterTemplate>
              </tbody>
          </table>
          </FooterTemplate>
      </asp:Repeater>
                       

  </div>

  <%-- All Product Type Table Finish --%>
</div>

</asp:Content>

