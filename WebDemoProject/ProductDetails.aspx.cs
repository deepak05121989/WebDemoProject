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
    public partial class ProductDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["proId"] != null)
                    GetProductById(Convert.ToInt32(Request.QueryString["proId"]));
            }
            if(IsPostBack)
            {

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
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        lblProName.Text = dr["pro_name"].ToString();
                        lblProMrp.Text = dr["pro_mrp"].ToString();
                        lblProPrice.Text = dr["pro_price"].ToString();
                        lblProDesc.Text = dr["pro_desc"].ToString();
                        Image1.ImageUrl = dr["pro_image"].ToString();
                        
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("CartPage.aspx?proId="+ Request.QueryString["proId"]);
        }
    }
}