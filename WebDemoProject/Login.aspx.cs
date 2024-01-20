using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace WebDemoProject
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["TestDBConnection"].ConnectionString;
                //save database
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    string sqlQuery = "usp_login";
                    cmd.CommandText = sqlQuery;
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserId", TextBox1.Text);
                    cmd.Parameters.AddWithValue("@Pass", TextBox2.Text);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        if (dr["role"].ToString() == "customer")
                        {
                            Session["userid"] = TextBox1.Text;
                            Response.Redirect("~\\Customer\\CustomerHome.aspx");
                        }
                        else
                        {
                            Session["adminuserid"] = TextBox1.Text;
                            Response.Redirect("~\\Admin\\AdminHome.aspx");

                        }
                    }
                    else
                    {
                        lblErrorMessage.Text = "Invalid userid and password , please try again";
                    }
                    con.Close();
                }
            }
            catch (SqlException ex)
            {
                lblErrorMessage.Text = ex.Message;
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = ex.Message;
            }

        }
    }
}