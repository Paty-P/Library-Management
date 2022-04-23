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
    public partial class WebForm9 : System.Web.UI.Page
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

                GridViewDeleteReaders.DataSource = cmd.ExecuteReader();
                GridViewDeleteReaders.DataBind();
            }
        }
        //evenimentul care specifica faptul ca atunci cand selectam ceckBox-ul din header se selecteaza toate celelalte
        protected void CheckBoxDelete_CheckedChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow gridViewRow in GridViewDeleteReaders.Rows)
            {
                ((CheckBox)gridViewRow.FindControl("CheckBoxDeleteRow")).Checked = ((CheckBox)sender).Checked;
            }
        }
        //evenimentul care specifica faptul ca atunci cand selectam ceckBox-ul din header se selecteaza toate celelalte, 
        //iar cand deselectam minimum un checkBox din randuri, se deselecteaza ceckBox-ul din header 
        protected void CheckBoxDeleteRow_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox headerCheckBox =
               (CheckBox)GridViewDeleteReaders.HeaderRow.FindControl("CheckBoxDelete");
            if (headerCheckBox.Checked)
            {
                headerCheckBox.Checked = ((CheckBox)sender).Checked;
            }
            else
            {
                bool allCheckBoxesChecked = true;
                foreach (GridViewRow gridViewRow in GridViewDeleteReaders.Rows)
                {
                    if (!((CheckBox)gridViewRow.FindControl("CheckBoxDeleteRow")).Checked)
                    {
                        allCheckBoxesChecked = false;
                        break;
                    }
                }
                headerCheckBox.Checked = allCheckBoxesChecked;
            }

        }
        //logica pentru butonul delete care apeleaza Metoda pentru a sterge randurile selectate in gridview
        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            MethodDeleteReaders();
        }

        // Metoda pentru a sterge randurile selectate in gridview
        public void MethodDeleteReaders()
        {
            List<string> lstReaderIdsToDelete = new List<string>();
            foreach (GridViewRow gridViewRow in GridViewDeleteReaders.Rows)
            {
                if (((CheckBox)gridViewRow.FindControl("CheckBoxDeleteRow")).Checked)
                {
                    string readerId =
                        ((Label)gridViewRow.FindControl("LabelReaderId")).Text;
                    lstReaderIdsToDelete.Add(readerId);
                }
            }
            if (lstReaderIdsToDelete.Count > 0)
            {
                foreach (string strReadersId in lstReaderIdsToDelete)
                {
                    MethodDeleteReadersFromTable(lstReaderIdsToDelete);
                }
                LabelMessage.ForeColor = System.Drawing.Color.Navy;
                LabelMessage.Text = lstReaderIdsToDelete.Count.ToString() +
                    " row(s) deleted";
                MethodBindReaders();
            }
            else
            {
                LabelMessage.ForeColor = System.Drawing.Color.Red;
                LabelMessage.Text = "No rows selected to delete";
            }


        }
        //metoda care sterge efectiv randurile din tabelul din baza de date, unul cate unul, ceea ce va inrautati performanta
        //public void MethodDeleteReadersFromTable(int readerId)
        //{
        //    string ConnectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        //    using (SqlConnection connection = new SqlConnection("data source=.; database=DBLibrary; integrated security=SSPI"))
        //    {

        //        SqlCommand cmd = new SqlCommand("Delete  from tblReader where reader_id = @reader_id", connection);
        //        SqlParameter param = new SqlParameter();
        //        param.ParameterName = "@reader_id";
        //        param.Value = readerId;
        //        cmd.Parameters.Add(param);
        //        connection.Open();
        //       cmd.ExecuteNonQuery();

        //    }
        //}
        //folosim mai bine aceasta metoda in care adunam toti readerId si le trimitem impreuna catre server,
        //pt a evita acest drum de fiecare data pentru fiecare inregistrare pe care dorim sa o stergem
        public void MethodDeleteReadersFromTable(List<string> ReadersIds)
        {
            string ConnectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection("data source=.; database=DBLibrary; integrated security=SSPI"))
            {

                List<string> parameters = ReadersIds.Select((s, i) => "@Parameter" + i.ToString()).ToList();
                string inClause = string.Join(",", parameters);
                string deleteCommandText = "Delete from tblReader where reader_id IN (" + inClause + ")";
                SqlCommand cmd = new SqlCommand(deleteCommandText, con);

                for (int i = 0; i < parameters.Count; i++)
                {
                    cmd.Parameters.AddWithValue(parameters[i], ReadersIds[i]);
                }

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}

    

   
