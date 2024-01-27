using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using WebDemoProject.DBContext;

namespace WebDemoProject
{
    public partial class Register : System.Web.UI.Page
    {
       SQLHelper sQLHelper= new SQLHelper();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string sqlQuery = "usp_register";
                SqlParameter[] pram =
                {
                    new SqlParameter("@Fname", textFirstName.Text),
                    new SqlParameter("@Lname", textLastName.Text),
                    new SqlParameter("@UserId", textUserId.Text),
                    new SqlParameter("@Pass", textPssword.Text),
                    new SqlParameter("@EmailId", textEmail.Text),
                    new SqlParameter("@Mobile", textMobile.Text),
                    new SqlParameter("@Address", textAddress.Text),
                    new SqlParameter("@PinCode", textPinCode.Text),
                    new SqlParameter("@State", dropState.SelectedItem.ToString()),
                    new SqlParameter("@City", dropCity.SelectedItem.ToString()),
                    new SqlParameter("@Gender", radioGender.Text),
                    new SqlParameter("@Age", textAge.Text)
                };
                int result=sQLHelper.ExecuteNonQueryByProc(sqlQuery, pram);
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