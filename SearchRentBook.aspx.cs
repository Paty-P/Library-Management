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
    public partial class WebForm14 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Panel1.Visible = false;
                Panel2.Visible = false;
               
            }
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
                {
                    //creeaza obiectul sql command
                    SqlCommand cmd = new SqlCommand("[spRetrieveReaderRentBooks]", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    //adauga parametrii de input obiectului sql command

                    cmd.Parameters.AddWithValue("@CNP  ", TextBoxCNP.Text);

                    con.Open();

                    DataSet dset = new DataSet();
                    new SqlDataAdapter(cmd).Fill(dset);
                    this.GridViewRentBookAfterCNP.DataSource = dset.Tables[0];
                    GridViewRentBookAfterCNP.DataBind();
                    con.Close();
                    //cmd.ExecuteReader();
                    //GridViewRentBook.DataSource = cmd.ExecuteReader();
                    //GridViewRentBook.DataBind();
                    //con.Close();
                    if (TextBoxCNP.Text != "" & (RadioButtonReaderRentBookCNP.Checked == true))
                    {
                        GridViewRentBookAfterCNP.Visible = true;
                        TextBoxCNP.Text.TrimStart();

                        //TextBoxFirstName.Text = TextBoxFirstName.Text.Replace(" ", "");
                        //TextBoxLastName.Text = TextBoxLastName.Text.Replace(" ", "");
                    }
                }


            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }
            // GridViewRentBooksAfterTitle.Visible = false;

        }

        protected void ButtonSearchTitle_Click(object sender, EventArgs e)
        {

            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString))
                {
                    //creeaza obiectul sql command
                    SqlCommand cmd = new SqlCommand("[spSearchByTitleAndStatusBook]", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    //adauga parametrii de input obiectului sql command

                    cmd.Parameters.AddWithValue("@title  ", TextBoxTitle.Text);

                    con.Open();

                    DataSet dset = new DataSet();
                    new SqlDataAdapter(cmd).Fill(dset);
                    this.GridViewRentBooksAfterTitle.DataSource = dset.Tables[0];
                    GridViewRentBooksAfterTitle.DataBind();
                    con.Close();
                    if (TextBoxTitle.Text != ""  & (RadioButtonReaderRentBookTitle.Checked == true))
                    {
                        GridViewRentBooksAfterTitle.Visible = true;
                        TextBoxTitle.Text.TrimStart();
                        
                        //TextBoxFirstName.Text = TextBoxFirstName.Text.Replace(" ", "");
                        //TextBoxLastName.Text = TextBoxLastName.Text.Replace(" ", "");
                    }

                }
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }

            //GridViewRentBookAfterCNP.Visible = false;



        }

        protected void RadioButtonReaderRentBookTitle_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                if (RadioButtonReaderRentBookTitle.Checked)
                //RadioButtonBook.Text = TextBoxSearch.Text;
                {
                    Panel1.Visible = false;
                    Panel2.Visible = true;
                    GridViewRentBookAfterCNP.Visible = false;
                    //GridViewRentBooksAfterTitle.DataBind();
                    TextBoxTitle.Text = " ";
                }
                else
                {
                    TextBoxCNP.Text = " ";
                }
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }
        }

       

        protected void RadioButtonReaderRentBookCNP_CheckedChanged(object sender, EventArgs e)
        {

            try
            {
                if (RadioButtonReaderRentBookCNP.Checked)
                //RadioButtonBook.Text = TextBoxSearch.Text;
                {
                    Panel1.Visible = true;
                    Panel2.Visible = false;
                    GridViewRentBooksAfterTitle.Visible = false;
                    //GridViewRentBookAfterCNP.DataBind();
                    TextBoxTitle.Text = "";
                }
                else
                {
                    TextBoxCNP.Text = " ";
                }
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }
        }

        //protected void GridViewRentBookAfterCNP_DataBound(object sender, EventArgs e)
        //{
        //    if (GridViewRentBookAfterCNP.Rows.Count <= 0) LabelStatus.Text = "There are no readers to display!";
        //    else LabelStatus.Visible = false;
        //}
    }
}



//if (TextBoxCNP.Text != "" & (RadioButtonReaderRentBookCNP.Checked == true))
//           {
//               Panel1.Visible = true;
//               Panel2.Visible = false;
//               GridViewRentBookAfterCNP.Visible = true;

//               GridViewRentBooksAfterTitle.Visible = false;

//               GridViewRentBookAfterCNP.DataBind();
//               GridViewRentBooksAfterTitle.DataBind();
//           }
//           else if (TextBoxTitle.Text != "" & (RadioButtonRentBookTitle.Checked == true))
//           {
//               Panel1.Visible = false;
//               Panel2.Visible = true;
//               GridViewRentBookAfterCNP.Visible = false;

//               GridViewRentBooksAfterTitle.Visible = true;

//               GridViewRentBookAfterCNP.DataBind();
//               GridViewRentBooksAfterTitle.DataBind();

//           }
//       }

