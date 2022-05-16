using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Examination_System
{
    public partial class admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie admincookie = Request.Cookies["admin_cookies"];
            if (Session["adminemail"] != null || admincookie != null)
            {
                link_loginout.Text = "Log out";
            }
            else
            {
                link_loginout.Text = "Log in";
                Response.Redirect("adminlogin.aspx");
            }
        }

        protected void link_loginout_Click(object sender, EventArgs e)
        {
            if (link_loginout.Text == "Log out")
            {
                Response.Cookies["admin_cookies"].Expires = DateTime.Now.AddMinutes(60);
                Response.Cookies.Clear();
                Session.Clear();
                Response.Redirect("adminlogin.aspx");
            }
            else
            {
                link_loginout.Text = "Log in";
            }
        }
    }
}