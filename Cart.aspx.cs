using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cart : System.Web.UI.Page
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if (Session["Username"] != null)
            {
                String name = Session["Username"].ToString();
                BindProductDetail(name);
            }
            else
            {
                Response.Write("<script>alert('Login To Add Product To Cart')</script>");
             }
        }
    }
    private void BindProductDetail(String Name)
    {
        using (SqlConnection con = new SqlConnection(Connection))
        {
            using (SqlCommand cmd = new SqlCommand("Select * from Cart Where User_Name='" + Name + "'", con))
            {
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    CartDatarptr.DataSource = dt;
                    CartDatarptr.DataBind();
                }
            }
        }
    }

}