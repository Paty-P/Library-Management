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
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                MultiViewInsertReaders.ActiveViewIndex = 0;
          
            MethodInsertDataIntoDDLGender();

        }
        protected void Page_Init(object sender, EventArgs e)
        {
            if (!IsPostBack)
                

            MethodInsertDataIntoDDLGender();

        }

        protected void ButtonStep2_Click(object sender, EventArgs e)
        {
            MultiViewInsertReaders.ActiveViewIndex = 1;
        }

        protected void ButtonBackToStep1_Click(object sender, EventArgs e)
        {
            MultiViewInsertReaders.ActiveViewIndex = 0;
        }

        protected void ButtonStep3_Click(object sender, EventArgs e)

        {
           
            MultiViewInsertReaders.ActiveViewIndex = 2;
        }

        protected void ButtonBackStep2_Click(object sender, EventArgs e)
        {
            MultiViewInsertReaders.ActiveViewIndex = 1;
        }

        protected void ButtonStep4_Click(object sender, EventArgs e)
        {
            MultiViewInsertReaders.ActiveViewIndex = 3;
            LabelSummaryCNP.Text = TextBoxCNP.Text;
            LabelSummaryFN.Text = TextBoxFirstName.Text;
            LabelSummaryLN.Text = TextBoxLastName.Text;
            LabelSummaryGender.Text =Convert.ToString( DropDownListGender.SelectedItem);
            LabelSummaryEmail.Text = TextBoxEmail.Text;
            LabelSummaryPhone.Text = TextBoxPhoneNumber.Text;
            LabelSummaryAdress.Text = LabelAdressID.Text;
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


        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
           
                try
                {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
                //creeaza obiectul sql command
                SqlCommand cmd = new SqlCommand("spInsertReadersAndAdress", con);
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
                cmd.Parameters.AddWithValue("@CNP", TextBoxCNP.Text);
                cmd.Parameters.AddWithValue("@adress_ID",LabelAdressID.Text);
                cmd.Parameters.AddWithValue("@first_name", TextBoxFirstName.Text);
                cmd.Parameters.AddWithValue("@last_name", TextBoxLastName.Text);
                cmd.Parameters.AddWithValue("@gender_id ", DropDownListGender.SelectedValue);
                cmd.Parameters.AddWithValue("@email ", TextBoxEmail.Text);
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
       protected  void MethodInsertDataIntoDDLGender()
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("Select gender_name, gender_id from tblGender", con);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                DropDownListGender.DataTextField = "gender_name";
                DropDownListGender.DataValueField = "gender_id";
                DropDownListGender.DataSource = rdr;
                DropDownListGender.DataBind();
                
                //DropDownListGender.SelectedIndex = DropDownListGender.Items.IndexOf(DropDownListGender.Items.FindByText("--Select--"));
                //DropDownListGender.Items.Insert(0, new ListItem("Selecteaza genul", "0"));
            }
        }

        protected void DropDownListGender_SelectedIndexChanged(object sender, EventArgs e)
        {
            MethodInsertDataIntoDDLGender();
        }

        //protected void DropDownListGender_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (DropDownListGender.SelectedIndex == 0)
        //    {
        //        DropDownListGender.Items.Clear();

        //    }
        //}
    }
    }
