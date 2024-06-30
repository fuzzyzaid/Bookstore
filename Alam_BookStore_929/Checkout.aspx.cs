//6929 Alam
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alam_BookStore_929
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void placeOrder_Click(object sender, EventArgs e)
        {
            
            if (IsValid)
            {
                Session.Remove("Cart");

                txtFirstName.Text = "";
                txtLastName.Text = "";
                txtEmail1.Text = "";
                txtEmail2.Text = "";
                txtPhone.Text = "";
                txtAddress.Text = "";
                txtCity.Text = "";
                txtState.Text = "";
                txtZipCode.Text = "";

                successMsg.InnerText = "Order Placed Successfully";
            }
        }

        protected void cancel_Click(object sender, EventArgs e)
        {
            Session.Remove("Cart");
            Response.Redirect("~/Products.aspx");
        }
    }
}