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
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string eid = Request.QueryString["eid"];
            if (!IsPostBack)
            {

                if (eid == null)
                {
                    Response.Redirect("examquestion.aspx");
                }
                getexamquestiondetails(Convert.ToInt32(eid));
            }
        }
        public void getexamquestiondetails(int id)
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("spExamquestion", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@examfid", id);
                try
                {
                    con.Open();
                    using (SqlDataAdapter ad = new SqlDataAdapter())
                    {
                        ad.SelectCommand = cmd;
                        using (DataTable tb = new DataTable())
                        {
                            ad.Fill(tb);
                            gridview_examdetails.DataSource = tb;
                            gridview_examdetails.DataBind();
                        }
                    }
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