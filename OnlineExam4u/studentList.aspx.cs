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
    public partial class WebForm21 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getallstudents();
            }
        }
        public void getallstudents()
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("select * from users", con);
                try
                {
                    con.Open();
                    using (SqlDataAdapter da = new SqlDataAdapter())
                    {
                        da.SelectCommand = cmd;
                        using (DataTable tb = new DataTable())
                        {
                            da.Fill(tb);
                            if (tb != null)
                            {
                                gridallstudents.DataSource = tb;
                                gridallstudents.DataBind();
                            }
                            else
                            {
                                panel_studentlistshow_warning.Visible = true;
                                lbl_studentlistshowwarning.Text = "There is no result right now in this application";
                            }
                        }
                    }

                }
                catch (Exception ex)
                {
                    panel_studentlistshow_warning.Visible = true;
                    lbl_studentlistshowwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }
            }
        }

        protected void gridallstudents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridallstudents.PageIndex = e.NewPageIndex;
            getallstudents();
        }
    }
}