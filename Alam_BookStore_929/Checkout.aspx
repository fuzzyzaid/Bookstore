<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site_6929.Master"  CodeBehind="Checkout.aspx.cs" Inherits="Alam_BookStore_929.Checkout" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">

    <div class="container">
        <h1 id="successMsg" runat="server" class="successMessage"></h1>
        <h1>Check Out Page:</h1>
        <h3>Contact Information</h3>

        <div class="form-group row">
            <label class="control-label col-md-3">Your Email:</label>
            <div class="col-md-5">
                <asp:TextBox ID="txtEmail1" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Email is required" ControlToValidate="txtEmail1" Display="Dynamic" CssClass="text-danger">Email is required</asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group row">
            <label class="control-label col-md-3">Email Re-entry:</label>
            <div class="col-md-5">
                <asp:TextBox ID="txtEmail2" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Re-entry email is required" ControlToValidate="txtEmail2" Display="Dynamic" CssClass="text-danger">Invalid email</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Emails must match" ControlToCompare="txtEmail1" ControlToValidate="txtEmail2" Operator="Equal" CssClass="text-danger">Emails must match</asp:CompareValidator>
            </div>
        </div>

        <div class="form-group row">
            <label class="control-label col-md-3">Your First Name:</label>
            <div class="col-md-5">
                <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="First Name is required" ControlToValidate="txtFirstName" Display="Dynamic" CssClass="text-danger">First Name is required</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name can only contain letters" Display="Dynamic" ValidationExpression="^[A-Za-z\s]+$">First Name can only contain letters</asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="form-group row">
            <label class="control-label col-md-3">Your Last Name:</label>
            <div class="col-md-5">
                <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Last Name is required" ControlToValidate="txtLastName" Display="Dynamic" CssClass="text-danger">Last Name is required</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name can only contain letters" Display="Dynamic" ValidationExpression="^[A-Za-z\s]+$">Last Name can only contain letters</asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="form-group row">
            <label class="control-label col-md-3">Phone:</label>
            <div class="col-md-5">
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Phone is requried" ControlToValidate="txtPhone" Display="Dynamic" CssClass="danger">Pattern is 226-921-0079</asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Phone number is requeried" ControlToValidate="txtPhone" CssClass="danger" Display="Dynamic" SetFocusOnError="True" ValidationExpression="((\d{3}-))\d{3}-\d{4}">Phone number pattens must be 226-921-0079</asp:RegularExpressionValidator>
            </div>
        </div>

        <h3>Billing Address</h3>

        <div class="form-group row">
            <label class="control-label col-md-3">Your Address:</label>
            <div class="col-md-5">
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Address is required" ControlToValidate="txtAddress" Display="Dynamic" CssClass="text-danger">Address is required</asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group row">
            <label class="control-label col-md-3">City:</label>
            <div class="col-md-5">
                <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorCity" runat="server" ErrorMessage="City is required" ControlToValidate="txtCity" Display="Dynamic" CssClass="text-danger">City is required</asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group row">
            <label class="control-label col-md-3">State:</label>
            <div class="col-md-5">
                <asp:TextBox ID="txtState" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorState" runat="server" ErrorMessage="State is required" ControlToValidate="txtState" Display="Dynamic" CssClass="text-danger">State is required</asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group row">
            <label class="control-label col-md-3">Zip Code:</label>
            <div class="col-md-5">
                <asp:TextBox ID="txtZipCode" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorZipCode" runat="server" ErrorMessage="Zip Code is required" ControlToValidate="txtZipCode" Display="Dynamic" CssClass="text-danger">Zip Code is required</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorZipCode" runat="server" ControlToValidate="txtZipCode" ErrorMessage="Invalid Zip Code format" Display="Dynamic" ValidationExpression="^[A-Za-z]\d[A-Za-z]\s\d[A-Za-z]\d$">Invalid Zip Code format - N2M 5M5</asp:RegularExpressionValidator>
            </div>
        </div>

        <h3>Optional Data:</h3>

        <div class="form-group row">
            <label class="control-label col-md-3">Please let me know about:</label>
            <div class="col-md-9">
                <asp:CheckBoxList ID="cblAboutList" CssClass="optional_data" runat="server" RepeatColumns="2">
                    <asp:ListItem Value="New">New Product</asp:ListItem>
                    <asp:ListItem Value="Special">Special Offers</asp:ListItem>
                    <asp:ListItem Value="New">New edition</asp:ListItem>
                    <asp:ListItem Value="Local">Local events</asp:ListItem>
                </asp:CheckBoxList>
            </div>
        </div>

        <div class="form-group row">
            <label class="control-label col-md-3">Please reach us via:</label>
            <div class="col-md-9">
                <asp:RadioButtonList ID="rblContactVia" CssClass="optional_contact" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem>Facebook</asp:ListItem>
                    <asp:ListItem>Twitter</asp:ListItem>
                    <asp:ListItem>Email</asp:ListItem>
                    <asp:ListItem>SMS</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-md-12 text-center">
                <asp:Button ID="btnCheckOut" runat="server" Text="Place Order" OnClick="placeOrder_Click" CssClass="btn btn-primary" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel Order" CssClass="btn" OnClick="cancel_Click" CausesValidation="False" />
                <asp:LinkButton ID="lbtnContinueShopping" runat="server" CssClass="btn" Text="Go Back To Cart" PostBackUrl="~/Cart_929.aspx" CausesValidation="False"></asp:LinkButton>
            </div>
        </div>
    </div>



</asp:Content>


