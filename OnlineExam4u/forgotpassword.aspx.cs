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
    public partial class forgotpassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_reset_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
                {
                    SqlCommand cmd = new SqlCommand("update users set user_password= @userpass where user_password = @useroldpassword", con);
                    cmd.Parameters.AddWithValue("@userpass", txt_newpass.Text);
                    cmd.Parameters.AddWithValue("@useroldpassword", txt_currpass.Text);
                    try
                    {
                        con.Open();
                        int i = (int)cmd.ExecuteNonQuery();
                        if (i > 0)
                        {
                            Response.Redirect("index.aspx");
                        }
                        else
                        {
                            txt_currpass.Focus();
                            panel_resetpass_warning.Visible = true;
                            lbl_resetpasswarning.Text = "Something went wrong. Can't update. Please try after sometime later</br> ";
                        }
                    }
                    catch (Exception ex)
                    {
                        txt_currpass.Focus();
                        panel_resetpass_warning.Visible = true;
                        lbl_resetpasswarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                    }
                }
            }
            else
            {
                txt_currpass.Focus();
                panel_resetpass_warning.Visible = true;
                lbl_resetpasswarning.Text = "You must fill all the requirements";
            }
        }
    }
}
   