//6929 Alam
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Alam_BookStore_929
{
    public partial class The_Admin_Sec3_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_PreRender(object sender, EventArgs e)
        {
            if (GridView1.HeaderRow != null)
            {
                GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void FormViewGenre_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            if (e.Exception == null && e.AffectedRows > 0)
            {
                FormViewGenre.ChangeMode(FormViewMode.Edit); 
            }
            else
            {
                e.KeepInInsertMode = true;
                e.ExceptionHandled = true;
            }
        }

        protected void FormViewGenre_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
           
            TextBox txtId = (TextBox)FormViewGenre.FindControl("Id");
            TextBox txtName = (TextBox)FormViewGenre.FindControl("Name");
            TextBox txtDescription = (TextBox)FormViewGenre.FindControl("Description");
            TextBox txtPopularity = (TextBox)FormViewGenre.FindControl("Popularity");

           
            Label lblIdError = (Label)FormViewGenre.FindControl("lblIdError");
            Label lblNameError = (Label)FormViewGenre.FindControl("lblNameError");
            Label lblDescriptionError = (Label)FormViewGenre.FindControl("lblDescriptionError");
            Label lblPopularityError = (Label)FormViewGenre.FindControl("lblPopularityError");

           
            lblIdError.Text = "";
            lblNameError.Text = "";
            lblDescriptionError.Text = "";
            lblPopularityError.Text = "";

           
            if (string.IsNullOrEmpty(txtId.Text.Trim()))
            {
                lblIdError.Text = "Genre Id is required.";
                e.Cancel = true; 
            }

            if (string.IsNullOrEmpty(txtName.Text.Trim()))
            {
                lblNameError.Text = "Genre Name is required.";
                e.Cancel = true; 
            }

            if (string.IsNullOrEmpty(txtDescription.Text.Trim()))
            {
                lblDescriptionError.Text = "Genre Description is required.";
                e.Cancel = true; 
            }

            if (string.IsNullOrEmpty(txtPopularity.Text.Trim()))
            {
                lblPopularityError.Text = "Genre Popularity is required.";
                e.Cancel = true;
            }

        }

        protected void genreDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception == null)
            {

                genreDeleteMessage.Text = "Genre deleted successfully - 8866929!";
                genreDeleteMessage.Visible = true; 
            }
            else
            {

                genreDeleteMessage.Text = "Error deleting the row. Please try again. -8866929";
                genreDeleteMessage.Visible = true; 
            }
        }
    }
}