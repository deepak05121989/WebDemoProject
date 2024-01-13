using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebDemoProject.Admin
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminuserid"] != null)
            {
                Label1.Text = Session["adminuserid"].ToString();
            }
            else{
                Response.Redirect("~\\Login.aspx");
            }

        }
    }
}