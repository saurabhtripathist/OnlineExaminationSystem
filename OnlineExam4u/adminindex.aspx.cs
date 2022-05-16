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
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            gettotalexam();
            gettotalquestion();
            gettotalstudents();
        }

        public void gettotalexam()
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("select count(exam_id) from exam", con);
                try
                {
                    con.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    lbltotalexam.Text = i.ToString();

                }
                catch (Exception ex)
                {
                    panel_index_warning.Visible = true;
                    lbl_indexwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }
            }
        }

        public void gettotalquestion()
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("select count(question_id) from question", con);
                try
                {
                    con.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    lbltotalquestion.Text = i.ToString();

                }
                catch (Exception ex)
                {
                    panel_index_warning.Visible = true;
                    lbl_indexwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }
            }
        }

        public void gettotalstudents()
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("SELECT COUNT(user_id) from users", con);
                try
                {
                    con.Open();
                    int i = Convert.ToInt32(cmd.ExecuteScalar());
                    lbltotalstudents.Text = i.ToString();

                }
                catch (Exception ex)
                {
                    panel_index_warning.Visible = true;
                    lbl_indexwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }
            }
        }
    }
}
    