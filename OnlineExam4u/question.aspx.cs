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
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie usercookie = Request.Cookies["user_cookies"];
            if (Session["Useremail"] != null || usercookie != null)
            {
                if (Session["Useremail"] == null)
                {
                    getstringuser.Text = usercookie["Useremail"];
                }
                else
                {
                    getstringuser.Text = Session["Useremail"].ToString();
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }

            if (!IsPostBack)
            {
                string eid = Request.QueryString["eid"];
                if (eid == null)
                {
                    Response.Redirect("index.aspx");
                }
                questionistmethod(Convert.ToInt32(eid));
            }
        }

        public void questionistmethod(int id)
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("spQuestionsearchexam", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@examid", id);
                try
                {
                    con.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    if (rd.HasRows)
                    {
                        gridview_examquestion.DataSource = rd;
                        gridview_examquestion.DataBind();
                    }
                    else
                    {
                        panel_questshow_warning.Visible = true;
                        lbl_questshowwarning.Text = "Sorry! There is no question in this exam";
                    }
                }
                catch (Exception ex)
                {
                    panel_questshow_warning.Visible = true;
                    lbl_questshowwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }
            }
        }

        string result = string.Empty;
        int select_number = 0;
        int correct_number = 0;
        int wrong_number = 0;
        int count = 0;
        protected void btn_submit_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gridview_examquestion.Rows)
            {
                Label li = row.FindControl("lblid") as Label;
                RadioButton r1 = row.FindControl("option_one") as RadioButton;
                RadioButton r2 = row.FindControl("option_two") as RadioButton;
                RadioButton r3 = row.FindControl("option_three") as RadioButton;
                RadioButton r4 = row.FindControl("option_four") as RadioButton;

                if (r1.Checked == true)
                {
                    select_number = 1;
                }
                else if (r2.Checked == true)
                {
                    select_number = 2;
                }
                else if (r3.Checked == true)
                {
                    select_number = 3;
                }
                else if (r4.Checked == true)
                {
                    select_number = 4;
                }

                checkanwer(li.Text);
                panel_questshow_warning.Visible = false;
            }
            saveinresult(passfail(), correct_number, gridview_examquestion.Rows.Count);

        }

        public void checkanwer(string qid)
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand();

                cmd.CommandText = "select * from question where question_id = @questionid" + count;
                cmd.Parameters.AddWithValue("@questionid" + count, qid);
                cmd.Connection = con;

                try
                {
                    con.Open();
                    SqlDataReader rd = cmd.ExecuteReader();
                    while (rd.Read())
                    {
                        if (select_number == Convert.ToInt32(rd["question_answer"]))
                        {

                            correct_number = correct_number + 1;
                            break;
                        }
                        else
                        {
                            wrong_number = wrong_number + 1;
                            break;
                        }
                    }
                    count++;

                }
                catch (Exception ex)
                {
                    panel_questshow_warning.Visible = true;
                    lbl_questshowwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }
            }
        }

        public string passfail()
        {
            string eid = Request.QueryString["eid"];
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("Select exampass_marks from exam where exam_id = @examid", con);
                cmd.Parameters.AddWithValue("@examid", eid);
                con.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    if (correct_number >= Convert.ToInt32(rd["exampass_marks"]))
                    {

                        result = result + "Pass";   
                        break;
                    }
                    else
                    {
                        result = result + "Fail";
                        break;
                    }
                }
            }
            return result;
        }

        public void saveinresult(string status, int score, int tquestion)
        {
            string eid = Request.QueryString["eid"];
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("[spInsertResult]", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@examfid", eid);
                cmd.Parameters.AddWithValue("@resultstatus", status);
                cmd.Parameters.AddWithValue("@resultscore", score);
                cmd.Parameters.AddWithValue("@totalquestion", tquestion);
                cmd.Parameters.AddWithValue("@username", getstringuser.Text);
               
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    Response.Redirect("result.aspx");
                }
                catch (Exception ex)
                {
                    panel_questshow_warning.Visible = true;
                    lbl_questshowwarning.Text = "Something went wrong. Please try after sometime later Contact you developer for this problem" + ex.Message;
                }
            }
        }
    }
}

