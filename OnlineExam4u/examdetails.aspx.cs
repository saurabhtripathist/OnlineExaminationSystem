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
    public partial class WebForm17 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string eid = Request.QueryString["eid"];
            if (!IsPostBack)
            {

                if (eid == null)
                {
                    Response.Redirect("exam.aspx");
                }

                getexam_details(Convert.ToInt32(eid));
            }
        }

        public void getexam_details(int id)
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("spExamListDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@exam_id", id);
                try
                {
                    con.Open();
                    exam_details.DataSource = cmd.ExecuteReader();
                    exam_details.DataBind();
                }
                catch (Exception ex)
                {
                    panel_examdetails_warning.Visible = true;
                    lbl_examdetailswarning.Text = "Something went wrong. Pleas contact your provider </br>" + ex.Message;
                }

            }
        }
    }
}