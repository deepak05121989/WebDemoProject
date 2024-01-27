using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebDemoProject
{
    public partial class CartPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["proId"] != null)
                    GetProductById(Convert.ToInt32(Request.QueryString["proId"]));
            }
        }
        private void GetProductById(int proId)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["TestDBConnection"].ConnectionString;
                //save database
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    string sqlQuery = "usp_GetProductById";
                    cmd.CommandText = sqlQuery;
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@proId", proId);
                    DataSet ds = new DataSet();
                    SqlDataAdapter ad = new SqlDataAdapter(cmd);
                    ad.Fill(ds);
                    if (ds.Tables[0].Rows.Count>0)
                    {
                        GridView1.DataSource = ds;
                        GridView1.DataBind();

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