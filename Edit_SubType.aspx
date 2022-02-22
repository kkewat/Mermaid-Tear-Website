<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Edit_SubType.aspx.cs" Inherits="Edit_SubType" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Sub Type ID:</label>
                            <asp:TextBox ID="txtID" CssClass="form-control" runat="server" AutoPostBack="true" ReadOnly="True"></asp:TextBox><br />
                            <br />
                            <label>Sub Type Name:</label>
                            <asp:TextBox ID="txtName" CssClass="form-control" runat="server" AutoPostBack="true" ReadOnly="True"></asp:TextBox>
                        </div>
                        <div class="form-group">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Update Sub Type Name:</label>
                            <asp:TextBox ID="txtUpdateSubTypeName" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="UpdateSubtype" CssClass="btn btn-primary " runat="server" Text="UPDATE" OnClick="UpdateSubtype_Click" />
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>

</asp:Content>

