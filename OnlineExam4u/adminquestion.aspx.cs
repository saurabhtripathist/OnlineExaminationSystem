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
    public partial class WebForm19 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getallquestion();
        }

        protected void gridview_examquestion_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridview_examquestion.PageIndex = e.NewPageIndex;
            getallquestion();
        }

        public void getallquestion()
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("spgetallquestion", con);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    using (SqlDataAdapter ad = new SqlDataAdapter())
                    {
                        ad.SelectCommand = cmd;
                        using (DataTable tb = new DataTable())
                        {
                            ad.Fill(tb);
                            gridview_examquestion.DataSource = tb;
                            gridview_examquestion.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                    panel_examquestion_warning.Visible = true;
                    lbl_examquestionwarning.Text = "Something went wrong. Pleas contact your provider </br>" + ex.Message;
                }

            }
        }

        public void deletequestion(int id)
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("delete question where question_id = @questionid", con);
                cmd.Parameters.AddWithValue("@questionid", id);
                try
                {
                    con.Open();
                    int i = (int)cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Response.Redirect("question.aspx");
                        Response.Write("Delete Succesfully");
                    }
                    else
                    {
                        panel_examquestion_warning.Visible = true;
                        lbl_examquestionwarning.Text = "Something went wrong. Can't delete now";
                    }
                }
                catch (Exception ex)
                {
                    panel_examquestion_warning.Visible = true;
                    lbl_examquestionwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }

            }
        }

        protected void gridview_examquestion_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "deletequestion")
            {
                deletequestion(Convert.ToInt32(e.CommandArgument));
            }
        }
    }
}