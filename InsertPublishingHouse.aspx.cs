using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagement
{
    public partial class WebForm17 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                MultiViewInsertPublishingHouseAndAdress.ActiveViewIndex = 0;
        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            try
            {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
                //creeaza obiectul sql command
                SqlCommand cmd = new SqlCommand("spInsertPublishingHouseAndAdress", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                //adauga parametrii de input obiectului sql command

                cmd.Parameters.AddWithValue("@country  ", TextBoxCountry.Text);
                cmd.Parameters.AddWithValue("@region  ", TextBoxRegion.Text);
                cmd.Parameters.AddWithValue("@city  ", TextBoxCity.Text);
                cmd.Parameters.AddWithValue("@street  ", TextBoxStreetName.Text);
                cmd.Parameters.AddWithValue("@street_number  ", TextBoxStreetNumber.Text);
                cmd.Parameters.AddWithValue("@block  ", TextBoxBlock.Text);
                cmd.Parameters.AddWithValue("@apartment  ", TextBoxApartmentNumber.Text);
                cmd.Parameters.AddWithValue("@floor  ", TextBoxFloor.Text);
                cmd.Parameters.AddWithValue("@postal_code  ", TextBoxPostalCode.Text);
                cmd.Parameters.AddWithValue("@adress_ID", LabelAdressID.Text);
                cmd.Parameters.AddWithValue("@name", TextBoxName.Text);
                cmd.Parameters.AddWithValue("@phone_number  ", TextBoxPhoneNumber.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                if (Page.IsValid)
                {
                    LabelDataState.Visible = true;
                    LabelDataState.ForeColor = System.Drawing.Color.Green;
                    LabelDataState.Text = "You have succesfully inserted the dates!";
                }
                else
                {
                    LabelDataState.ForeColor = System.Drawing.Color.Red;
                    LabelDataState.Text = "Validation Failed! data not saved";
                }

            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }


        }

        protected void ButtonStep2_Click(object sender, EventArgs e)
        {
            MultiViewInsertPublishingHouseAndAdress.ActiveViewIndex = 1;
        }

        protected void ButtonBackToStep1_Click(object sender, EventArgs e)
        {
            MultiViewInsertPublishingHouseAndAdress.ActiveViewIndex = 0;
        }

        protected void ButtonStep3_Click(object sender, EventArgs e)
        {
            MultiViewInsertPublishingHouseAndAdress.ActiveViewIndex = 2;

            LabelSummaryAdressID0.Text = LabelAdressID.Text;
            LabelSummaryName.Text = TextBoxName.Text;
            LabelSummaryPhone.Text = TextBoxPhoneNumber.Text;
            LabelSummaryCountry.Text = TextBoxCountry.Text;
            LabelSummaryRegion.Text = TextBoxRegion.Text;
            LabelCitySummary.Text = TextBoxCity.Text;
            LabelSummaryStreetName.Text = TextBoxStreetName.Text;
            LabelSummaryStreetNumber.Text = TextBoxStreetNumber.Text;
            LabelSummaryBlock.Text = TextBoxBlock.Text;
            LabelSummaryApartment.Text = TextBoxApartmentNumber.Text;
            LabelSummaryFloor.Text = TextBoxFloor.Text;
            LabelSummaryPostalCode.Text = TextBoxPostalCode.Text;

        }

        protected void ButtonBackStep2_Click(object sender, EventArgs e)
        {
            MultiViewInsertPublishingHouseAndAdress.ActiveViewIndex = 1;
        }
    }
    }
