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
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sid = Request.QueryString["sid"];
            if (sid == null)
            {
                Response.Redirect("category.aspx");
            }
            examlistmethod(Convert.ToInt32(sid));
            subjectnamemethod(Convert.ToInt32(sid));
        }

        public void examlistmethod(int id)
        {

            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("spExamsearchcategory", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@subjectid", id);
                try
                {
                    con.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    if (rd.HasRows)
                    {
                        gridview_sujectexam.DataSource = rd;
                        gridview_sujectexam.DataBind();
                    }
                    else
                    {
                        panel_examshow_warning.Visible = true;
                        lbl_examshowwarning.Text = "Sorry! There is no exam in this subject";
                    }
                }
                catch (Exception ex)
                {
                    panel_examshow_warning.Visible = true;
                    lbl_examshowwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }
            }
        }
        public void subjectnamemethod(int id)
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("select * from subject where subject_id = @subjectid", con);
                cmd.Parameters.AddWithValue("@subjectid", id);
                try
                {
                    con.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    while (rd.Read())
                    {
                        lbl_subjectexam.Text = rd["subject_name"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    panel_examshow_warning.Visible = true;
                    lbl_examshowwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem " + ex.Message;
                }
            }
        }
    }
}
