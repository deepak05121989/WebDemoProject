﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
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
            try
            {
                //save database
                using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-MFTT75J;Initial Catalog=TestDB;Integrated Security=True"))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand();
                    string sqlQuery = "select UserId,role from login where UserId=@UserId and Pass=@Pass";
                    cmd.CommandText = sqlQuery;
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
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