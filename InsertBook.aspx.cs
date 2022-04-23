using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace LibraryManagement
{
    public partial class WebForm4 : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            if (!IsPostBack)
            {
                //CalendarPublisheddate.Visible = false;
                //CalendarRegistrationDate.Visible = false;

            }
            
        }

        protected void ButtonSubmitClick(object sender, EventArgs e)
        {
            try
            {
                //creeaza obiectul sql command
                SqlCommand cmd = new SqlCommand("[spInsertBookAndInventory]", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                //adauga parametrii de input obiectului sql command
                cmd.Parameters.AddWithValue("@author_id ", ddlAuthorName.SelectedValue);
                cmd.Parameters.AddWithValue("@publishing_house_id ", ddlPublishingHouse.SelectedValue);
                cmd.Parameters.AddWithValue("@title ", TextBoxTitle.Text);
                cmd.Parameters.AddWithValue("@number_copies ", TextBoxNrCopies.Text);
                cmd.Parameters.AddWithValue("@published_date ",Convert.ToDateTime(TextBoxPublishedDate.Text));
                cmd.Parameters.AddWithValue("@domain_id ", ddlDomain.SelectedValue);
                cmd.Parameters.AddWithValue("@language  ", ddlLanguage.SelectedValue);
                cmd.Parameters.AddWithValue("@registration_date ", Convert.ToDateTime(TextBoxRegistrationDate.Text));
                cmd.Parameters.AddWithValue("@price ", TextBoxPrice.Text);
                cmd.Parameters.AddWithValue("@book_id ",HiddenFieldBook_Id.Value);

                cmd.ExecuteNonQuery();
                con.Close();
                if (Page.IsValid)
                {
                    Label1.Visible = true;
                    Label1.Text = "You have succesfully inserted the dates!";
                }
                else
                {
                    Label1.ForeColor = System.Drawing.Color.Red;
                    Label1.Text = "Validation Failed! data not saved";
                }
                
            }
            catch(Exception ex)
            {

                Response.Write(ex.Message);
            }
        }

        //protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        //{
        //    if (CalendarRegistrationDate.Visible)
        //    {
        //        CalendarRegistrationDate.Visible = false;
        //    }
        //    else
        //    {
        //        CalendarRegistrationDate.Visible = true;
        //    }
        //}
        //protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        //{
        //    if (CalendarPublisheddate.Visible)
        //    {
        //        CalendarPublisheddate.Visible = false;
        //    }
        //    else
        //    {
        //        CalendarPublisheddate.Visible = true;
        //    }
        //}

        //protected void CalendarPublisheddate_SelectionChanged(object sender, EventArgs e)
        //{
        //    TextBoxPublishedDate.Text = CalendarPublisheddate.SelectedDate.ToString("yyyy-MM-dd");
        //    CalendarPublisheddate.Visible = false;
        //}

        //protected void CalendarRegistrationDate_SelectionChanged(object sender, EventArgs e)
        //{
        //    TextBoxRegistrationDate.Text = CalendarRegistrationDate.SelectedDate.ToString("yyyy-MM-dd"); ;
        //    CalendarRegistrationDate.Visible = false;
        //}

        //protected void CalendarRegistrationDate_DayRender(object sender, DayRenderEventArgs e)
        //{
        //    if(e.Day.IsOtherMonth)
        //    {
        //        e.Day.IsSelectable = false;
        //        e.Cell.BackColor = System.Drawing.Color.BlueViolet;
        //    }
        //}

        //protected void CalendarPublisheddate_DayRender(object sender, DayRenderEventArgs e)
        //{
        //    if (e.Day.IsOtherMonth)
        //    {
        //        e.Day.IsSelectable = false;
        //        e.Cell.BackColor = System.Drawing.Color.BlueViolet;
        //    }
        //}
    }
}
