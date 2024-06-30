<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site_6929.Master" CodeBehind="The_Admin_Sec3_Page.aspx.cs" Inherits="Alam_BookStore_929.The_Admin_Sec3_Page" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="mainPlaceholder" runat="server">

      <div id="adminPage" class="container">
            <h2 class="text-center">Admin Page</h2>
            <div class="form-group" >
                <div id="genre">
                    <asp:Label CssClass="col-xs-2 col-sm-2 col-lg-2" Text="Select a genre: " runat="server" ></asp:Label>
                 <div class="col-xs-6 col-sm-6 col-lg-6">
                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:Alam_BookStore_929ConnectionString %>" 
                           SelectCommand="SELECT [Name], [Id], [Description] FROM [TheGenre_929] ORDER BY [Name]"></asp:SqlDataSource>
                       <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Id"></asp:DropDownList>
                 </div>
               
                </div>
             </div>    
      </div>

     <div class="form-group">
                <div class="col-xs-12 col-sm-12 col-lg-12">
                   <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:Alam_BookStore_929ConnectionString %>" 
                        SelectCommand="SELECT [Id], [BookName], [AuthorName], [Description], [GenreId], [price],[quantity] FROM [Books]  WHERE ([GenreId] = @Id) ORDER BY [BookName]">                        
                         <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="Id" PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                   </asp:SqlDataSource>
                    <asp:DataList ID="DataList1" 
    CssClass="table table-bordered table-striped table-condensed"
    runat="server" DataKeyField="Id" DataSourceID="SqlDataSource2" CellPadding="2" ForeColor="#333333">
    <AlternatingItemStyle BackColor="White" />
    <FooterStyle BackColor="#808080" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#808080" Font-Bold="True" ForeColor="White" />
    <HeaderTemplate>
        <div class="col-xs-2 col-sm-3 col-lg-2">ID</div> 
        <div class="col-xs-2 col-sm-3 col-lg-3">Book929</div> 
        <div class="col-xs-2 col-sm-3 col-lg-2">AuthorName</div>
        <div class="col-xs-3 col-sm-3 col-lg-3">Description</div>
        <div class="col-xs-1 col-sm-2 col-lg-1" style="white-space: nowrap;">Price</div> 
        <div class="col-xs-1 col-sm-2 col-lg-1" style="white-space: nowrap;">On Hand</div>
    </HeaderTemplate>
    <ItemStyle BackColor="#F0FFFF" ForeColor="#333333" />
    <ItemTemplate>
        <div class="col-xs-2 col-sm-3 col-lg-2">
            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
        </div>
        <div class="col-xs-2 col-sm-3 col-lg-3">
            <asp:Label ID="BookNameLabel" runat="server" Text='<%# Eval("BookName") %>' />
        </div>
        <div class="col-xs-2 col-sm-3 col-lg-2">
            <asp:Label ID="AuthorNameLabel" runat="server" Text='<%# Eval("AuthorName") %>' />
        </div>
        <div class="col-xs-3 col-sm-3 col-lg-3">
            <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
        </div>
        <div class="col-xs-1 col-sm-2 col-lg-1" style="white-space: nowrap;">
            <asp:Label ID="priceLabel" runat="server" Text='<%# String.Format("{0:F2}", Eval("price")) %>' />
        </div> 
        <div class="col-xs-1 col-sm-2 col-lg-1" style="white-space: nowrap;">
            <asp:Label ID="quantityLabel" runat="server" Text='<%# Eval("quantity") %>'/>
        </div> 
    </ItemTemplate>
    <SelectedItemStyle BackColor="#F0FFFF" Font-Bold="True" ForeColor="#DAF7A6" />
</asp:DataList>

                </div>
            </div>


      <div class="form-group">
           <asp:Label CssClass="col-xs-2 col-sm-2 col-lg-2" Text="Maintenance of Genre: " runat="server" ></asp:Label>
               <div class="col-xs-12">
                   <asp:SqlDataSource ID="SqlDataSource_929" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:Alam_BookStore_929ConnectionString %>" 
                       SelectCommand="SELECT [Name], [Id], [Description],[Popularity] FROM [TheGenre_929] ORDER BY [Name]" 
                       DeleteCommand="DELETE FROM [TheGenre_929] WHERE [Id] = @Id" 
                       InsertCommand="INSERT INTO [TheGenre_929] ([Id], [Name], [Description],[Popularity]) VALUES (@Id, @Name, @Description,@Popularity)" 
                       UpdateCommand="UPDATE [TheGenre_929] SET [Name] = @Name, [Description] = @Description, [Popularity] = @Popularity WHERE [Id] = @Id">
                       <DeleteParameters>
                           <asp:Parameter Name="Id" Type="String" />
                       </DeleteParameters>
                       <InsertParameters>
                           <asp:Parameter Name="Id" Type="String" />
                           <asp:Parameter Name="Name" Type="String" />
                           <asp:Parameter Name="Desciption" Type="String" />
                           <asp:Parameter Name="Popularity" Type="String" />
                       </InsertParameters>
                       <UpdateParameters>
                           <asp:Parameter Name="Name" Type="String" />
                           <asp:Parameter Name="Description" Type="String" />
                           <asp:Parameter Name="Popularity" Type="String" />
                           <asp:Parameter Name="Id" Type="String" />
                       </UpdateParameters>
                   </asp:SqlDataSource>
                   <asp:GridView 
                       ID="GridView1" runat="server" 
                       CssClass="table table-bordered table-striped table-condensed"
                       AllowPaging="True" AllowSorting="True" 
                       AutoGenerateColumns="False" 
                       OnRowDeleted="genreDeleted"
                       DataKeyNames="Id" DataSourceID="SqlDataSource_929" CellPadding="4" ForeColor="#F0FFFF" GridLines="None" OnPreRender="GridView1_PreRender" PageSize="5">
                       <AlternatingRowStyle BackColor="White" />
                       <Columns>
                           <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" >
                                <ItemStyle CssClass="col-xs-2" />
                           </asp:BoundField>
                           <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" >
                               <ItemStyle CssClass="col-xs-4" />
                           </asp:BoundField>
                           <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" >
                               <ItemStyle CssClass="col-xs-6" />
                           </asp:BoundField>
                           <asp:BoundField DataField="Popularity" HeaderText="Popularity" SortExpression="Popularity" >
                               <ItemStyle CssClass="col-xs-6" />
                           </asp:BoundField>
                           <asp:CommandField ShowSelectButton="True" SelectText="Select"/>
                           <asp:CommandField ShowEditButton="True" EditText="Edit"  CancelText="Cancel29" />
                           <asp:CommandField ShowDeleteButton="True" DeleteText="Delete"  />
                       </Columns>
                       <FooterStyle BackColor="#808080" Font-Bold="True" ForeColor="White" />
                       <HeaderStyle BackColor="#808080" Font-Bold="True" ForeColor="White" />
                       <PagerSettings FirstPageText="First " LastPageText=" Last" Mode="NextPreviousFirstLast" NextPageText=" Next " PreviousPageText=" Previous " />
                       <PagerStyle CssClass="space" BackColor="#808080" ForeColor="White" HorizontalAlign="Center" />
                       <RowStyle BackColor="#F0FFFF" ForeColor="#333333" />
                       <SelectedRowStyle BackColor="#36454F" Font-Bold="True" ForeColor="Navy" />
                       <SortedAscendingCellStyle BackColor="#6082B6" />
                       <SortedAscendingHeaderStyle BackColor="#36454F" />
                       <SortedDescendingCellStyle BackColor="#4682B4" />
                       <SortedDescendingHeaderStyle BackColor="#40B5AD" />
                   </asp:GridView>
                   <asp:Label ID="genreDeleteMessage" runat="server" Text="" CssClass="text-danger"></asp:Label>
               </div>
            </div>
       
      
       <asp:FormView ID="FormViewGenre" runat="server" DefaultMode="Insert" OnItemInserted="FormViewGenre_ItemInserted" OnItemInserting="FormViewGenre_ItemInserting" DataSourceID="SqlDataSource4">
         <InsertItemTemplate>
             <div class="row">
                <div class="col-md-12">
                    <h4>To create a new genre</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Id" Text="Genre Id:"></asp:Label>
                        <asp:TextBox ID="Id" runat="server" Text='<%# Bind("Id") %>' CssClass="form-control"></asp:TextBox>
                         <asp:Label ID="lblIdError" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Name" Text="Genre Name:"></asp:Label>
                        <asp:TextBox ID="Name" runat="server" Text='<%# Bind("Name") %>' CssClass="form-control"></asp:TextBox>
                        <asp:Label ID="lblNameError" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                </div>
        
                <div class="col-md-8">
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Description" Text="Genre Description:"></asp:Label>
                        <asp:TextBox ID="Description" runat="server" Text='<%# Bind("Description") %>' CssClass="form-control"></asp:TextBox>
                         <asp:Label ID="lblDescriptionError" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Popularity" Text="Genre Popularity:"></asp:Label>
                        <asp:TextBox ID="Popularity" runat="server" Text='<%# Bind("Popularity") %>' CssClass="form-control"></asp:TextBox>
                         <asp:Label ID="lblPopularityError" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <asp:Button ID="btnAddGenre" runat="server" Text="Add A Genre" CommandName="Insert" UseSubmitBehavior="false" CssClass="btn btn-dark" />
                </div>
            </div>
       </InsertItemTemplate>
   </asp:FormView>

   <asp:SqlDataSource ID="SqlDataSource4" runat="server"
            ConnectionString="<%$ ConnectionStrings:Alam_BookStore_929ConnectionString %>"
            InsertCommand="INSERT INTO [TheGenre_929] ([Id], [Name], [Description],[Popularity]) VALUES (@Id,@Name, @Description, @Popularity)">
            <InsertParameters>
                <asp:Parameter Name="Id" Type="String" />
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Popularity" Type="String" />
            </InsertParameters>
  </asp:SqlDataSource>




    <div class="row">
           <div class="col-md-12">
                   <h4>Books Table</h4>
            </div>
    </div>
    <asp:GridView CssClass="table table-bordered table-striped col-md-4" ID="GridViewBook" runat="server" 
        AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource5" AllowSorting="True" PageSize="5">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="BookName" HeaderText="BookName" SortExpression="BookName" />
                    <asp:BoundField DataField="AuthorName" HeaderText="AuthorName" SortExpression="AuthorName" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="GenreId" HeaderText="GenreId" SortExpression="GenreId" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
                <FooterStyle BackColor="#808080" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#808080" Font-Bold="True" ForeColor="White" />
                <PagerStyle CssClass="space" BackColor="#808080" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F0FFFF" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#36454F" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#6082B6" />
                <SortedAscendingHeaderStyle BackColor="#36454F" />
                <SortedDescendingCellStyle BackColor="#4682B4" />
                <SortedDescendingHeaderStyle BackColor="#40B5AD" />

            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Alam_BookStore_929ConnectionString %>" 
                SelectCommand="SELECT [Id], [BookName], [AuthorName],[Description],[GenreId] FROM [Books]"></asp:SqlDataSource>
       
        <div class="margin5">
            <asp:DetailsView CssClass="col-md-4" ID="DetailsView1" runat="server" Height="50px" AutoGenerateRows="False" CellPadding="4" DataKeyNames="Id" DataSourceID="SqlDataSource6" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#a9def9" Font-Bold="True" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="BookName" HeaderText="BookName" SortExpression="BookName" />
                    <asp:BoundField DataField="AuthorName" HeaderText="AuthorName" SortExpression="AuthorName" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="GenreId" HeaderText="GenreId" SortExpression="GenreId" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#808080" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#808080" Font-Bold="True" ForeColor="White" />
                <PagerStyle CssClass="space" BackColor="#808080" ForeColor="White" HorizontalAlign="Center"/>
                <RowStyle BackColor="#F0FFFF" ForeColor="#333333" />
            </asp:DetailsView>
        </div>

        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Alam_BookStore_929ConnectionString %>" 
            DeleteCommand="DELETE FROM [Books] WHERE [Id] = @Id" 
            InsertCommand="INSERT INTO [Books] ([Id], [BookName], [AuthorName], [Description], [GenreId], [price]) values (@Id, @BookName, @AuthorName, @Description, @GenreId, @price)" 
            SelectCommand="SELECT [Id], [BookName], [AuthorName], [Description], [GenreId], [price] FROM [Books] WHERE [Id] = @Id" 
            UpdateCommand="UPDATE [Books] SET [BookName]=@BookName, [AuthorName] = @AuthorName, [Description] = @Description, [GenreId] = @GenreId, [price] = @price WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Id" />
                <asp:Parameter Name="BookName" />
                <asp:Parameter Name="AuthorName" />
                <asp:Parameter Name="Description" />
                <asp:Parameter Name="GenreId" />
                <asp:Parameter Name="price" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridViewBook" Name="Id" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="BookName" />
                <asp:Parameter Name="AuthorName" />
                <asp:Parameter Name="Description" />
                <asp:Parameter Name="GenreId" />
                <asp:Parameter Name="price" />
                
            </UpdateParameters>
        </asp:SqlDataSource>

 </asp:Content>
