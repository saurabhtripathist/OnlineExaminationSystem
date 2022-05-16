﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace Online_Examination_System
{
    public partial class WebForm15 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sid = Request.QueryString["sid"];
                if (sid == null)
                {
                    Response.Redirect("subject.aspx");
                }
                txt_subjectedit.Focus();
                get_categorydrp();
                categoryedit_fill(Convert.ToInt32(sid));
            }
               
        }

        protected void btn_editsubject_Click(object sender, EventArgs e)
        {
            string sid = Request.QueryString["sid"];
            if (IsValid)
            {
                SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
                {
                    SqlCommand cmd = new SqlCommand("spSubjectedit", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@subject_id", Convert.ToInt32(sid));
                    cmd.Parameters.AddWithValue("@subject_name", txt_subjectedit.Text);  
                    cmd.Parameters.AddWithValue("@category_id", drp_categoryedit.SelectedValue);
                    try
                    {
                        con.Open();
                        int i = (int)cmd.ExecuteNonQuery();
                        if (i > 0)
                        {
                            Response.Redirect("subject.aspx");
                        }
                        else
                        {
                            txt_subjectedit.Focus();
                            panel_editsubject_warning.Visible = true;
                            lbl_editsubject_warning.Text = "Something went wrong. Can't update. Please try after sometime later</br> ";
                        }
                    }
                    catch (Exception ex)
                    {
                        txt_subjectedit.Focus();
                        panel_editsubject_warning.Visible = true;
                        lbl_editsubject_warning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                    }
                }
            }
            else
            {
                txt_subjectedit.Focus();
                panel_editsubject_warning.Visible = true;
                lbl_editsubject_warning.Text = "You must fill all the requirements";
            }
        }
        public void categoryedit_fill(int id)
        {

            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("spSubjecteditfill", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
                try
                {
                    con.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    while (rd.Read())
                    {
                        txt_subjectedit.Text = rd["subject_name"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    panel_editsubject_warning.Visible = true;
                    lbl_editsubject_warning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }
            }
        }
        public void get_categorydrp()
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("select * from category", con);
                try
                {
                    con.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    drp_categoryedit.DataSource = rd;
                    drp_categoryedit.DataBind();
                    ListItem li = new ListItem("Select category", "-1");
                    drp_categoryedit.Items.Insert(0, li);

                }
                catch (Exception ex)
                {
                    txt_subjectedit.Focus();
                    panel_editsubject_warning.Visible = true;
                    lbl_editsubject_warning.Text = "Something went wrong. Try again </br>" + ex.Message;
                }
            }
        }
    }

}
