<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Add_Product.aspx.cs" Inherits="Add_Product"  EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
  <div class="form-horizontal">
    <h2 class="Center">Add Products</h2>
    <div class="form-group">
        <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Product Name"></asp:Label>
        <div class="col-md-3">
            <asp:TextBox ID="Productname" CssClass="form-control"  runat="server"></asp:TextBox>
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="Label2" CssClass="col-md-2 control-label" runat="server" Text="Price"></asp:Label>
        <div class="col-md-3">
            <asp:TextBox ID="Productprice" CssClass="form-control" TextMode="Number" runat="server"></asp:TextBox>
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="Label3" CssClass="col-md-2 control-label" runat="server" Text="Selling Price"></asp:Label>
        <div class="col-md-3">
            <asp:TextBox ID="ProductSellingprice" CssClass="form-control" runat="server"></asp:TextBox>
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="Label4" CssClass="col-md-2 control-label" runat="server" Text="Brand"></asp:Label>
        <div class="col-md-3">
            <asp:DropDownList ID="Product_Brand" runat="server"></asp:DropDownList>
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="Label5" CssClass="col-md-2 control-label" runat="server" Text="Category"></asp:Label>
        <div class="col-md-3">
            <asp:DropDownList ID="Product_Category" runat="server"  OnSelectedIndexChanged="Product_Category_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="Label6" CssClass="col-md-2 control-label" runat="server" Text="Sub-Category" ></asp:Label>
        <div class="col-md-3">
            <asp:DropDownList ID="Sub_Category" runat="server" AutoPostBack="true"></asp:DropDownList>
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="Label14" CssClass="col-md-2 control-label" runat="server" Text="Product-Type"></asp:Label>
        <div class="col-md-3">
            <asp:DropDownList ID="ProductType" runat="server" OnSelectedIndexChanged="Product_Type_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="Label15" CssClass="col-md-2 control-label" runat="server" Text="Sub-Type"></asp:Label>
        <div class="col-md-3">
            <asp:DropDownList ID="Sub_type" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Sub_type_SelectedIndexChanged"></asp:DropDownList>
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="Label16" CssClass="col-md-2 control-label" runat="server" Text="Gender"></asp:Label>
        <div class="col-md-3">
            <asp:DropDownList ID="Gender" runat="server" AutoPostBack="true"></asp:DropDownList>
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="Label18" CssClass="col-md-2 control-label" runat="server" Text="Size"></asp:Label>
        <div class="col-md-3">
            <asp:CheckBoxList ID="CheckBoxSize" CssClass="form-control" RepeatDirection="Horizontal" AutoPostBack="true" runat="server"></asp:CheckBoxList>
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="Label19" CssClass="col-md-2 control-label" runat="server" Text="Gross-Weight"></asp:Label>
        <div class="col-md-3">
            <asp:CheckBoxList ID="CheckBoxWeight" CssClass="form-control" RepeatDirection="Horizontal" AutoPostBack="true" runat="server"></asp:CheckBoxList>
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="Label17" CssClass="col-md-2 control-label" runat="server" Text="Quantity"></asp:Label>
        <div class="col-md-3">
            <asp:TextBox ID="Product_Stock" CssClass="form-control"  runat="server"></asp:TextBox>
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="Label7" CssClass="col-md-2 control-label" runat="server" Text="Description"></asp:Label>
        <div class="col-md-3">
            <asp:TextBox ID="Product_Description" TextMode="MultiLine" CssClass="form-control"  runat="server"></asp:TextBox>
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="Label8" CssClass="col-md-2 control-label" runat="server" Text="Product Detail"></asp:Label>
        <div class="col-md-3">
            <asp:TextBox ID="Product_detail" TextMode="MultiLine" CssClass="form-control"  runat="server"></asp:TextBox>
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="Label9" CssClass="col-md-2 control-label" runat="server" Text="Upload Images"></asp:Label>
        <div class="col-md-3">
            <asp:FileUpload ID="product_image1" runat="server" />
            <%--<asp:RequiredFieldValidator ID="Required" runat="server" ControlToValidate="product_image1" ErrorMessage="Required image"></asp:RequiredFieldValidator>--%>
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="Label10" CssClass="col-md-2 control-label" runat="server" Text="Upload Images"></asp:Label>
        <div class="col-md-3">
            <asp:FileUpload ID="product_image2" runat="server" />
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="Label11" CssClass="col-md-2 control-label" runat="server" Text="Upload Images"></asp:Label>
        <div class="col-md-3">
            <asp:FileUpload ID="product_image3" runat="server" />
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="Label12" CssClass="col-md-2 control-label" runat="server" Text="Upload Images"></asp:Label>
        <div class="col-md-3">
            <asp:FileUpload ID="product_image4" runat="server" />
        </div>
    </div>

    <div class="form-group">
        <asp:Label ID="Label13" CssClass="col-md-2 control-label" runat="server" Text="Upload Images"></asp:Label>
        <div class="col-md-3">
            <asp:FileUpload ID="product_image5" runat="server" />
        </div>
    </div>

    <div>
        <asp:label runat="server" CssClass="col-md-2 control-label" text="15 Days Return"></asp:label>
        <div class="col-md-3">
            <asp:checkbox ID="Return" runat="server"></asp:checkbox>
        </div>
    </div>

    <div>
        <asp:label runat="server" CssClass="col-md-2 control-label" text="Free Shipping"></asp:label>
        <div class="col-md-3">
            <asp:checkbox ID="Shipping" runat="server"></asp:checkbox>
        </div>
    </div>
    
    <div class="Center">
        <br /><br />
        <asp:button id="AddProduct" runat="server" CssClass="btn btn-success" text="Add Product" OnClick="AddProduct_Click" />
        <input id="Reset1" type="reset" value="Clear" />
    </div>


  </div>
</div>

</asp:Content>

