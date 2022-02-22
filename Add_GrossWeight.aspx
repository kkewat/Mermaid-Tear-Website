<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Add_GrossWeight.aspx.cs" Inherits="Add_GrossWeight" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="container">
  <div class="form-horizontal">
    <h2 class="Center">Add Gross Weight</h2>

    <div class="form-group">
        <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Size"></asp:Label>
        <div class="col-md-3">
            <asp:TextBox ID="weight" CssClass="form-control"  runat="server"></asp:TextBox><br />
            <asp:Label ID="Label2" runat="server"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Add Weight" ControlToValidate="weight" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="Label3" CssClass="col-md-2 control-label" runat="server" Text="Brand"></asp:Label>
        <div class="col-md-3">
            <asp:DropDownList ID="brand" runat="server" CssClass="form-control"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Select The Main Brand" ControlToValidate="brand" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>

   <div class="form-group">
        <asp:Label ID="Label4" CssClass="col-md-2 control-label" runat="server" Text="Category"></asp:Label>
        <div class="col-md-3">
            <asp:DropDownList ID="Category" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="Category_SelectedIndexChanged"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Select The Main Category" ControlToValidate="Category" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="Label5" CssClass="col-md-2 control-label" runat="server" Text="Sub Category"></asp:Label>
        <div class="col-md-3">
            <asp:DropDownList ID="SubCat" runat="server" CssClass="form-control"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Select The Main Category" ControlToValidate="SubCat" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="Label6" CssClass="col-md-2 control-label" runat="server" Text="Product Type"></asp:Label>
        <div class="col-md-3">
            <asp:DropDownList ID="Type" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="Type_SelectedIndexChanged"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*Select The type" ControlToValidate="Type" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="Label7" CssClass="col-md-2 control-label" runat="server" Text="Sub type"></asp:Label>
        <div class="col-md-3">
            <asp:DropDownList ID="SubType" runat="server" CssClass="form-control"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*Select The Sub type" ControlToValidate="Subtype" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="Label8" CssClass="col-md-2 control-label" runat="server" Text="Gender"></asp:Label>
        <div class="col-md-3">
            <asp:DropDownList ID="Gender" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>
    </div>

    <div class="Center">
        <br /><br />
        <asp:button id="weight_enter" runat="server" CssClass="btn btn-success" text="Add Weight" OnClick="weight_enter_Click"   />
        <input id="Reset1" type="reset" value="reset" />
    </div>

  </div>

   <%-- All Weight Starts --%>
  <hr />
  <h1>Gross Weight</h1>
  <hr />

  <div class="panel panel-default">
     <div class="panel-heading" ><center> All Gross Weight </center></div>
      <asp:Repeater ID="SizeRepeater" runat="server">
          <HeaderTemplate>
              <table class="table">
                  <thead>
                     <tr>
                        <th>id</th>
                        <th>Weight</th>
                        <th>Brand Name</th>
                        <th>Category</th>
                        <th>Sub-Category</th>
                        <th>Gender</th>
                        <th>Product Type</th>
                        <th>Sub-Type</th>
                        <th>Edit</th>
                        <th>Delete</th>
                     </tr>
                  </thead>

                  <tbody>
          </HeaderTemplate>

          <ItemTemplate>
              <tr>
                    <th><%# Eval("Weight_id") %></th>
                    <td><%# Eval("Weight_Name") %></td>
                    <td><%# Eval("Brand_name") %></td>
                    <td><%# Eval("Category_Name") %></td>
                    <td><%# Eval("SubCategory_Name") %></td>
                    <td><%# Eval("Gender_Name") %></td>
                    <td><%# Eval("Product_Type_Name") %></td>
                    <td><%# Eval("Product_Subtype_name") %></td>
                    <td><a href="Edit_GrossWeight.aspx?id=<%# Eval("Weight_id") %>">edit</a></td>
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

  <%-- All Weight Table Finish --%>

</div>

</asp:Content>

