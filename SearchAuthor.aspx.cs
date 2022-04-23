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
    public partial class WebForm19 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                GridViewAuthorName.Visible = true;
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            try
            {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
                //creeaza obiectul sql command
                SqlCommand cmd = new SqlCommand("spSearchByAuthorAndStatusBook", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                //adauga parametrii de input obiectului sql command

                cmd.Parameters.AddWithValue("@authorName  ", TextBoxAuthorName.Text);
                con.Open();

                DataSet dset = new DataSet();
                new SqlDataAdapter(cmd).Fill(dset);
                this.GridViewAuthorName.DataSource = dset.Tables[0];
                GridViewAuthorName.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }
        }
    }
}