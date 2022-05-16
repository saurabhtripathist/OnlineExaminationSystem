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
    public partial class WebForm20 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string uemail = Request.QueryString["uid"];
            if (!IsPostBack)
            {
                if (uemail != null)
                {
                    getspecificresults(uemail);
                    gridviewspecific.Visible = true;
                    gridresult.Visible = false;
                }
                else
                {
                    getallresults();
                    gridviewspecific.Visible = false;
                    gridresult.Visible = true;
                }

            }
        }

        public void getallresults()
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("select * from result left join exam on result.exam_fid = exam.exam_id", con);
                try
                {
                    con.Open();
                    using (SqlDataAdapter ad = new SqlDataAdapter())
                    {
                        ad.SelectCommand = cmd;
                        using (DataTable tb = new DataTable())
                        {
                            ad.Fill(tb);
                            if (tb != null)
                            {
                                gridresult.DataSource = tb;
                                gridresult.DataBind();
                            }
                            else
                            {
                                panel_resultshow_warning.Visible = true;
                                lbl_resultshowwarning.Text = "There is no result right now in this application";
                            }
                        }
                    }

                }
                catch (Exception ex)
                {
                    panel_resultshow_warning.Visible = true;
                    lbl_resultshowwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }
            }
        }
        public void getspecificresults(string email)
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("select * from result left join exam on result.exam_fid = exam.exam_id where user_email = @uemail", con);
                cmd.Parameters.AddWithValue("@uemail", email);
                try
                {
                    con.Open();
                    using (SqlDataAdapter ad = new SqlDataAdapter())
                    {
                        ad.SelectCommand = cmd;
                        using (DataTable tb = new DataTable())
                        {
                            ad.Fill(tb);
                            if (tb != null)
                            {
                                gridviewspecific.DataSource = tb;
                                gridviewspecific.DataBind();
                            }
                            else
                            {
                                panel_resultshow_warning.Visible = true;
                                lbl_resultshowwarning.Text = "There is no result right now in this application";
                            }
                        }
                    }

                }
                catch (Exception ex)
                {
                    panel_resultshow_warning.Visible = true;
                    lbl_resultshowwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }
            }
        }


        protected void gridresult_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridresult.PageIndex = e.NewPageIndex;
            getallresults();
            gridviewspecific.Visible = false;
            gridresult.Visible = true;

        }

        protected void gridviewspecific_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            string uemail = Request.QueryString["uid"];
            gridviewspecific.PageIndex = e.NewPageIndex;
            getspecificresults(uemail);
            gridviewspecific.Visible = true;
            gridresult.Visible = false;
        }
    }
}