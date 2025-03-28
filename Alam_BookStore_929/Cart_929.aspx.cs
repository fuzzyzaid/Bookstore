﻿//6929 Alam
using Alam_BookStore_929.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alam_BookStore_929
{
    public partial class Cart_929 : System.Web.UI.Page
    {

        private CartItemList cart;

        protected void Page_Load(object sender, EventArgs e)
        {
            cart = CartItemList.GetCartOrCreateIt();
            if (!IsPostBack) this.DisplayCart();

        }

        private void DisplayCart()
        {
            lstCart.Items.Clear();

            for (int i = 0; i < cart.Count; i++)
            {
                lstCart.Items.Add(cart[i].Display());
            }
        }

        protected void removeItem_Click(object sender, EventArgs e)
        {
            if (cart.Count > 0)
            {
                if (lstCart.SelectedIndex > -1)
                {
                    cart.RemoveAt(lstCart.SelectedIndex);
                    this.DisplayCart();
                }
                else
                { 
                    lblMessage.Text =
                      "Please select the item to remove.";
                }
            }

        }


        protected void emptyCart_Click(object sender, EventArgs e)
        {
            if (cart.Count > 0)
            {
                cart.Clear();
                lstCart.Items.Clear();
            }

        }
    }
}