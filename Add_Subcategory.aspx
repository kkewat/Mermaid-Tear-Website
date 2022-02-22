<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Add_Subcategory.aspx.cs" Inherits="Add_Subcategory" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="container">
  <div class="form-horizontal">
    <h2 class="Center">Add Sub-Category</h2>

    <div class="form-group">
        <asp:Label ID="Label3" CssClass="col-md-2 control-label" runat="server" Text="Select Main Category"></asp:Label>
        <div class="col-md-3">
            <asp:DropDownList ID="MainCat" runat="server" CssClass="form-control"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Select The Main Category" ControlToValidate="MainCat" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Sub Category"></asp:Label>
        <div class="col-md-3">
            <asp:TextBox ID="SubCat" CssClass="form-control"  runat="server"></asp:TextBox><br />
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Add Sub-Category Name" ControlToValidate="SubCat" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="Center">
        <br /><br />
        <asp:button id="SubCategory" runat="server" CssClass="btn btn-success" text="Add Sub-Category" OnClick="SubCategory_Click" />
        <input id="Reset1" class="btn btn-primary" type="reset" value="reset" />
    </div>

  </div>

   <%-- All Sub-Category Table Starts --%>
  <hr />
  <h1>Sub-Categories</h1>
  <hr />

  <div class="panel panel-default">
     <div class="panel-heading" ><center> All Sub-Category </center></div>
      <asp:Repeater ID="SubCatRepeater" runat="server">
          <HeaderTemplate>
              <table class="table">
                  <thead>
                     <tr>
                        <th>id</th>
                        <th>Sub-Category Name</th>
                        <th>Main-Category Name</th>
                        <th>Edit</th>
                        <th>Delete</th>
                     </tr>
                  </thead>

                  <tbody>
          </HeaderTemplate>

          <ItemTemplate>
              <tr>
                    <th><%# Eval("Sub_Category_id") %></th>
                    <td><%# Eval("SubCategory_Name") %></td>
                    <td><%# Eval("Category_Name") %></td>
                    <td><a href="Edit_SubCat.aspx?id=<%# Eval("Sub_Category_id") %>">edit</a></td>
                    <td><asp:LinkButton ID="Delete" runat="server" CssClass="btn btn-primary" ToolTip="Delete a record." OnClientClick="javascript:return confirm('Are you sure to delete record?')" OnClick="Delete_Click" ><span aria-hidden="true" class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                    <asp:Label ID="id" runat="server" Text='<%#Eval("Sub_Category_id") %>' Visible="false"></asp:Label></td>
              </tr>
          </ItemTemplate>

          <FooterTemplate>
              </tbody>
          </table>
          </FooterTemplate>
      </asp:Repeater>
                       

  </div>

  <%-- All Sub Category Table Finish --%>

</div>

</asp:Content>

