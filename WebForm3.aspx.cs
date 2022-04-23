using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ComponentModel.DataAnnotations;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace LibraryManagement
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)

        {if (!this.IsPostBack)
                {
                this.ConnectionMethod();
            }



        }
        public  void ConnectionMethod()
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection connection = new SqlConnection("data source=.; database=DbLibrary; integrated security=SSPI"))
            {
                //Create an instance of SqlCommand class, specifying the T-SQL command that
                //we want to execute, and the connection object.
                SqlCommand cmd = new SqlCommand("Select * from tblBook", connection);
                connection.Open();
                //As the T-SQL statement that we want to execute return multiple rows of data, 
                //use ExecuteReader() method of the command object.


                GridView1.DataSource = cmd.ExecuteReader();
                GridView1.DataBind();
            }


           
                }
            }

        }


    