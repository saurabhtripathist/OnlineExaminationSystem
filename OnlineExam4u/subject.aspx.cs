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
    public partial class WebForm22 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                panel_subjectlist.Visible = true;
                panel_addsubject.Visible = false;
                getSubjectList();
            }
        }
            protected void btn_panelsubjectlist_Click(object sender, EventArgs e)
            {
                panel_subjectlist.Visible = true;
                panel_addsubject.Visible = false;
                getSubjectList();
            }

            protected void btn_paneladdSubject_Click(object sender, EventArgs e)
            {
                panel_subjectlist.Visible = false;
                panel_addsubject.Visible = true;
                get_categorydrp();
            }
        

        protected void btn_addsubject_Click(object sender, EventArgs e)
        {

            if (IsValid)
            {
                SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
                {
                    SqlCommand cmd = new SqlCommand("insert into subject (subject_name, category_fid) values (@subject_name,@category_fid)", con);
                    cmd.Parameters.AddWithValue("@subject_name", txt_subject.Text);
                    cmd.Parameters.AddWithValue("@category_fid", drp_category.SelectedValue);
                    try
                    {
                        con.Open();
                        int i = cmd.ExecuteNonQuery();
                        if (i > 0)
                        {
                            Response.Redirect("subject.aspx");
                        }
                        else
                        {
                            txt_subject.Focus();
                            panel_addsubject_warning.Visible = true;
                            lbl_addsubject_warning.Text = "Try again. Subject is not added";
                        }
                    }
                    catch (Exception ex)
                    {
                        txt_subject.Focus();
                        panel_addsubject_warning.Visible = true;
                        lbl_addsubject_warning.Text = "Something went wrong. Subject is not added </br>" + ex.Message;
                    }
                }
            }
            else
            {
                txt_subject.Focus();
                panel_addsubject_warning.Visible = true;
                lbl_addsubject_warning.Text = "You must fill all the requirements";
            }


        }
        protected void grdview_subjectlist_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteRow")
            {
                deletesubject(Convert.ToInt32(e.CommandArgument));
                getSubjectList();
            }

        }
        protected void grdview_subjectlist_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdview_subjectlist.PageIndex = e.NewPageIndex;
            getSubjectList();
        }

        public void get_categorydrp()
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("select * from category", con);
                try
                {
                    con.Open();
                    drp_category.DataSource = cmd.ExecuteReader();
                    drp_category.DataBind();
                    ListItem li = new ListItem("Select category", "-1");
                    drp_category.Items.Insert(0, li);
                }
                catch (Exception ex)
                {
                    txt_subject.Focus();
                    panel_addsubject_warning.Visible = true;
                    lbl_addsubject_warning.Text = "Something went wrong. Try again </br>" + ex.Message;
                }
            }
        }

        public void getSubjectList()
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("spSubjectList", con);
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
                            grdview_subjectlist.DataSource = dtatble;
                            grdview_subjectlist.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                    panel_subjectlist_warning.Visible = true;
                    lbl_subjectlistwarning.Text = "Something went wrong </br>" + ex.Message;
                }
            }
        }

        public void deletesubject(int id)
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("delete subject where subject_id = @subjectid", con);
                cmd.Parameters.AddWithValue("@subjectid", id);
                try
                {
                    con.Open();
                    int i = (int)cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Response.Redirect("subject.aspx");
                        Response.Write("Delete Succesfully");
                    }
                    else
                    {
                        panel_subjectlist_warning.Visible = true;
                        lbl_subjectlistwarning.Text = "Something went wrong. Can't delete now";
                    }
                }
                catch (Exception ex)
                {
                    panel_subjectlist_warning.Visible = true;
                    lbl_subjectlistwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }

            }
        }
    }
}