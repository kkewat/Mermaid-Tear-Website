<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Edit_GrossWeight.aspx.cs" EnableEventValidation="false" Inherits="Edit_GrossWeight" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Weight ID:</label>
                            <asp:TextBox ID="txtID" CssClass="form-control" runat="server" AutoPostBack="true" ReadOnly="True"></asp:TextBox><br /><br />
                            <label>Weight Name:</label>
                            <asp:TextBox ID="txtName" CssClass="form-control" runat="server" AutoPostBack="true" ReadOnly="True"></asp:TextBox>
                        </div>
                        <div class="form-group">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Update Weight Name:</label>
                            <asp:TextBox ID="txtUpdateWeightName" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="UpdateWeight" CssClass="btn btn-primary " runat="server" Text="UPDATE" OnClick="UpdateWeight_Click"/>
                        </div>
                    </div>
                </div>
                </div>
            </div>
         </div>

</asp:Content>

