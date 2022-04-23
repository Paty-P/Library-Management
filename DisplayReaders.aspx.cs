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
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MethodBindReaders();
            }
        }
        //metoda conexiune cu baza de date si aducerea datelor din tabel
        public void MethodBindReaders()
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection connection = new SqlConnection("data source=.; database=DBLibrary; integrated security=SSPI"))
            {

                SqlCommand cmd = new SqlCommand("Select * from tblReader", connection);
                connection.Open();

                GridViewDisplayReaders.DataSource = cmd.ExecuteReader();
                GridViewDisplayReaders.DataBind();
            }
        }
    }
    }
