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
    public partial class adminlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
                {
                    SqlCommand cmd = new SqlCommand("spAdminlogin", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@admin_email", txt_email.Text);
                    cmd.Parameters.AddWithValue("@password", txt_pass.Text);
                    try
                    {
                        con.Open();
                        int value = (int)cmd.ExecuteScalar();
                        if (value == 1)
                        {
                            if (chk_remember.Checked)
                            {
                                HttpCookie admin = new HttpCookie("admin_cookies"); 
                                admin["adminemail"] = txt_email.Text;
                                admin["adminpassword"] = txt_pass.Text;
                                admin.Expires = DateTime.Now.AddMinutes(60); 
                                Response.Cookies.Add(admin); 
                            }
                            else
                            {
                                Session["adminemail"] = txt_email.Text;
                            }
                            Response.Redirect("adminindex.aspx");
                        }
                        else
                        {
                            pnl_warning.Visible = true;
                            lbl_warning.Text = "Use correct email and password</br>";
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