using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace WebDemoProject
{
    public partial class Layout : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblCopyRight.Text = ConfigurationManager.AppSettings["CopyRight"];
            if(!IsPostBack)
            {

                if (Application["visit"] != null)
                {
                    Application["visit"] = (int)Application["visit"] + 1;
                    lblNoOfVisit.Text = Application["visit"].ToString();
                }
                else
                {
                    lblNoOfVisit.Text = "0";
                }

            }
            if (Session["userid"]!=null)
            {
                lblUserId.Text = Session["userid"].ToString();
                linkLogin.Text = "Logout";
            }

        }

        protected void linkLogin_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}