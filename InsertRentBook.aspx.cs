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
    public partial class WebForm13 : System.Web.UI.Page
    {
      protected void Page_Load(object sender, EventArgs e)
        {
           
                if (!IsPostBack)
                {
                PanelInsert.Visible = false;
                PanelUpdate.Visible = false;
                //CalendarBorrowdate.Visible = false;
                //CalendarReturnDate.Visible = false;
                   

                }

            }
        




        public void MethodRetrieveReaderId()
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {

                SqlCommand cmd = new SqlCommand("spRetrieveReaderId", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CNP", TextBoxCNP.Text);
                con.Open();
                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        if (rdr["reader_id"].GetType() != typeof(DBNull))
                        {
                            LabelName.Text = rdr["Name"].ToString();
                            HiddenFieldRaderId.Value = rdr["reader_id"].ToString();
                       
                            if (rdr.Read())
                            {
                                Response.Write("The reader reads");
                            }
                            else
                            {
                                Response.Write("The reader doesn`t reads");
                            }
                        }
                        else 
                        {
                            LabelName.ForeColor = System.Drawing.Color.Red;
                            LabelName.Text ="The CNP does not exist!";
                            LabelName.Visible = true;
                        }
                    }
                }
            }

        }
        public void MethodRetrieveBookId()
        {
            string CS = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(CS))
            {

                SqlCommand cmd = new SqlCommand("spRetrieveBookId", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@registration_number", TextBoxRegistrationNumber.Text);
                con.Open();

                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    while (rdr.Read())
                    {
                        if (rdr["book_id"].GetType() != typeof(DBNull))
                        {
                            HiddenFieldBookId.Value = rdr["book_id"].ToString();
                            //HiddenFieldRaderId.Value = rdr["reader_id"].ToString();
                          
                        }
                        else
                        {
                            LabelName.ForeColor = System.Drawing.Color.Red;
                            LabelName.Text = "The book id does not exist!";
                        }
                    }
                }
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            MethodRetrieveReaderId();

            if (String.IsNullOrEmpty(TextBoxCNP.Text))
            {
                LabelName.ForeColor = System.Drawing.Color.Red;
                LabelName.Text = "You must insert the CNP!";
            }
           
        }

        //protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        //{
        //    if (CalendarBorrowdate.Visible)
        //    {
        //        CalendarBorrowdate.Visible = false;
        //    }
        //    else
        //    {
        //        CalendarBorrowdate.Visible = true;
        //    }
        //}

       

       

       

        //protected void CalendarBorrowdate_DayRender(object sender, DayRenderEventArgs e)
        //{
        //    if (e.Day.IsOtherMonth)
        //    {
        //        e.Day.IsSelectable = false;
        //        e.Cell.BackColor = System.Drawing.Color.DarkKhaki;
        //    }
        //}
        public void MeethodClearInsert()
        {
            HiddenFieldRaderId.Value = " ";
            HiddenFieldBookId.Value= " ";
            TextBoxRegistrationNumber.Text= " ";
            //CalendarBorrowdate.SelectedDates.Clear();
            TextBoxBorrowDate.Text = " ";
            TextBoxCNP.Text = " ";
            LabelStatus.Text = " ";
        }
        public void MethodClearUpdate()
        {
            TextBoxRegistrationNrUpdate.Text = "";
            //CalendarBorrowdate.SelectedDates.Clear();
            TextBoxCNP.Text = " ";
            TextBoxReturndate.Text = "";
        }

        //protected void CalendarReturnDate_DayRender(object sender, DayRenderEventArgs e)
        //{
        //    if (e.Day.IsOtherMonth)
        //    {
        //        e.Day.IsSelectable = false;
        //        e.Cell.BackColor = System.Drawing.Color.DarkKhaki;
        //    }
        //}

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
                //creeaza obiectul sql command
                SqlCommand cmd = new SqlCommand("spInsertRentBook", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                //adauga parametrii de input obiectului sql command
                cmd.Parameters.AddWithValue("@reader_id ", HiddenFieldRaderId.Value);
                cmd.Parameters.AddWithValue("@book_id ", HiddenFieldBookId.Value);
                cmd.Parameters.AddWithValue("@registration_number  ", TextBoxRegistrationNumber.Text);
                cmd.Parameters.AddWithValue("@borrow_date  ", Convert.ToDateTime(TextBoxBorrowDate.Text));
                //cmd.Parameters.AddWithValue("@return_date  ", null);
                cmd.Parameters.AddWithValue("@status  ", 0);
                
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                if (Page.IsValid)
                {
                    LabelData.Visible = true;
                    LabelData.ForeColor = System.Drawing.Color.Green;
                    LabelData.Text = "You have succesfully inserted the dates!";
                    MeethodClearInsert();
                }
                else
                {
                    LabelData.ForeColor = System.Drawing.Color.Red;
                    LabelData.Text = "Validation Failed! data not saved";
                }

            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }
          

        }

        protected void MethodUpdateRentBook()
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
                //creeaza obiectul sql command
                SqlCommand cmd = new SqlCommand("spUpdateRentBook", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                //adauga parametrii de input obiectului sql command
               
                cmd.Parameters.AddWithValue("@registration_number  ", TextBoxRegistrationNrUpdate.Text);
                cmd.Parameters.AddWithValue("@return_date", Convert.ToDateTime(TextBoxReturndate.Text));
                cmd.Parameters.AddWithValue("@status", 1);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                if (Page.IsValid)
                {
                    LabelData.Visible = true;
                    LabelData.ForeColor = System.Drawing.Color.Green;
                    LabelData.Text = "You have succesfully inserted the dates!";
                    MethodClearUpdate();
                }
                else
                {
                    LabelData.ForeColor = System.Drawing.Color.Red;
                    LabelData.Text = "Validation Failed! data not saved";
                }

            }
            catch (Exception ex)
            {

                Response.Write(ex.Message);
            }


        }

        protected void TextBoxRegistrationNumber_TextChanged(object sender, EventArgs e)
        {
            MethodRetrieveBookId();
        }

       

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            MethodUpdateRentBook();
        }

        protected void RadioButtonInsert_CheckedChanged(object sender, EventArgs e)
        {
            if(RadioButtonInsert.Checked)
            {
                PanelInsert.Visible = true;
                PanelUpdate.Visible = false;
            }
           
        }

        protected void RadioButtonUpdate_CheckedChanged(object sender, EventArgs e)
        {
            if(RadioButtonUpdate.Checked)
            {
                PanelUpdate.Visible = true;
                PanelInsert.Visible = false;

            }
        }

        //protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        //{
        //    if (CalendarReturnDate.Visible)
        //    {
        //        CalendarReturnDate.Visible = false;
        //    }
        //    else
        //    {
        //        CalendarReturnDate.Visible = true;
        //    }
        //}

        //protected void CalendarReturnDate_SelectionChanged(object sender, EventArgs e)
        //{

        //    TextBoxReturndate.Text = TextBoxReturndate.SelectedDate.ToString("yyyy-MM-dd");
        //    CalendarReturnDate.Visible = false;
        //    LabelUpdate.Text = "Returned";

        //}
        //protected void CalendarBorrowdate_SelectionChanged(object sender, EventArgs e)
        //{
        //    TextBoxBorrowDate.Text = CalendarBorrowdate.SelectedDate.ToString("yyyy-MM-dd");
        //    CalendarBorrowdate.Visible = false;
        //    LabelStatus.Text = "Borrowed";
        //}
       

        protected void TextBoxCNP_TextChanged(object sender, EventArgs e)
        {
            LabelData.Visible = true;
        }

        protected void TextBoxReturndate_TextChanged(object sender, EventArgs e)
        {
            if (TextBoxReturndate.Text != " ")
            {
                LabelUpdate.Text = "Returned";
        }
            else
            {
                LabelStatus.Text = "Unknown";
            }

        }

        protected void TextBoxBorrowDate_TextChanged1(object sender, EventArgs e)
        {
            if (TextBoxBorrowDate.Text != " ")
            {
                LabelStatus.Text = "Borrowed";
            }
            else
            {
                LabelStatus.Text = "Unknown";
            }
        }
    }
    }





