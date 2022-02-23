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
                BindProductDetail();
            }
            else
            {
                Response.Write("<script>alert('Login To Add Product To Cart')</script>");
             }
        }
    }
    private void BindProductDetail()
    {
        String Name = Session["Username"].ToString();
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



    protected void increment_Click(object sender, EventArgs e)
    {
        RepeaterItem row = (sender as LinkButton).Parent as RepeaterItem;
        Label Cid = ((Label)row.FindControl("id")) as Label;
        using (SqlConnection con = new SqlConnection(Connection))
        {
            using (SqlCommand cmd = new SqlCommand("UPDATE Cart SET Quantity = Quantity + 1 where Cart_id ='"+ Cid.Text +"' ", con))
            {
                con.Open();
                cmd.ExecuteNonQuery();
                BindProductDetail();
            }
        }
        
    }

    protected void decrement_Click(object sender, EventArgs e)
    {
        RepeaterItem row = (sender as LinkButton).Parent as RepeaterItem;
        Label Cid = ((Label)row.FindControl("id")) as Label;
        using (SqlConnection con = new SqlConnection(Connection))
        {
            using (SqlCommand cmd = new SqlCommand("UPDATE Cart SET Quantity = Quantity - 1 where Cart_id ='" + Cid.Text + "' ", con))
            {
                con.Open();
                cmd.ExecuteNonQuery();
                BindProductDetail();
            }
        }
    }

    protected void del_Click(object sender, EventArgs e)
    {
        RepeaterItem row = (sender as LinkButton).Parent as RepeaterItem;
        Label Cid = ((Label)row.FindControl("id1")) as Label;
        using (SqlConnection con = new SqlConnection(Connection))
        {
            using (SqlCommand cmd = new SqlCommand(" delete from Cart Where Cart_id = '" + Cid.Text + "' ", con))
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Response.Write("<Script>alert('Brand Deleted Successfully')</Script>");
            }
        }
        BindProductDetail();
    }
}