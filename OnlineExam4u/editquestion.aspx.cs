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
    public partial class WebForm14 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string qid = Request.QueryString["qid"];
            if (!IsPostBack)
            {
                if (qid == null)
                {
                    Response.Redirect("examquestion.aspx");
                }
                get_editexamquestion(Convert.ToInt32(qid));
                get_editexamdrp();
                
            }
        }

        protected void btn_editquestion_Click(object sender, EventArgs e)
        {
            string qid = Request.QueryString["qid"];
            if (IsValid)
            {
                SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
                {
                    SqlCommand cmd = new SqlCommand("spEditquestion", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@questionid", Convert.ToInt32(qid));
                    cmd.Parameters.AddWithValue("@questionname", txt_editquestionname.Text);
                    cmd.Parameters.AddWithValue("@optionone", txt_editoptionone.Text);
                    cmd.Parameters.AddWithValue("@optiontwo", txt_editoptiontwo.Text);
                    cmd.Parameters.AddWithValue("@optionthree", txt_edtoptionthree.Text);
                    cmd.Parameters.AddWithValue("@optionfour", txt_editoptionfour.Text);
                    cmd.Parameters.AddWithValue("@questionanswer", rdo_editcorrectanswer.SelectedValue);
                    cmd.Parameters.AddWithValue("@examfid", drp_editexam.SelectedValue);
                    try
                    {
                        con.Open();
                        int i = (int)cmd.ExecuteNonQuery();
                        if (i > 0)
                        {
                            Response.Redirect("examquestion.aspx");
                        }
                        else
                        {
                            txt_editquestionname.Focus();
                            panel_editquestion_warning.Visible = true;
                            lbl_editquestionwarning.Text = "Something went wrong. Can't update. Please try after sometime later</br> ";
                        }
                    }
                    catch (Exception ex)
                    {
                        panel_editquestion_warning.Visible = true;
                        txt_editquestionname.Focus();
                        lbl_editquestionwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                    }
                }
            }
            else
            {
                txt_editquestionname.Focus();
                panel_editquestion_warning.Visible = true;
                lbl_editquestionwarning.Text = "You must fill all the requirements";
            }
        }
        public void get_editexamquestion(int id)
        {

            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("spEditquestionfill", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@questionid", id);
                try
                {
                    con.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    while (rd.Read())
                    {
                        txt_editquestionname.Text = rd["question_name"].ToString();
                        txt_editoptionone.Text = rd["option_one"].ToString();
                        txt_editoptiontwo.Text = rd["option_two"].ToString();
                        txt_edtoptionthree.Text = rd["option_three"].ToString();
                        txt_editoptionfour.Text = rd["option_four"].ToString();

                    }
                }
                catch (Exception ex)
                {
                    panel_editquestion_warning.Visible = true;
                    lbl_editquestionwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }
            }
        }
        public void get_editexamdrp()
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("select * from exam", con);
                try
                {
                    con.Open();
                    drp_editexam.DataSource = cmd.ExecuteReader();
                    drp_editexam.DataBind();
                    ListItem li = new ListItem("Select Exam", "-1");
                    drp_editexam.Items.Insert(0, li);
                }
                catch (Exception ex)
                {
                    txt_editquestionname.Focus();
                    panel_editquestion_warning.Visible = true;
                    lbl_editquestionwarning.Text = "Something went wrong. Try again </br>" + ex.Message;
                }
            }
        }
    }
}