using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Add_Brand : System.Web.UI.Page
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindRepeaterBrand();
        }
    }

    private void BindRepeaterBrand()
    {
        SqlConnection con = new SqlConnection(Connection);
        using (SqlCommand cmd = new SqlCommand("Select * from Brand", con))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                BrandRepeater.DataSource = dt;
                BrandRepeater.DataBind();
            }
        }
    }

    protected void AddBrand_Click(object sender, EventArgs e)
    {
        if (Brandname.Text != null)
        {
            string Name = Brandname.Text;
            SqlConnection con = new SqlConnection(Connection);
            SqlCommand cmd = new SqlCommand(@"INSERT INTO Brand
            ([Brand_name]) 
            VALUES
            ('" + Name + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('Brand Added Successfully')</script>");
            Brandname.Text = string.Empty;
            con.Close();
            //Brandname.Focus();

            BindRepeaterBrand();
        }
        else
        {
            Label2.Text = "<b>Please Enter Brand Name</b>";
        }
    }

    protected void DeleteBrand_Click(object sender, EventArgs e)
    {
        RepeaterItem row = (sender as LinkButton).Parent as RepeaterItem;
        Label bid = ((Label)row.FindControl("id"))as Label;
        using (SqlConnection con = new SqlConnection(Connection))
        {
            using (SqlCommand cmd = new SqlCommand(" delete from Brand Where Brand_id = '"+bid.Text+"' ",con))
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Response.Write("<Script>alert('Brand Deleted Successfully')</Script>");
            }
        }
        BindRepeaterBrand();
    }
}