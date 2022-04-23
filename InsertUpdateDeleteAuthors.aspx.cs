using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagement
{
    public partial class WebForm20 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void LinkButton_Click(object sender, EventArgs e)
        {
            try
            {
                SqlDataSource1.InsertParameters["date_of_birth"].DefaultValue =
                    ((TextBox)GridViewInsertUpdateDeleteAuthors.FooterRow.FindControl("TextBoxDateOfBirth")).Text;
                SqlDataSource1.InsertParameters["first_name"].DefaultValue =
                    ((TextBox)GridViewInsertUpdateDeleteAuthors.FooterRow.FindControl("TextBoxFirstName")).Text;
                SqlDataSource1.InsertParameters["last_name"].DefaultValue =
                    ((TextBox)GridViewInsertUpdateDeleteAuthors.FooterRow.FindControl("TextBoxLastName")).Text;
                SqlDataSource1.Insert();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

    }
}