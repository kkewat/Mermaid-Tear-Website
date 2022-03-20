using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Add_Categories : System.Web.UI.Page
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindRepeaterCategory();
        }
        
    }

    private void BindRepeaterCategory()
    {
        SqlConnection con = new SqlConnection(Connection);
        using (SqlCommand cmd = new SqlCommand("Select * from Category", con))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                CatRepeater.DataSource = dt;
                CatRepeater.DataBind();
            }
        }
    }

    protected void AddCategories_Click(object sender, EventArgs e)
    {
        string Name = Catname.Text;
        SqlConnection con = new SqlConnection(Connection);
        
            SqlCommand cmd = new SqlCommand(@"INSERT INTO Category
           ([Category_Name])
     VALUES
           ('"+Name+"')",con);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

        BindRepeaterCategory();
        Catname.Text = null;
    }
    protected void Delete_Click(object sender, EventArgs e)
    {
        RepeaterItem row = (sender as LinkButton).Parent as RepeaterItem;
        Label bid = ((Label)row.FindControl("id")) as Label;
        using (SqlConnection con = new SqlConnection(Connection))
        {
            using (SqlCommand cmd = new SqlCommand(" delete from category Where Category_id = '" + bid.Text + "' ", con))
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Response.Write("<Script>alert('Category Deleted Successfully')</Script>");
            }
        }
        BindRepeaterCategory();
    }
}