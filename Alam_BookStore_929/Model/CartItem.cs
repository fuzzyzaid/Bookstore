using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;

namespace Alam_BookStore_929.Model
{
    public class CartItem
    {
        public CartItem() { }

        public CartItem(Book book, int quantity)
        {
            this.Book = book;
            this.Quantity = quantity;
        }

        public Book Book { get; set; }
        public int Quantity { get; set; }

        public void AddQuantity(int quantity)
        {
            this.Quantity += quantity;
        }

        public string Display()
        {
            string displayString = string.Format("{0} ({1} at {2})",
                Book.BookName,
                Quantity.ToString(),
                Book.price.ToString("c", CultureInfo.GetCultureInfo("en-US"))
            ); ;
            return displayString;
        }
    }
}