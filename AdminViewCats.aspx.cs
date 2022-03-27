using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminViewCats : System.Web.UI.Page
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindProdViewRepeater();
        }
    }

    private void BindProdViewRepeater()
    {
        try
        {
            string Cat, search, p_search;
            Cat = Request.QueryString["searchCat"];
            search = Request.QueryString["searchProduct"];
            p_search = "%" + search + "%";
            if (Cat != null)
            {
                using (SqlConnection con = new SqlConnection(Connection))
                {
                    SqlCommand cmd = new SqlCommand("Cat_Search", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@CategoryName", Cat);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        ViewRepeater.DataSource = dt;
                        ViewRepeater.DataBind();
                    }
                }
            }
            else if (search != null)
            {
                using (SqlConnection con = new SqlConnection(Connection))
                {
                    SqlCommand cmd1 = new SqlCommand("Pro_Search", con);
                    cmd1.CommandType = CommandType.StoredProcedure;
                    cmd1.Parameters.AddWithValue("@ProName", p_search);
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd1))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        ViewRepeater.DataSource = dt;
                        ViewRepeater.DataBind();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("error.aspx");
        }
    }
}