using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Add_ProductType : System.Web.UI.Page
{
    String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindRepeaterType();
        }
    }

    private void BindRepeaterType()
    {
        SqlConnection con = new SqlConnection(Connection);
        using (SqlCommand cmd = new SqlCommand("Select * from Product_Type", con))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                PTypeRepeater.DataSource = dt;
                PTypeRepeater.DataBind();
            }
        }
    }

    protected void AddPType_Click(object sender, EventArgs e)
    {
        string Name = PType.Text;
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmd = new SqlCommand(@"INSERT INTO Product_Type
            ([Product_Type_Name]) 
            VALUES
            ('" + Name + "')", con);
        con.Open();
        cmd.ExecuteNonQuery();

        Response.Write(Label2.Text = "Product Type " + Name + " Added Successfully");
        PType.Text = string.Empty;
        con.Close();
        //Brandname.Focus();
        BindRepeaterType();
    }
    protected void Delete_Click(object sender, EventArgs e)
    {
        RepeaterItem row = (sender as LinkButton).Parent as RepeaterItem;
        Label bid = ((Label)row.FindControl("id")) as Label;
        using (SqlConnection con = new SqlConnection(Connection))
        {
            using (SqlCommand cmd = new SqlCommand(" delete from Product_Type Where ProductType_id = '" + bid.Text + "' ", con))
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Response.Write("<Script>alert('Row Deleted Successfully')</Script>");
            }
        }
        BindRepeaterType();
    }
}