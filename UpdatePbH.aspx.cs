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
    public partial class WebForm18 : System.Web.UI.Page
    {
        public static string publishing_house_id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }
       
        public void searchPH()
        {
            try
            {

                //string script = "select book_id, title, publishing_house_id, language from tblBook where title like '" + txtSearch.Text + "'";
                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("[spSelectPubliserAndAdress]", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@name", TextBoxSearch.Text);
                    con.Open();
                    GridView1.DataSource = cmd.ExecuteReader();
                    GridView1.DataBind();
                    con.Close();
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        publishing_house_id = reader["publishing_house_id"].ToString();
                    }
                }
                //Response.Write(book_id);
            }

            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }
        }
        ////public void MethodDeletePHFromTable()
        ////{
        ////    string ConnectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        ////    using (SqlConnection connection = new SqlConnection("data source=.; database=DBLibrary; integrated security=SSPI"))
        ////    {
        ////        SqlCommand cmd = new SqlCommand("spDeletePublishingHouseAndAdress", connection);
        ////        cmd.CommandType = System.Data.CommandType.StoredProcedure;
        ////        //adauga parametrii de input obiectului sql command

        ////        cmd.Parameters.AddWithValue("ph_id", HiddenFieldPH_Id.Value);
        ////        //cmd.Parameters.AddWithValue("@adress_id", HiddenFieldAdressId.Value);
        ////        connection.Open();
        ////        cmd.ExecuteNonQuery();
        ////        string message = "Are you sure to delete?";
        ////        string script = "window.onload = function(){ confirm('";
        ////        script += message;
        ////        script += "')};";
        ////        ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
        ////    }
        ////}
        ////public void btnDelete_Click(object sender, EventArgs e)
        ////{
        ////    MethodDeletePHFromTable();
        ////}
       
        public void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow row in GridView1.Rows)
                {
                    HiddenFieldAdressId.Value = row.Cells[1].Text;                   
                    TextBoxPHName.Text = row.Cells[2].Text;                   
                    TextBoxPhoneNumber.Text = row.Cells[3].Text;
                    HiddenFieldPH_Id.Value = row.Cells[4].Text;
                    TextBoxCountry.Text = row.Cells[5].Text;
                    TextBoxRegion.Text = row.Cells[6].Text;
                    TextBoxCity.Text = row.Cells[7].Text;
                    TextBoxStreetName.Text = row.Cells[8].Text;
                    TextBoxStreetnumber.Text = row.Cells[9].Text;
                    TextBoxBlock.Text = row.Cells[10].Text;
                    TextBoxApartment.Text = row.Cells[11].Text;
                    TextBoxFloor.Text = row.Cells[12].Text;
                    TextBoxPostalCode.Text = row.Cells[13].Text;
                }
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }
        }
           
        public void savePHAndAdressModify()
        {
            try
            {
                //string script = "update tblBook set publishing_house_id="+ddlPublisher.SelectedValue.ToString()+", [language]="+ddlLanguage.SelectedValue.ToString()+" where book_id =" + book_id;
                //string script = "update tblBook set publishing_house_id = 3 where book_id = 3";

                string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(CS))
                {
                    SqlCommand cmd = new SqlCommand("spUpdatePublishingHouseAndAdress", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    //adauga parametrii de input obiectului sql command

                    cmd.Parameters.AddWithValue("ph_id",HiddenFieldPH_Id.Value);                   
                    cmd.Parameters.AddWithValue("@adress_id", HiddenFieldAdressId.Value);
                    cmd.Parameters.AddWithValue("@name", TextBoxPHName.Text);                                        
                    cmd.Parameters.AddWithValue("@phone_number", TextBoxPhoneNumber.Text);
                    cmd.Parameters.AddWithValue("@country", TextBoxCountry.Text);
                    cmd.Parameters.AddWithValue("@region", TextBoxRegion.Text);
                    cmd.Parameters.AddWithValue("@city", TextBoxCity.Text);
                    cmd.Parameters.AddWithValue("@street", TextBoxStreetName.Text);
                    cmd.Parameters.AddWithValue("@street_number", TextBoxStreetnumber.Text);
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

        

        protected void Buttonsearch_Click(object sender, EventArgs e)
        {
            searchPH();
            int i = GridView1.Rows.Count;

            if (i == 0)

            {
                TextBoxPHName.Text = "";
                TextBoxPhoneNumber.Text= "";
                TextBoxCountry.Text = "";
                TextBoxRegion.Text = "";
                TextBoxCity.Text = "";
                TextBoxStreetName.Text = "";
                TextBoxStreetnumber.Text = "";
                TextBoxBlock.Text = "";
                TextBoxApartment.Text = "";
                TextBoxFloor.Text = "";
                TextBoxPostalCode.Text = "";

            }

            //else

            //{

            //}
        }

         protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            e.Row.Cells[1].Visible = false;
            e.Row.Cells[4].Visible = false;
            e.Row.Cells[8].Visible = false;
            e.Row.Cells[9].Visible = false;
            e.Row.Cells[10].Visible = false;
            e.Row.Cells[11].Visible = false;
            e.Row.Cells[12].Visible = false;
            e.Row.Cells[13].Visible = false;
        }

        protected void ButtonSave_Click1(object sender, EventArgs e)
        {
            try
            {
                savePHAndAdressModify();
                searchPH();
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }
        }
    }
}