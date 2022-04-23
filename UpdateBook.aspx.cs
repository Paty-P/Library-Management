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
    public partial class WebForm11 : System.Web.UI.Page
    {
       
             public static string book_id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
        }

        public void btnSearch_Click(object sender, EventArgs e)
        {
            searchBook();
        }
        public void searchBook()
        {

            //string script = "select book_id, title, publishing_house_id, language from tblBook where title like '" + txtSearch.Text + "'";
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spListBookAFterTitle", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Title", SqlDbType.VarChar).Value = txtSearch.Text;
                con.Open();
                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
                con.Close();
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    book_id = reader["book_id"].ToString();
                }
               
            }
            //Response.Write(book_id);
        }
        public void btnUpdate_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                listPublisher();
                ddlPublisher.Items.FindByText(row.Cells[4].Text).Selected = true;
                listLanguage();
                ddlLanguage.Items.FindByText(row.Cells[6].Text).Selected = true;
                txtTitle.Text = row.Cells[2].Text;
                listAuthor();
                ddlAuthor.Items.FindByText(row.Cells[3].Text).Selected = true;
                listDomain();
                ddlDomain.Items.FindByText(row.Cells[5].Text).Selected = true;
                txtPrice.Text = row.Cells[7].Text;
                txtCopies.Text = row.Cells[8].Text;
                txtPublishingDate.Text = row.Cells[9].Text;
                txtRegistrationDate.Text = row.Cells[10].Text;
            }
            //ddlPublisher.Visible = true;
            //ddlLanguage.Visible = true;
        }
        public void listPublisher()
        {
            string script = "select publishing_house_id, name from tblPublishingHouse";
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand(script, con);
                con.Open();
                ddlPublisher.DataSource = cmd.ExecuteReader();
                ddlPublisher.DataTextField = "name";
                ddlPublisher.DataValueField = "publishing_house_id";
                ddlPublisher.DataBind();
                ddlPublisher.Items.Insert(0, new ListItem("Select publishing", "0"));
            }
        }
        public void listLanguage()
        {
            string script = "select language_id, language_name from tblLanguage";
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand(script, con);
                con.Open();
                ddlLanguage.DataSource = cmd.ExecuteReader();
                ddlLanguage.DataTextField = "language_name";
                ddlLanguage.DataValueField = "language_id";
                ddlLanguage.DataBind();
                ddlLanguage.Items.Insert(0, new ListItem("Select language", "0"));
            }
        }
        public void listAuthor()
        {
            string script = "select author_id, first_name + ' ' + last_name as Name from tblAuthor";
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand(script, con);
                con.Open();
                ddlAuthor.DataSource = cmd.ExecuteReader();
                ddlAuthor.DataTextField = "Name";
                ddlAuthor.DataValueField = "author_id";
                ddlAuthor.DataBind();
                ddlAuthor.Items.Insert(0, new ListItem("Select author", "0"));
            }
        }
        public void listDomain()
        {
            string script = "select domain_id, name from tblDomain";
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand(script, con);
                con.Open();
                ddlDomain.DataSource = cmd.ExecuteReader();
                ddlDomain.DataTextField = "name";
                ddlDomain.DataValueField = "domain_id";
                ddlDomain.DataBind();
                ddlDomain.Items.Insert(0, new ListItem("Select domain", "0"));
            }
        }
        public void saveBookModify()
        {
            //string script = "update tblBook set publishing_house_id="+ddlPublisher.SelectedValue.ToString()+", [language]="+ddlLanguage.SelectedValue.ToString()+" where book_id =" + book_id;
            //string script = "update tblBook set publishing_house_id = 3 where book_id = 3";

            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spUpdateBook", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Title", SqlDbType.VarChar).Value = txtTitle.Text;
                cmd.Parameters.Add("@BookId", SqlDbType.Int).Value = book_id;
                cmd.Parameters.Add("@Author", SqlDbType.Int).Value = ddlAuthor.SelectedValue;
                cmd.Parameters.Add("@Publishing", SqlDbType.Int).Value = ddlPublisher.SelectedValue;
                cmd.Parameters.Add("@Domain", SqlDbType.Int).Value = ddlDomain.SelectedValue;
                cmd.Parameters.Add("@Language", SqlDbType.Int).Value = ddlLanguage.SelectedValue;
                cmd.Parameters.Add("@Price", SqlDbType.SmallMoney).Value = txtPrice.Text;
                cmd.Parameters.Add("@Copies", SqlDbType.TinyInt).Value = txtCopies.Text;
                cmd.Parameters.Add("@PublishingDate", SqlDbType.Date).Value = DateTime.Parse(txtPublishingDate.Text);
                cmd.Parameters.Add("@RegistrationDate", SqlDbType.Date).Value = DateTime.Parse(txtRegistrationDate.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }


            //update tblBook set publishing_house_id = 2 where book_id = 3
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //MethodClearItems();
            saveBookModify();
            searchBook();
            //string message = "Your details have been saved successfully.";
            //string script = "window.onload = function(){ alert('";
            //script += message;
            //script += "')};";
            //ClientScript.RegisterStartupScript(this.GetType(), "SuccessMessage", script, true);
            MethodClearItems();

        }
        public void MethodClearItems()
        {
            txtSearch.Text = "";

            txtTitle.Text = "";
            ddlPublisher.SelectedIndex = 0;
            ddlAuthor.SelectedIndex = 0;
            ddlDomain.SelectedIndex = 0;
            ddlLanguage.SelectedIndex = 0;
            txtPrice.Text = "";
            txtCopies.Text = "";
            txtPublishingDate.Text = "";
            txtRegistrationDate.Text = "";
        }
    }

       
    }

        
    
