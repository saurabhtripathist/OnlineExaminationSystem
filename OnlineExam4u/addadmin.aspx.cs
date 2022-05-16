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
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_addadmin_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
                SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
                {
                    SqlCommand cmd = new SqlCommand("spAdminRegisterinsert", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@admin_name", txt_adminame.Text);
                    cmd.Parameters.AddWithValue("@admin_email", txt_admiemail.Text);
                    cmd.Parameters.AddWithValue("@password", txt_adminpass.Text);
                    try
                    {
                        con.Open();
                        int value = (int)cmd.ExecuteScalar();
                        if (value == 1)
                        {
                            Response.Redirect("adminlogin.aspx?register=successfull");
                        }
                        else
                        {
                            panel_addamin_warning.Visible = true;
                            lbl_addaminwarning.Text = "Email is already in use";
                        }

                    }
                    catch (Exception ex)
                    {
                        panel_addamin_warning.Visible = true;
                        lbl_addaminwarning.Text = "Something went wrong! Contact your devloper </br>" + ex.Message;
                    }
                }
            }
            else
            {
                panel_addamin_warning.Visible = true;
                lbl_addaminwarning.Text = "Please fill all the requirements";
            }

        }
    }
}
