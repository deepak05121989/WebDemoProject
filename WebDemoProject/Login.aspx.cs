using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebDemoProject
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if(TextBox1.Text=="Abc" && TextBox2.Text=="123")
            {
                lblErrorMessage.ForeColor = System.Drawing.Color.Green;
                lblErrorMessage.Text = "Login Successfull";
            }
            else
            {
                lblErrorMessage.Text = "invalid User id and password";


            }

        }
    }
}