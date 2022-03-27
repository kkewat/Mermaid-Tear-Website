<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Add_Categories.aspx.cs" Inherits="Add_Categories" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="container">
  <div class="form-horizontal">
    <h2 class="Center">Add Categories</h2>
    <div class="form-group">
        <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Category Name"></asp:Label>
        <div class="col-md-3">
            <asp:TextBox ID="Catname" CssClass="form-control"  runat="server"></asp:TextBox><br />
            <asp:Label ID="err" runat="server" Text="" CssClass="text-danger" ForeColor="Red"></asp:Label>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Add Category Name" ControlToValidate="Catname" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>--%>
        </div>
    </div>

    <div class="Center">
        <br /><br />
        <asp:button id="AddCategories" runat="server" CssClass="btn btn-success" text="Add Category" OnClick="AddCategories_Click" />
        <input type='button' id='resetButton' value='Reset' onclick='theForm.reset();return false;'/>
    </div>

  </div>

  <%-- All CAtegory Table Starts --%>
  <hr />
  <h1>Ctegories</h1>
  <hr />

  <div class="panel panel-default">
     <div class="panel-heading" ><center> All categories </center></div>
      <asp:Repeater ID="CatRepeater" runat="server">
          <HeaderTemplate>
              <table class="table">
                  <thead>
                     <tr>
                        <th>id</th>
                        <th>Category Name</th>
                        <th>Edit</th>
                        <th>Delete</th>
                     </tr>
                  </thead>

                  <tbody>
          </HeaderTemplate>

          <ItemTemplate>
              <tr>
                    <th><%# Eval("Category_id") %></th>
                    <td><%# Eval("Category_Name") %></td>
                    <td><a href="EditCategory.aspx?Category_id=<%# Eval("Category_id") %>">edit</a></td>
                    <td><asp:LinkButton ID="Delete" runat="server" CssClass="btn btn-primary" ToolTip="Delete a record." OnClientClick="javascript:return confirm('Are you sure to delete record?')" OnClick="Delete_Click" ><span aria-hidden="true" class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                    <asp:Label ID="id" runat="server" Text='<%#Eval("Category_id") %>' Visible="false"></asp:Label></td>
              </tr>
          </ItemTemplate>

          <FooterTemplate>
              </tbody>
          </table>
          </FooterTemplate>
      </asp:Repeater>
                       

  </div>

  <%-- All Categories Table Finish --%>
</div>


</asp:Content>

