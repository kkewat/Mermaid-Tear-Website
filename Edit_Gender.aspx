﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Edit_Gender.aspx.cs" Inherits="Edit_Gender" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Edit Gender</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Gender ID:</label>
                            <asp:TextBox ID="txtID" CssClass="form-control" runat="server" AutoPostBack="true" ReadOnly="True"></asp:TextBox><br /><br />
                            <label>Gender Name:</label>
                            <asp:TextBox ID="txtName" CssClass="form-control" runat="server" AutoPostBack="true" ReadOnly="True"></asp:TextBox>
                        </div>
                        <div class="form-group">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>Update Gender Name:</label>
                            <asp:TextBox ID="txtUpdateGenderName" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="UpdateGender" CssClass="btn btn-primary " runat="server" Text="UPDATE" OnClick="UpdateGender_Click"/>
                        </div>
                    </div>
                </div>
                </div>
            </div>
         </div>

</asp:Content>

