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
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                PanelReaderName.Visible = false;
                PanelCNP.Visible = false;
                TextBoxFirstName.Text.TrimStart();
                TextBoxLastName.Text.TrimStart();
                TextBoxCNP.Text.TrimStart();
            }
        }

        protected void RadioButtonReaderName_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                if (RadioButtonReaderName.Checked)
                //RadioButtonBook.Text = TextBoxSearch.Text;
                {
                    PanelReaderName.Visible = true;
                    PanelCNP.Visible = false;
                    GridViewCNP.Visible = false;
                    TextBoxCNP.Text = " ";
                }
                else
                {
                    TextBoxFirstName.Text = " ";
                    TextBoxLastName.Text = " ";
                }
            }
           
            catch (Exception ex)
            {
                //Log the exception information
                LabelNotFound.Text = ex.Message;
            }

        }

        protected void RadioButtonCNP_CheckedChanged(object sender, EventArgs e)
        {
            if (RadioButtonCNP.Checked)
            //RadioButtonBook.Text = TextBoxSearch.Text;
            {
                PanelCNP.Visible = true;
                PanelReaderName.Visible = false;
                GridViewReaderName.Visible = false;
                TextBoxFirstName.Text = " ";
                TextBoxLastName.Text = " ";
            }
            else
            {
                TextBoxCNP.Text = " ";
            }

        }



       
        protected void SearchByReaderName()
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {

                SqlCommand cmd = new SqlCommand("spSearchByReaderName", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                //adaugare param de input la command object
                cmd.Parameters.AddWithValue("@first_name", TextBoxFirstName.Text );
                cmd.Parameters.AddWithValue("@last_name", TextBoxLastName.Text);
                //deschiderea conexiunii si executarea interogarii
                con.Open();
               
                GridViewReaderName.DataSource = cmd.ExecuteReader() ;
                GridViewReaderName.DataBind();



            }
        }

        protected void SearchByCNP()
        {

            string ConnectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {

                SqlCommand cmd = new SqlCommand("spSearchByReaderCNP", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                //adaugare param de input la command object
                cmd.Parameters.AddWithValue("@CNP", TextBoxCNP.Text);
                
                //deschiderea conexiunii si executarea interogarii
                con.Open();

                GridViewCNP.DataSource = cmd.ExecuteReader();
                GridViewCNP.DataBind();

            }
        }

        protected void ButtonSearchReaderName_Click(object sender, EventArgs e)
        {
            SearchByReaderName();
           if (TextBoxFirstName.Text != "" & TextBoxLastName.Text != " " & (RadioButtonReaderName.Checked == true))
            {
                GridViewReaderName.Visible = true;
                TextBoxFirstName.Text.TrimStart();
                TextBoxLastName.Text.TrimStart();
                //TextBoxFirstName.Text = TextBoxFirstName.Text.Replace(" ", "");
                //TextBoxLastName.Text = TextBoxLastName.Text.Replace(" ", "");
            }

        }

        protected void ButtonSearchByCNP_Click(object sender, EventArgs e)
        {
            SearchByCNP();
            if (TextBoxCNP.Text != ""  & (RadioButtonCNP.Checked == true))
            {
                GridViewCNP.Visible = true;
                TextBoxCNP.Text.TrimStart();
                //TextBoxCNP.Text = TextBoxCNP.Text.Replace(" ", "");
            }
        }

        protected void TextBoxCNP_TextChanged(object sender, EventArgs e)
        {
            TextBoxCNP.Text = TextBoxCNP.Text.TrimStart();
        }
    }
    }