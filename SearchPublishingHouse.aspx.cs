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
    public partial class WebForm16 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            try
            {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
                //creeaza obiectul sql command
                SqlCommand cmd = new SqlCommand("spSearchByPublishingHouseName", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                //adauga parametrii de input obiectului sql command

                cmd.Parameters.AddWithValue("@name_publishing  ", TextBoxPbH.Text);
                con.Open();
                DataSet dset = new DataSet();
                new SqlDataAdapter(cmd).Fill(dset);
                this.GridViewPbHName.DataSource = dset.Tables[0];
                GridViewPbHName.DataBind();
                con.Close();


            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }
        }
    }
}