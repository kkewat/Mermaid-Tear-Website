<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Add_Brand.aspx.cs" Inherits="Add_Brand" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
  <div class="form-horizontal">
    <h2 class="Center">Add Brands</h2>
    <div class="form-group">
        <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Brand Name"></asp:Label>
        <div class="col-md-3">
            <asp:TextBox ID="Brandname" CssClass="form-control"  runat="server"></asp:TextBox><br />
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Add Brand Name" ControlToValidate="Brandname" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>--%>
        </div>
    </div>
    <div class="Center">
        <br /><br />
        <asp:button id="AddBrand" CssClass="btn btn-success" runat="server" text="Add Brand" OnClick="AddBrand_Click" />
        <input id="Reset1" type="reset" value="reset" />
    </div>

  </div>
  <%-- All Brands Table Starts --%>
  <hr />
  <h1>Brands</h1>
  <hr />

  <div class="panel panel-default">
     <div class="panel-heading" ><center> All Brands </center></div>
      <asp:Repeater ID="BrandRepeater" runat="server">
          <HeaderTemplate>
              <table class="table">
                  <thead>
                     <tr>
                        <th>id</th>
                        <th>Brand Name</th>
                        <th>Edit</th>
                        <th>Delete</th>
                     </tr>
                  </thead>

                  <tbody>
          </HeaderTemplate>

          <ItemTemplate>
              <tr>
                    <th><%# Eval("Brand_id") %></th>
                    <td><%# Eval("Brand_name") %></td>
                    <td><a href="EditBrand.aspx?Brand_id=<%# Eval("Brand_id") %>">edit</a></td>
                    <td>
                        <asp:LinkButton ID="DeleteBrand" runat="server" CssClass="btn btn-primary" ToolTip="Delete a record." OnClientClick="javascript:return confirm('Are you sure to delete record?')" OnClick="DeleteBrand_Click" ><span aria-hidden="true" class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                        <asp:Label ID="id" runat="server" Text='<%#Eval("Brand_id") %>' Visible="false"></asp:Label>
                    </td>
              </tr>
          </ItemTemplate>

          <FooterTemplate>
              </tbody>
          </table>
          </FooterTemplate>
      </asp:Repeater>
                       

  </div>

  <%-- All Brands Table Finish --%>
</div>

</asp:Content>

