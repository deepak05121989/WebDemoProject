using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


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
                //save database
                using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-HMJJQP2;Initial Catalog=TestDB;Integrated Security=True"))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    string sqlQuery = "insert into register([Fname], [Lname], [UserId], [Pass], [EmailId], [Mobile], [Address], [PinCode], [State], [City], [Gender], [Age]) values(@Fname, @Lname, @UserId, @Pass, @EmailId, @Mobile, @Address, @PinCode, @State, @City, @Gender, @Age)";
                    cmd.CommandText = sqlQuery;
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
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
                    int result = cmd.ExecuteNonQuery();
                    if (result > 0)
                    {
                        lblErrorMessage.Text = "Insert successfuly";
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