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
    public partial class WebForm15 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MethodBindRentBook();
            }
        }
        //metoda conexiune cu baza de date si aducerea datelor din tabel
        public void MethodBindRentBook()
        {
            try
            {
                string ConnectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection connection = new SqlConnection("data source=.; database=DBLibrary; integrated security=SSPI"))
                {

                    SqlCommand cmd = new SqlCommand("Select * from tblRentBook", connection);
                    connection.Open();

                    GridViewDeleteRentBook.DataSource = cmd.ExecuteReader();
                    GridViewDeleteRentBook.DataBind();
                }
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }

        }
        //evenimentul care specifica faptul ca atunci cand selectam ceckBox-ul din header se selecteaza toate celelalte
        protected void CheckBoxDelete_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                foreach (GridViewRow gridViewRow in GridViewDeleteRentBook.Rows)
                {
                    ((CheckBox)gridViewRow.FindControl("CheckBoxDeleteRow")).Checked = ((CheckBox)sender).Checked;
                }
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }

        }
        //evenimentul care specifica faptul ca atunci cand selectam ceckBox-ul din header se selecteaza toate celelalte, 
        //iar cand deselectam minimum un checkBox din randuri, se deselecteaza ceckBox-ul din header 
        protected void CheckBoxDeleteRow_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                CheckBox headerCheckBox =
                   (CheckBox)GridViewDeleteRentBook.HeaderRow.FindControl("CheckBoxDelete");
                if (headerCheckBox.Checked)
                {
                    headerCheckBox.Checked = ((CheckBox)sender).Checked;
                }
                else
                {
                    bool allCheckBoxesChecked = true;
                    foreach (GridViewRow gridViewRow in GridViewDeleteRentBook.Rows)
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
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }

        }
        //logica pentru butonul delete care apeleaza Metoda pentru a sterge randurile selectate in gridview
        protected void ButtonDelete_Click(object sender, EventArgs e)
        {
            MethodDeleteRentBook();
        }

        // Metoda pentru a sterge randurile selectate in gridview
        public void MethodDeleteRentBook()
        {
            try
            {
                List<string> lstRentBooksToDelete = new List<string>();
                foreach (GridViewRow gridViewRow in GridViewDeleteRentBook.Rows)
                {
                    if (((CheckBox)gridViewRow.FindControl("CheckBoxDeleteRow")).Checked)
                    {
                        string readerId =
                            ((Label)gridViewRow.FindControl("LabelReaderId")).Text;
                        lstRentBooksToDelete.Add(readerId);
                    }
                }
                if (lstRentBooksToDelete.Count > 0)
                {
                    foreach (string strReadersId in lstRentBooksToDelete)
                    {
                        MethodDeleteRentBookFromTable(lstRentBooksToDelete);
                    }
                    LabelMessage.ForeColor = System.Drawing.Color.Navy;
                    LabelMessage.Text = lstRentBooksToDelete.Count.ToString() +
                        " row(s) deleted";
                    MethodBindRentBook();
                }
                else
                {
                    LabelMessage.ForeColor = System.Drawing.Color.Red;
                    LabelMessage.Text = "No rows selected to delete";
                }
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }



        }
        public void MethodDeleteRentBookFromTable(List<string> RentIds)
        {
            try
            {
                string ConnectionString = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection("data source=.; database=DBLibrary; integrated security=SSPI"))
                {

                    List<string> parameters = RentIds.Select((s, i) => "@Parameter" + i.ToString()).ToList();
                    string inClause = string.Join(",", parameters);
                    string deleteCommandText = "Delete from tblRentBook where rent_id IN (" + inClause + ")";
                    SqlCommand cmd = new SqlCommand(deleteCommandText, con);

                    for (int i = 0; i < parameters.Count; i++)
                    {
                        cmd.Parameters.AddWithValue(parameters[i], RentIds[i]);
                    }

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }

        }
    }
}

    