//6929 Alam
using Alam_BookStore_929.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alam_BookStore_929
{
    public partial class Products : System.Web.UI.Page
    {
        private Book selectedBook;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                booksDropDown.DataBind();
                if (Session["User_FirstName"] != null)
                {
                    string firstName = Session["User_FirstName"].ToString();
                    welcomeUserMsg.InnerText = "Welcome Home, " + firstName;
                }
            }

            selectedBook = this.GetSelectedBook();

            bookName.Text = selectedBook.BookName;
            bookAuthor.Text = selectedBook.AuthorName;
            bookDescription.Text = selectedBook.Description;
            bookImage.ImageUrl = selectedBook.image;
            bookPrice.Text = selectedBook.price.ToString("c", CultureInfo.GetCultureInfo("en-US")) + " each";
        }


        protected Book GetSelectedBook()
        {
            DataView bookssTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            bookssTable.RowFilter ="Id = '" + booksDropDown.SelectedValue + "'";
            DataRowView row = bookssTable[0];
            Book b = new Book();
            b.Id = row["Id"].ToString();
            b.BookName = row["BookName"].ToString();

            b.AuthorName = row["AuthorName"].ToString();

            b.Description = row["Description"].ToString();

            b.GenreId = (int)row["GenreId"];

            b.image = "~/Images/Products/" + row["image"].ToString();

            b.price = (decimal)row["price"];

            return b;
            //--------------------------------------------------------- 
        }

        protected void addToCart_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                CartItemList cart = CartItemList.GetCartOrCreateIt(); //CartItemList.GetCart();
                CartItem cartItem = cart[selectedBook.Id];
                if (cartItem == null)
                {
                    cart.AddItem(selectedBook,
                                 Convert.ToInt32(txtQuantity.Text));
                }
                else
                {
                    cartItem.AddQuantity(
                        Convert.ToInt32(txtQuantity.Text));
                }
                Response.Redirect("~/Cart_929.aspx");
            }
        }
    }
}