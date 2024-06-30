//6929 Alam
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alam_BookStore_929
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string firstName = txtFirstName.Text;
                Session["User_FirstName"] = firstName;
                Response.Redirect("~/Products.aspx");
            }
              
        }
    }
}