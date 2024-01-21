using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace WebDemoProject.Admin
{
    public partial class ManageProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string connectionString = ConfigurationManager.ConnectionStrings["TestDBConnection"].ConnectionString;

                if(!fileUploadroductImg.HasFile)
                {
                    lblErrormessage.Text = "File path can't be empty";
                    return;
                }
                string filePath = "~\\uploads\\" + fileUploadroductImg.FileName;

                FileInfo f=new FileInfo(fileUploadroductImg.FileName);
                if(f.Extension!=".jpeg" && f.Extension!=".jpg")
                {
                    lblErrormessage.Text = "File extention should be .jpeg and jpg formt only";
                    return;
                }
                fileUploadroductImg.PostedFile.SaveAs(Server.MapPath(filePath));
                //save database
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    string sqlQuery = "usp_AddProducts";
                    cmd.CommandText = sqlQuery;
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@pro_name", txtProductName.Text);

                    cmd.Parameters.AddWithValue("@pro_catg", txtProductCatg.Text);

                    cmd.Parameters.AddWithValue("@pro_mrp", txtProductMrp.Text);
                    cmd.Parameters.AddWithValue("@pro_price", txtProductPrice.Text);
                    cmd.Parameters.AddWithValue("@pro_desc", txtProductDesc.Text);
                    cmd.Parameters.AddWithValue("@pro_image", filePath);
                    int result = cmd.ExecuteNonQuery();
                    
                    if (result > 0)
                    {
                        lblErrormessage.Text = "Inset Successfull";
                        gridViewProductDetails.DataBind();
                    }
                    else
                    {
                        lblErrormessage.Text = "Inset Fail, try again";
                    }
                    con.Close();
                }
            }
            catch (SqlException ex)
            {
                lblErrormessage.Text = ex.Message;
            }
            catch (Exception ex)
            {
                lblErrormessage.Text = ex.Message;
            }
        }
    }
}