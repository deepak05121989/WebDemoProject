using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


namespace WebDemoProject
{
    public partial class Register : System.Web.UI.Page
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
                    string sqlQuery = "usp_register";
                    cmd.CommandText = sqlQuery;
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Fname", textFirstName.Text);

                    cmd.Parameters.AddWithValue("@Lname", textLastName.Text);

                    cmd.Parameters.AddWithValue("@UserId", textUserId.Text);
                    cmd.Parameters.AddWithValue("@Pass", textPssword.Text);
                    cmd.Parameters.AddWithValue("@EmailId", textEmail.Text);
                    cmd.Parameters.AddWithValue("@Mobile", textMobile.Text);
                    cmd.Parameters.AddWithValue("@Address", textAddress.Text);
                    cmd.Parameters.AddWithValue("@PinCode", textPinCode.Text);
                    cmd.Parameters.AddWithValue("@State", dropState.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@City", dropCity.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@Gender", radioGender.Text);
                    cmd.Parameters.AddWithValue("@Age", textAge.Text);
                    int result =(int)cmd.ExecuteScalar();
                    if (result == 2)
                    {

                        lblErrorMessage.Text = "User already exist Please provide unique username";
                    }
                    else if(result>0)
                    {
                        lblErrorMessage.Text = "Inset Successfull";
                    }
                    else
                    {
                        lblErrorMessage.Text = "Inset Fail, try again";
                    }
                    con.Close();
                }
            }
            catch(SqlException ex)
            {
                lblErrorMessage.Text = ex.Message;
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = ex.Message;
            }
           
        }

        protected void textMobile_TextChanged(object sender, EventArgs e)
        {

        }
    }
}