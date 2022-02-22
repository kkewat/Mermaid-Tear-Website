<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Edit_SubCat.aspx.cs" Inherits="Edit_Sub_Cat" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Sub Category ID:</label>
                            <asp:TextBox ID="txtID" CssClass="form-control" runat="server" AutoPostBack="true" ReadOnly="True"></asp:TextBox><br />
                            <br />
                            <label>Sub Category Name:</label>
                            <asp:TextBox ID="txtName" CssClass="form-control" runat="server" AutoPostBack="true" ReadOnly="True"></asp:TextBox>
                        </div>
                        <div class="form-group">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Update Sub Category Name:</label>
                            <asp:TextBox ID="txtUpdateSubCatName" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="UpdateSubCat" CssClass="btn btn-primary " runat="server" Text="UPDATE" OnClick="UpdateSubCat_Click" />
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>

</asp:Content>

