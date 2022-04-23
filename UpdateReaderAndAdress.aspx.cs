using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryManagement
{
    public partial class WebForm21 : System.Web.UI.Page
    {
        public static string reader_id = "";
        protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                   
                }
            }

            public void btnSearch_Click(object sender, EventArgs e)
            {
                searchReader();

            int i = GridView1.Rows.Count;

            if (i == 0)

            {
               
                TextBoxBlock.Text = "";
                TextBoxCity.Text = "";
                TextBoxFloor.Text = "";
                TextBoxPostalCode.Text = "";
                TextBoxStreetName.Text = "";
                TextStreetNumber.Text = "";
                ddlGender.SelectedValue = "";
                TextBoxApartment.Text = "";
                txtEmail.Text = "";
                txtCNP.Text = "";
                txtFN.Text = "";
                txtLN.Text = "";
                txtPhone.Text = "";
                txtRegion.Text = "";
                txtCountry.Text = "";

            }

        }
        public void searchReader()
        {
            try
            {

                //string script = "select book_id, title, publishing_house_id, language from tblBook where title like '" + txtSearch.Text + "'";
                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("[spSelectReaderAndAdressDetails]", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@CNP", txtSearch.Text);
                    con.Open();
                    GridView1.DataSource = cmd.ExecuteReader();
                    GridView1.DataBind();
                    con.Close();
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        reader_id = reader["reader_id"].ToString();
                    }
                }
                //Response.Write(book_id);
            }

            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }
        }
            public void btnUpdate_Click(object sender, EventArgs e)
            {
            try
            {
                foreach (GridViewRow row in GridView1.Rows)
                {
                    HiddenFieldReaderId.Value = row.Cells[1].Text;
                    HiddenFieldAdressId.Value = row.Cells[2].Text;
                    txtCNP.Text = row.Cells[3].Text;
                    txtFN.Text = row.Cells[4].Text;
                    txtLN.Text = row.Cells[5].Text;
                    listGender();
                    ddlGender.Items.FindByText(row.Cells[6].Text).Selected = true;
                    txtEmail.Text = row.Cells[7].Text;
                    txtPhone.Text = row.Cells[8].Text;
                    txtCountry.Text = row.Cells[9].Text;
                    txtRegion.Text = row.Cells[10].Text;
                    TextBoxCity.Text = row.Cells[11].Text;
                    TextBoxStreetName.Text = row.Cells[12].Text;
                    TextStreetNumber.Text = row.Cells[13].Text;
                    TextBoxBlock.Text = row.Cells[14].Text;
                    TextBoxApartment.Text = row.Cells[15].Text;
                    TextBoxFloor.Text = row.Cells[16].Text;
                    TextBoxPostalCode.Text = row.Cells[17].Text;
                }
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }
        }


        ////////ddlPublisher.Visible = true;
        ////////ddlLanguage.Visible = true;
    
           
            public void listGender()
        {
            try { 
                string script = "select gender_id, gender_name from tblGender";
                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand(script, con);
                    con.Open();
                    ddlGender.DataSource = cmd.ExecuteReader();
                    ddlGender.DataTextField = "gender_name";
                    ddlGender.DataValueField = "gender_id";

                    ddlGender.DataBind();

                }
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }
        }



        public void saveReaderModify()
            {try { 
                //string script = "update tblBook set publishing_house_id="+ddlPublisher.SelectedValue.ToString()+", [language]="+ddlLanguage.SelectedValue.ToString()+" where book_id =" + book_id;
                //string script = "update tblBook set publishing_house_id = 3 where book_id = 3";
                
                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                SqlCommand cmd = new SqlCommand("spUpdateReaderAndAdress", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                //adauga parametrii de input obiectului sql command
                
                cmd.Parameters.AddWithValue("@CNP", txtCNP.Text);
                cmd.Parameters.AddWithValue("@reader_id", HiddenFieldReaderId.Value);
                cmd.Parameters.AddWithValue("@adress_id", HiddenFieldAdressId.Value);
                cmd.Parameters.AddWithValue("@first_name", txtFN.Text); 
                cmd.Parameters.AddWithValue("@last_name",  txtLN.Text);
                //cmd.Parameters.AddWithValue("@gender_id", ddlGender.SelectedValue);
                cmd.Parameters.Add("@gender_id", SqlDbType.Int).Value = ddlGender.SelectedValue;
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@phone_number", txtPhone.Text);
                cmd.Parameters.AddWithValue("@country", txtCountry.Text);
                cmd.Parameters.AddWithValue("@region", txtRegion.Text);
                cmd.Parameters.AddWithValue("@city", TextBoxCity.Text);
                cmd.Parameters.AddWithValue("@street", TextBoxStreetName.Text);
                cmd.Parameters.AddWithValue("@street_number", TextStreetNumber.Text);
                cmd.Parameters.AddWithValue("@block", TextBoxBlock.Text);
                cmd.Parameters.AddWithValue("@apartment", TextBoxApartment.Text);
                cmd.Parameters.AddWithValue("@floor", TextBoxFloor.Text);
                cmd.Parameters.AddWithValue("@postal_code", TextBoxPostalCode.Text);               
                con.Open();             
                cmd.ExecuteNonQuery();
                    con.Close();
                }


                //update tblBook set publishing_house_id = 2 where book_id = 3
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }
        }

       

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            saveReaderModify();
            searchReader();
        }

        protected void GridView1_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
            e.Row.Cells[2].Visible = false;
            e.Row.Cells[11].Visible = false;
            e.Row.Cells[12].Visible = false;
            e.Row.Cells[13].Visible = false;
            e.Row.Cells[14].Visible = false;
            e.Row.Cells[15].Visible = false;
        }
    }
    }
