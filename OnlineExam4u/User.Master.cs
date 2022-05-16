using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Examination_System
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack || !IsPostBack)
            {
                HttpCookie usercookie = Request.Cookies["user_cookies"];
                if (Session["Useremail"] != null || usercookie != null)
                {
                    link_loginout.Text = "Log out";
                }
                else
                {
                    link_loginout.Text = "Log In";
                    Response.Redirect("login.aspx");
                }
            }
        }

        protected void link_loginout_Click(object sender, EventArgs e)
        {
            if (link_loginout.Text == "Log out")
            {
                Response.Cookies["user_cookies"].Expires = DateTime.Now.AddMinutes(60);
                Response.Cookies.Clear();
                Session.Clear();
                Response.Redirect("Login.aspx");
            }
            else
            {
                link_loginout.Text = "Log in";
            }
        }
    }
}