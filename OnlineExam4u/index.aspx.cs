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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            categorylistmethod();
        }

        public void categorylistmethod()
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("select * from category", con);
                try
                {
                    con.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    if (rd.HasRows)
                    {
                        gridview_categorylist.DataSource = rd;
                        gridview_categorylist.DataBind();
                    }
                    else
                    {
                        panel_categoryshow_warning.Visible = true;
                        lbl_categoryshowwarning.Text = "Sorry! There is no category";
                    }

                }
                catch (Exception ex)
                {
                    panel_categoryshow_warning.Visible = true;
                    lbl_categoryshowwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem " + ex.Message;
                }
            }
        }

    }
}