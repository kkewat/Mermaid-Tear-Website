<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminView_Product.aspx.cs" Inherits="AdminView_Product_aspx" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="padding-top:50px">
        <div class="col-md-5">
            <div style="max-width:480px" class="thumbnail">
            <%--Products Image Slider Starts  --%>
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                  <!-- Indicators -->
                  <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="4"></li>
                  </ol>

                  <!-- Wrapper for slides -->
                  <div class="carousel-inner" role="listbox">

                   <asp:Repeater ID="Imagerptr" runat="server">
                     <ItemTemplate>
                       <div class="item <%# GetActiveImage(Container.ItemIndex) %>">
                         <img src="Images/Product_Images/<%#Eval("Product_id") %>/<%#Eval("Name") %><%#Eval("Extension") %>" alt="<%#Eval("Name") %>" title="image taken from <%#Eval("Brand_name") %>.com" onerror="this.src='Images/no_img.png'" />
                        <div class="carousel-caption">
                          
                        </div>
                      </div>
                    </ItemTemplate>
                  </asp:Repeater>

                  </div>

                  <!-- Controls -->
                  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                  </a>
                  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                  </a>
                </div>
            <%--Products Image Slider Ends  --%>
            </div>
        </div>

        <div class="col-md-5">
            <asp:Repeater ID="ProDetailrptr" runat="server" OnItemDataBound="ProDetailrptr_ItemDataBound">
            <ItemTemplate>
           <div class="divDet1">
               <h1 class="proNameView"><%# Eval("Product_Name") %></h1>
                <span class="pro_OriginalPriceView">Rs. <%# Eval("Product_ListPrice","{0:0.00}") %></span> <span class="proPriceDiscountView"> (Rs. <%# (Convert.ToInt32(Eval("Product_ListPrice")))-(Convert.ToInt32(Eval("Product_SellingPrice")))%> off)</span>
                <p class="proPriceView"><b>Rs. </b><%# Eval("Product_SellingPrice","{0:0.00}") %></p><br />
           </div>
         
         <div>
         <h5 class="h5Size"> Stocks </h5>
         <div>
             <asp:Label ID="Stock" runat="server" Text=""></asp:Label>
         </div>
         </div>
                    
        <div >
            <h5 class="h5Size">Size</h5>
            <div>
                <asp:RadioButtonList ID="rblSize" runat="server" RepeatDirection="Horizontal">
                    <%--<asp:ListItem Value="17.20 mm" Text="17.20 mm"></asp:ListItem>--%>
                </asp:RadioButtonList>
            </div>
        </div>

        <div >
            <h5 class="h5Size">Weight</h5>
            <div>
                <asp:RadioButtonList ID="rblWeight" runat="server" RepeatDirection="Horizontal" >
                    <%--<asp:ListItem Value="17.20 mm" Text="17.20 mm"></asp:ListItem>--%>
                </asp:RadioButtonList>
            </div>
        </div>

        <div class="divDet1">
            <asp:Button ID="AddToCartbtn" CssClass="mainButton" runat="server" Text="Add to Cart" OnClick="AddToCartbtn_Click" />
            <asp:Label ID="Labelerror" runat="server" CssClass="danger" ></asp:Label>
        
        </div>
        <div class="divDet1">
            <h5 class="h5Size">Description</h5>
            <p><%# Eval("Product_Description") %></p>
            <h5 class="h5Size">Product Details</h5>
            <p><%# Eval("product_Detail") %></p>

        </div>
        <div>
        <p><%# ((int)Eval("Shipping")==1)?"Free Shipping":"" %></p>
        <p><%# ((int)Eval("Return_15_Days")==1)?"15 Days Return":"" %></p>
        </div>

                <asp:HiddenField ID="hiddenCatid" runat="server" Value='<%# Eval("Product_CategoryId") %>' />
                <asp:HiddenField ID="HiddenSubCatid" runat="server" Value='<%# Eval("Product_SubCategoryId") %>' />
                <asp:HiddenField ID="HiddenGenderid" runat="server" Value='<%# Eval("Product_Gender") %>' />
                <asp:HiddenField ID="HiddenPTypeid" runat="server" Value='<%# Eval("Product_Type") %>' />
                <asp:HiddenField ID="HiddenPSubTypeid" runat="server" Value='<%# Eval("Product_SubType") %>' />
                <asp:HiddenField ID="HiddenBrand" runat="server" Value='<%# Eval("Product_BrandId") %>' />

        </ItemTemplate>
        </asp:Repeater>
        <div>
            <asp:Label ID="Label1" runat="server" Text="FEEDBACK"></asp:Label><br />
            <asp:TextBox ID="feedback" TextMode="MultiLine" runat="server"></asp:TextBox><br />
            <asp:Button ID="fedbacck" runat="server" Text="send" OnClick="fedbacck_Click" />
        </div>
    </div>
    </div>
</asp:Content>

