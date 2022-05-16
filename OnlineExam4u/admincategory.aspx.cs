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
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                panel_categorylist.Visible = true;
                panel_addcategory.Visible = false;
                categorylistmethod();
            }
        }

        protected void btn_panelcategorylist_Click(object sender, EventArgs e)
        {
            panel_categorylist.Visible = true;
            panel_addcategory.Visible = false;
            categorylistmethod();
        }

        protected void btn_paneladdcategory_Click(object sender, EventArgs e)
        {
            txt_category.Focus();
            panel_categorylist.Visible = false;
            panel_addcategory.Visible = true;
        }
        protected void btn_addcategory_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {

                SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
                {
                    SqlCommand cmd = new SqlCommand("insert into category (category_name) values (@category_name)", con);
                    cmd.Parameters.AddWithValue("@category_name", txt_category.Text);
                    try
                    {
                        con.Open();
                        int i = (int)cmd.ExecuteNonQuery();
                        if (i > 0)
                        {
                            txt_category.Text = string.Empty;
                            Response.Redirect("admincategory.aspx");
                            Response.Write("Added Succesfully");
                        }
                        else
                        {
                            txt_category.Focus();
                            panel_addcategory_warning.Visible = true;
                            lbl_categoryaddwarning.Text = "Something went wrong";
                        }
                    }
                    catch (Exception ex)
                    {
                        txt_category.Focus();
                        panel_addcategory_warning.Visible = true;
                        lbl_categoryaddwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                    }

                }
            }
            else
            {
                txt_category.Focus();
                panel_addcategory_warning.Visible = true;
                lbl_categoryaddwarning.Text = "You must fill all the requirements";
            }

        }

        protected void grdview_categorylist_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "delete_category")
            {
                deletecategory(Convert.ToInt32(e.CommandArgument));
                categorylistmethod();
            }
        }

        protected void grdview_categorylist_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdview_categorylist.PageIndex = e.NewPageIndex;
            categorylistmethod();
        }

        public void categorylistmethod()
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("select * from category", con);
                try
                {
                    con.Open();
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {

                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            grdview_categorylist.DataSource = dt;
                            grdview_categorylist.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                    panel_categorylist_warning.Visible = true;
                    lbl_categorylistwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }
            }
        }
        public void deletecategory(int id)
        {
            SqlConnection con = new SqlConnection("data source=(localdb)\\ProjectsV13;database=OnlineExaminationSystem;integrated security=true");
            {
                SqlCommand cmd = new SqlCommand("delete category  where category_id = @catgeryid", con);
                cmd.Parameters.AddWithValue("@catgeryid", id);
                try
                {
                    con.Open();
                    int i = (int)cmd.ExecuteNonQuery();
                    if (i > 0)
                    {
                        Response.Redirect("admincategory.aspx");
                        Response.Write("Delete Succesfully");
                    }
                    else
                    {
                        panel_categorylist_warning.Visible = true;
                        lbl_categorylistwarning.Text = "Something went wrong. Can't delete now";
                    }
                }
                catch (Exception ex)
                {
                    panel_categorylist_warning.Visible = true;
                    lbl_categorylistwarning.Text = "Something went wrong. Please try after sometime later</br> Contact you developer for this problem" + ex.Message;
                }

            }
        }
    }
}