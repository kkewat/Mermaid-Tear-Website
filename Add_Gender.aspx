<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Add_Gender.aspx.cs" Inherits="Add_Gender" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="container">
  <div class="form-horizontal">
    <h2 class="Center">Add Genders</h2>
    <div class="form-group">
        <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Gender Name"></asp:Label>
        <div class="col-md-3">
            <asp:TextBox ID="Gendername" CssClass="form-control"  runat="server"></asp:TextBox><br />
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            <asp:Label ID="err" CssClass="text-danger" ForeColor="Red" runat="server" Text=""></asp:Label>
            <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Add Gender Name" ControlToValidate="gendername" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>--%>
        </div>
    </div>

    <div class="Center">
        <br /><br />
        <asp:button id="AddGender" runat="server" CssClass="btn btn-success" text="Add Gender" OnClick="AddGender_Click" />
        <input type='button' id='resetButton' value='Reset' onclick='theForm.reset();return false;'/>
    </div>

  </div>

   <%-- All Gender Table Starts --%>
  <hr />
  <h1>Gender</h1>
  <hr />

  <div class="panel panel-default">
     <div class="panel-heading" ><center> All Genders </center></div>
      <asp:Repeater ID="GenderRepeater" runat="server">
          <HeaderTemplate>
              <table class="table">
                  <thead>
                     <tr>
                        <th>id</th>
                        <th>Gender Name</th>
                        <th>Edit</th>
                        <th>Delete</th>
                     </tr>
                  </thead>

                  <tbody>
          </HeaderTemplate>

          <ItemTemplate>
              <tr>
                    <th><%# Eval("Gender_id") %></th>
                    <td><%# Eval("Gender_Name") %></td>
                    <td><a href="Edit_Gender.aspx?gend_id=<%# Eval("Gender_id") %>">edit</a></td>
                    <td><asp:LinkButton ID="Delete" runat="server" CssClass="btn btn-primary" ToolTip="Delete a record." OnClientClick="javascript:return confirm('Are you sure to delete record?')" OnClick="Delete_Click" ><span aria-hidden="true" class="glyphicon glyphicon-trash"></span></asp:LinkButton>
                    <asp:Label ID="id" runat="server" Text='<%#Eval("Gender_id") %>' Visible="false"></asp:Label></td>
              </tr>
          </ItemTemplate>

          <FooterTemplate>
              </tbody>
          </table>
          </FooterTemplate>
      </asp:Repeater>
                       

  </div>

  <%-- All Gender Table Finish --%>

</div>

</asp:Content>

