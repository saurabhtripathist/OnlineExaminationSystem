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
    public partial class WebForm16 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                panel_examlist.Visible = true;
                panel_addexam.Visible = false;
                getexamList();
            }
        }
        protected void btn_panelexamlist_Click(object sender, EventArgs e)
        {
            panel_examlist.Visible = true;
            panel_addexam.Visible = false;
            getexamList();
        }
        protected void btn_paneladdexam_Click(object sender, EventArgs e)
        {
            panel_examlist.Visible = false;
            panel_addexam.Visible = true;
            get_categorydrp();
            get_subjectdrp();

        }

        protected void btn_addexam_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
                {
                    SqlCommand cmd = new SqlCommand("spAddexam", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@examname", txt_examname.Text);
                    cmd.Parameters.AddWithValue("@examdis", txt_examdis.Text);
                    cmd.Parameters.AddWithValue("@examdate", txt_examdate.Text);
                    cmd.Parameters.AddWithValue("@examduration", txt_examduration.Text);
                    cmd.Parameters.AddWithValue("@exampassmarks", txt_exampassmarks.Text);
                    cmd.Parameters.AddWithValue("@exammarks", txt_exammatotalmarks.Text);
                    cmd.Parameters.AddWithValue("@examsubjectfid", drp_subjectexam.SelectedValue);
                    cmd.Parameters.AddWithValue("@examcategoryfid", drp_categoryexam.SelectedValue);
                    try
                    {
                        con.Open();
                        int i = cmd.ExecuteNonQuery();
                        if (i > 0)
                        {
                            Response.Redirect("exam.aspx");
                        }
                        else
                        {
                            txt_examname.Focus();
                            panel_addexam_warning.Visible = true;
                            lbl_examaddwarning.Text = "Try again. Subject is not added";
                        }
                    }
                    catch (Exception ex)
                    {
                        txt_examname.Focus();
                        panel_addexam_warning.Visible = true;
                        lbl_examaddwarning.Text = "Something went wrong. Subject is not added </br>" + ex.Message;
                    }
                }
            }
            else
            {
                txt_examname.Focus();
                panel_addexam_warning.Visible = true;
                lbl_examaddwarning.Text = "You must fill all the requirements";
            }

        }

        protected void grdview_examlist_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "deleteexam")
            {
                deleteexam(Convert.ToInt32(e.CommandArgument));
                getexamList();
            }
        }

        protected void grdview_examlist_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdview_examlist.PageIndex = e.NewPageIndex;
            getexamList();
        }

        public void get_categorydrp()
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("select * from category", con);
                try
                {
                    con.Open();
                    drp_categoryexam.DataSource = cmd.ExecuteReader();
                    drp_categoryexam.DataBind();
                    ListItem li = new ListItem("Select category", "-1");
                    drp_categoryexam.Items.Insert(0, li);
                }
                catch (Exception ex)
                {
                    txt_examname.Focus();
                    panel_addexam_warning.Visible = true;
                    lbl_examaddwarning.Text = "Something went wrong. Try again </br>" + ex.Message;
                }
            }
        }

        public void get_subjectdrp()
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("select subject_id, subject_name from subject", con);
                try
                {
                    con.Open();
                    drp_subjectexam.DataSource = cmd.ExecuteReader();
                    drp_subjectexam.DataBind();
                    ListItem li = new ListItem("Select subject", "-1");
                    drp_subjectexam.Items.Insert(0, li);
                }
                catch (Exception ex)
                {
                    txt_examname.Focus();
                    panel_addexam_warning.Visible = true;
                    lbl_examaddwarning.Text = "Something went wrong. Try again </br>" + ex.Message;
                }
            }
        }

        public void getexamList()
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("spExamList", con);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    using (SqlDataAdapter ad = new SqlDataAdapter())
                    {
                        ad.SelectCommand = cmd;
                        using (DataTable dtatble = new DataTable())
                        {
                            ad.Fill(dtatble);
                            grdview_examlist.DataSource = dtatble;
                            grdview_examlist.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                    panel_examlist_warning.Visible = true;
                    lbl_examlistwarning.Text = "Something went wrong </br>" + ex.Message;
                }
            }
        }

        public void deleteexam(int id)
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("delete exam where exam_id = @examid", con);
                cmd.Parameters.AddWithValue("@examid", id);
                try
                {
                    con.Open();
                    int i = (int)cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Response.Redirect("exam.aspx");
                        Response.Write("Delete Succesfully");
                    }
                    else
                    {
                        panel_examlist_warning.Visible = true;
                        lbl_examlistwarning.Text = "Something went wrong. Can't delete now";
                    }
                }
                catch (Exception ex)
                {
                    panel_examlist_warning.Visible = true;
                    lbl_examlistwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }

            }
        }
    }
}