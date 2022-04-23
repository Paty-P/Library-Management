using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;



namespace LibraryManagement
{
    public partial class WebForm1 : System.Web.UI.Page
    {
       
            protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                PanelAuthor.Visible = false;
                PanelBook.Visible = false;
                //GridView1.Visible = false;
                //GridView2.Visible = false;
                //Label4.Visible = false;
                ////GridView3.Visible = false;
                //TextBoxSearch.Focus();

            }
        }
        protected void Page_Init(object sender, EventArgs e)
        {
            //Gridview1.DataSource = SqlDataSource1;
            //Gridview1.DataBind();
            ////Gridview2.DataSource = SqlDataSource2;
            //Gridview2.DataBind();
        }


        protected void TextBoxSearch_TextChanged(object sender, EventArgs e)
        {
            Response.Write("Text changed");
        }

        protected void RadioButtonBook_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                if (RadioButtonBook.Checked)
                //RadioButtonBook.Text = TextBoxSearch.Text;
                {
                    PanelBook.Visible = true;
                    PanelAuthor.Visible = false;
                    GridViewBook.Visible = false;

                    TextBoxSearch.Text = " ";
                }
                else
                {
                    TextBoxSearch.Text = " ";
                }
            }

            catch (Exception ex)
            {
                //Log the exception information
                Label4.Text = ex.Message;
            }
        }

        protected void RadioButtonAuthor_CheckedChanged(object sender, EventArgs e)
        {
            
                if (RadioButtonAuthor.Checked)
                //RadioButtonBook.Text = TextBoxSearch.Text;
                {
                    PanelAuthor.Visible = true;
                    PanelBook.Visible = false;
                    GridViewAuthor.Visible = false;
                    TextBoxSearch.Text = " ";
                TextBoxSearch.Text = TextBoxSearch.Text.TrimStart();


            }
                else
                {
                    TextBoxSearch.Text = " ";
                }

            }
        protected void ButtonSearch_Click1(object sender, EventArgs e)
        {

            
                


            try
            {
                //TextBoxSearch.Text = " ";

                if (TextBoxSearch.Text != "" & (RadioButtonAuthor.Checked == true))
                {
                    PanelAuthor.Visible = true;
                    PanelBook.Visible = false;
                    GridViewAuthor.Visible = true;
                    //GridViewAuthor.Enabled = true;
                    GridViewBook.Visible = false;
                    //GridViewBook.Enabled = false;
                    TextBoxSearch.Text = TextBoxSearch.Text.TrimStart();
                    GridViewAuthor.DataBind();
                    //string search = TextBoxSearch.Text;
                    //GridView1.DataBind();
                    //GridView2.DataBind();
                }
                else if (TextBoxSearch.Text != "" & (RadioButtonBook.Checked == true))
                {
                    PanelAuthor.Visible = false;
                    PanelBook.Visible = true;
                    GridViewBook.Visible = true;
                    //GridViewBook.Enabled = true;
                    GridViewAuthor.Visible = false;
                    //GridViewAuthor.Enabled = false;
                    TextBoxSearch.Text = TextBoxSearch.Text.TrimStart();

                    GridViewBook.DataBind();

                }
            }
            

            //    if (GridView1.Rows.Count == 0 & (RadioButtonAuthor.Checked == true))
            //    {
            //        Label4.Visible = true;
            //        Label4.Text = "There is no author name ";
            //        GridView2.Enabled = false;
            //        GridView2.Visible = false;
            //        GridView1.DataBind();
            //        GridView2.DataBind();

            //    }
            //    else if (GridView2.Rows.Count == 0 & (RadioButtonBook.Checked == true))
            //    {

            //        Label4.Visible = true;
            //        Label4.Text = "There are no books whith this title in the library!";
            //        GridView1.Enabled = false;
            //        GridView2.Visible = false;
            //        GridView1.DataBind();
            //        GridView2.DataBind();
            //    }
            //}
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
       


    }

  

        

       

      
    }

    


        
    
