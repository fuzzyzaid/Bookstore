<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site_6929.Master" CodeBehind="Products.aspx.cs" Inherits="Alam_BookStore_929.Products" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
       <div id="productForm" class="container">
    <p id="welcomeUserMsg" runat="server" class="welcomeMsg"></p>
    <div class="row">
        <div class="col-md-8">
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-4 control-label">Please select a Book:</label>
                    <div class="col-sm-8">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Alam_BookStore_929ConnectionString %>" SelectCommand="SELECT [Id], [BookName], [AuthorName], [Description], [GenreId], [image], [price] FROM [Books] ORDER BY [BookName]"></asp:SqlDataSource>
                        <asp:DropDownList ID="booksDropDown" runat="server" DataSourceID="SqlDataSource1" DataTextField="BookName" DataValueField="Id" AutoPostBack="True" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <h4><asp:Label ID="bookName" runat="server"></asp:Label></h4>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="bookAuthor" runat="server"></asp:Label>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="bookDescription" runat="server"></asp:Label>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Label ID="bookPrice" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <asp:Image ID="bookImage" runat="server" class="img_css" />
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-2 control-label quantity">Quantity:</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-6">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger"
                            runat="server" ControlToValidate="txtQuantity" Display="Dynamic"
                            ErrorMessage="Enter at least 1 item to proceed further.">
                        </asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="text-danger"
                            ControlToValidate="txtQuantity" Display="Dynamic"
                            ErrorMessage="Quantity must range from 1 to 500."
                            MaximumValue="500" MinimumValue="1" Type="Integer">
                        </asp:RangeValidator>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Button ID="btnAdd" runat="server" Text="Add to the Cart" CssClass="btn btn-primary" OnClick="addToCart_Click" />
                        <asp:Button ID="btnCart" runat="server" Text="Go to the Cart"
                            PostBackUrl="~/Cart_929.aspx" CausesValidation="False" CssClass="btn btn-success" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</asp:Content>

