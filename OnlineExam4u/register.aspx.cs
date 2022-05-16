using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Online_Examination_System
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_register_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
                {
                    SqlCommand cmd = new SqlCommand("spUsersRegisterinsert", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@user_fname", txt_fname.Text);
                    cmd.Parameters.AddWithValue("@user_lname", txt_lname.Text);
                    cmd.Parameters.AddWithValue("@email", txt_email.Text);
                    cmd.Parameters.AddWithValue("@password", txt_pass.Text);
                    try
                    {
                        con.Open();
                        int value = (int)cmd.ExecuteScalar();
                        if (value == 1)
                        {
                            Response.Redirect("login.aspx?register=successfull");
                        }
                        else
                        {
                            pnl_warning.Visible = true;
                            lbl_warning.Text = "Email is already in use";
                        }

                    }
                    catch (Exception ex)
                    {
                        pnl_warning.Visible = true;
                        lbl_warning.Text = "Something went wrong! Contact your devloper </br>" + ex.Message;
                    }
                }
            }
            else
            {
                pnl_warning.Visible = true;
                lbl_warning.Text = "Please fill all the requirements";
            }

        }
    }

}