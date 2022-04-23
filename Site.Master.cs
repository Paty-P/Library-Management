using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace LibraryManagement
{
    public partial class Site : System.Web.UI.MasterPage
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                foreach (MenuItem item in Menu1.Items)
                {
                    Check(item);
                }
            }
        }
        private void Check(MenuItem item)
        {
            if (item.NavigateUrl.Equals(Request.AppRelativeCurrentExecutionFilePath, StringComparison.InvariantCultureIgnoreCase))
            {
                item.Selected = true;
            }
            else if (item.ChildItems.Count > 0)
            {
                foreach (MenuItem menuItem in item.ChildItems)
                {
                    Check(menuItem);
                }
            }
        }

        //public HyperLink HyperLinkOnMasterPage
        //{
        //    get
        //    {
        //        return this.HyperLinkBooks0;
        //    }
        //}
    }
}