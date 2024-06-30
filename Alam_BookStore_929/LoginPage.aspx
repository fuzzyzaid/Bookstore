<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site_6929.Master" CodeBehind="LoginPage.aspx.cs" Inherits="Alam_BookStore_929.LoginPage" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">
      <div id="loginPage" class="container">
            <h2 class="text-center">Login Page</h2>

           
                <div class="col-md-6 login_box">
                    <div class="form-group">
                        <label for="txtFirstName">First Name:</label>
                        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="First Name is required" ControlToValidate="txtFirstName" Display="Dynamic" CssClass="text-danger" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name can only be letters and no symbols" Display="Dynamic" ValidationExpression="^[A-Za-z]+$" CssClass="text-danger" />
                    </div>

                    <div class="form-group">
                        <label for="txtLastName">Last Name:</label>
                        <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Last Name is required" ControlToValidate="txtLastName" Display="Dynamic" CssClass="text-danger" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name can only be letters and no symbols" Display="Dynamic" ValidationExpression="^[A-Za-z]+$" CssClass="text-danger" />
                    </div>

                    <div class="text-center buttons">
                        <asp:Button ID="btnCancel" runat="server" Text="CancelLoginSE3" PostBackUrl="~/Default.aspx" CausesValidation="False" CssClass="btn btn-secondary cancen_btn" />
                        <asp:Button ID="btnLogin" runat="server" Text="Logon_929" OnClick="login_Click" CssClass="btn btn-primary" />
                    </div>
                </div>
    </div>


</asp:Content>

