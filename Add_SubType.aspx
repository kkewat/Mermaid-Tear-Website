<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Add_SubType.aspx.cs" Inherits="Add_SubType" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="container">
  <div class="form-horizontal">
    <h2 class="Center">Add Sub-Type</h2>

    <div class="form-group">
        <asp:Label ID="Label3" CssClass="col-md-2 control-label" runat="server" Text="Select Main Category"></asp:Label>
        <div class="col-md-3">
            <asp:DropDownList ID="Maintype" runat="server" CssClass="form-control"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Select The Main Product Type" ControlToValidate="Maintype" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Sub Type"></asp:Label>
        <div class="col-md-3">
            <asp:TextBox ID="SubType" CssClass="form-control"  runat="server"></asp:TextBox><br />
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Add Sub-Type Name" ControlToValidate="SubType" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="Center">
        <br /><br />
        <asp:button id="SubTypebut" runat="server" CssClass="btn btn-success" text="Add Sub-Type" OnClick="SubTypebut_Click"/>
        <input id="Reset1" type="reset" value="Clear" />
    </div>

  </div>

   <%-- All Sub-Product Type Table Starts --%>
  <hr />
  <h1>Sub-type</h1>
  <hr />

  <div class="panel panel-default">
     <div class="panel-heading" ><center> All Sub-Category </center></div>
      <asp:Repeater ID="SubTypeRepeater" runat="server">
          <HeaderTemplate>
              <table class="table">
                  <thead>
                     <tr>
                        <th>id</th>
                        <th>Sub-Type Name</th>
                        <th>Main-type Name</th>
                        <th>Edit</th>
                        <th>Delete</th>
                     </tr>
                  </thead>

                  <tbody>
          </HeaderTemplate>

          <ItemTemplate>
              <tr>
                    <th><%# Eval("Product_SubType_id") %></th>
                    <td><%# Eval("Product_Subtype_name") %></td>
                    <td><%# Eval("Product_Type_Name") %></td>
                    <td><a href="Edit_SubType.aspx?id=<%# Eval("Product_SubType_id") %>">edit</a></td>
                    <td><asp:LinkButton ID="Delete" runat="server" CssClass="btn btn-primary" ToolTip="Delete a record." OnClientClick="javascript:return confirm('Are you sure to delete record?')" OnClick="Delete_Click" ><span aria-hidden="true" class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                    <asp:Label ID="id" runat="server" Text='<%#Eval("Product_SubType_id") %>' Visible="false"></asp:Label></td>
              </tr>
          </ItemTemplate>

          <FooterTemplate>
              </tbody>
          </table>
          </FooterTemplate>
      </asp:Repeater>
                       

  </div>
  </div>

  <%-- All Sub Type Table Finish --%>

</asp:Content>

