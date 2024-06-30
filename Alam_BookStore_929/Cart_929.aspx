<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site_6929.Master" CodeBehind="Cart_929.aspx.cs" Inherits="Alam_BookStore_929.Cart_929" %>


<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
      <div class="cart_container">

           <div class="row cart_header">
            <div class="col-sm-12">
                <h1>Your Shopping Cart</h1>
            </div>
         </div>

       <div class="row">
            <div class="col-sm-6">
                <div class="form-group">
                    <asp:ListBox ID="lstCart" runat="server" CssClass="form-control"></asp:ListBox>
                </div>
            </div>
            <div class="col-sm-6">
                <div class="form-group">
                    <div class="col-sm-12">
                        <asp:Button ID="btnRemove" runat="server" Text="Remove Item" CssClass="btn btn-danger removeBtn" OnClick="removeItem_Click" />
                    </div>
                    <div class="col-sm-12">
                        <asp:Button ID="btnEmpty" runat="server" Text="Empty Cart" CssClass="btn btn-warning" OnClick="emptyCart_Click" />
                    </div>
                </div>
            </div>
       </div>

       <div class="row">
            <div class="col-sm-12">
                <div class="form-group">
                    <asp:Label ID="lblMessage" runat="server" EnableViewState="False" CssClass="text-info"></asp:Label>
                </div>
                <div class="form-group cart_btns">
                    <div class="col-sm-12">
                        <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" PostBackUrl="~/Products.aspx" CausesValidation="False" CssClass="btn btn-primary continue_btn" />
                        <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" PostBackUrl="~/Checkout.aspx" CausesValidation="False" CssClass="btn btn-success" />
                    </div>
                </div>
            </div>
       </div>

      </div>

</asp:Content>

