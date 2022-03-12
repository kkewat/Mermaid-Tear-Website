<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ManageSlider.aspx.cs" Inherits="ManageSlider" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container">
        <div class="form-horizontal">
            <div class="col-md-4">
            <h2 class="Center">Add Slider Images</h2>
            <div class="form-group">
                <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="image Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="imagename" CssClass="form-control" runat="server"></asp:TextBox><br />
                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Add Brand Name" ControlToValidate="Brandname" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label3" CssClass="col-md-2 control-label" runat="server" Text="Heading Name"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="HName" CssClass="form-control" runat="server"></asp:TextBox><br />
                    <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Add Brand Name" ControlToValidate="Brandname" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label5" CssClass="col-md-2 control-label" runat="server" Text="Detail"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="detail" CssClass="form-control" runat="server"></asp:TextBox><br />
                    <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Add Brand Name" ControlToValidate="Brandname" CssClass="text-danger" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label7" CssClass="col-md-2 control-label" runat="server" Text="Upload Image"></asp:Label>
                <div class="col-md-3">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </div>
            </div>

            <div class="Center">
                <br />
                <br />
                <asp:Button ID="AddSlider" CssClass="btn btn-success" runat="server" Text="Add Slider Image" OnClick="AddSlider_Click" />
                <input id="Reset1" type="reset" value="reset" />
            </div>
            </div>

            <div class="col-md-8">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" style="word-wrap:break-word;width:100%;top:5px;table-layout:fixed" PageSize="20" AllowPaging="true" >
                    <Columns>
                        <%--<asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />--%>
                        <asp:TemplateField HeaderText="id">
                        <ItemTemplate>
                            <asp:Label ID="id" runat="server" Text='<%#Eval("id") %>' ></asp:Label>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="Image1" ImageUrl='<%# Eval("ImageUrl") %>' runat="server" style="width:50px;height:50px" />
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Image_Name" HeaderText="Image_Name" SortExpression="Image_Name" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                        <asp:BoundField DataField="Heading_Name" HeaderText="Heading_Name" SortExpression="Heading_Name" />
                        <asp:BoundField DataField="Details" HeaderText="Details" SortExpression="Details" />
               
                        <asp:TemplateField HeaderText="Change Status">
                        <ItemTemplate>
                            <asp:Button ID="Stat" runat="server" Text="Update" OnClick="Stat_Click" />

                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Gold_ShopConnectionString2 %>" SelectCommand="SELECT * FROM [Slider] ORDER BY [Status]"  ></asp:SqlDataSource>
            </div>

        </div>
    </div>

</asp:Content>

