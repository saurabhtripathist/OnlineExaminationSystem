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
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cid = Request.QueryString["cid"];
            if (cid == null)
            {
                Response.Redirect("index.aspx");
            }
            subjectlistmethod(Convert.ToInt32(cid));
            categorynamemethod(Convert.ToInt32(cid));
        }


        public void subjectlistmethod(int id)
        {

            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("select * from subject where category_fid = @categoryid", con);
                cmd.Parameters.AddWithValue("@categoryid", id);
                try
                {
                    con.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    if (rd.HasRows)
                    {
                        gridview_categoryitem.DataSource = rd;
                        gridview_categoryitem.DataBind();
                    }
                    else
                    {
                        panel_subjectshow_warning.Visible = true;
                        lbl_subjectshowwarning.Text = "Sorry! There is no subject in this category";
                    }
                }
                catch (Exception ex)
                {
                    panel_subjectshow_warning.Visible = true;
                    lbl_subjectshowwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }
            }
        }
        public void categorynamemethod(int id)
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("select * from category where category_id = @categoryid", con);
                cmd.Parameters.AddWithValue("@categoryid", id);
                try
                {
                    con.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    while (rd.Read())
                    {
                        lbl_categorysubject.Text = rd["category_name"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    panel_subjectshow_warning.Visible = true;
                    lbl_subjectshowwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem " + ex.Message;
                }
            }
        }
    }
}