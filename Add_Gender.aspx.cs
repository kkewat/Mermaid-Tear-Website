using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Add_Gender : System.Web.UI.Page
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGenderRepeater();

        }
    }
    protected void Delete_Click(object sender, EventArgs e)
    {
        try
        {
            RepeaterItem row = (sender as LinkButton).Parent as RepeaterItem;
            Label bid = ((Label)row.FindControl("id")) as Label;
            using (SqlConnection con = new SqlConnection(Connection))
            {
                using (SqlCommand cmd = new SqlCommand(" delete from Gender Where Gender_id = '" + bid.Text + "' ", con))
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    Response.Write("<Script>alert('Row Deleted Successfully')</Script>");
                }
            }
            BindGenderRepeater();
        }
        catch(Exception ex)
        {
            Response.Redirect("error.aspx");
        }
    }
    private void BindGenderRepeater()
    {
        try
        {
            SqlConnection con = new SqlConnection(Connection);
            using (SqlCommand cmd = new SqlCommand("Select * from Gender", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    GenderRepeater.DataSource = dt;
                    GenderRepeater.DataBind();
                }
            }
        }
        catch(Exception ex)
        {
            Response.Redirect("error.aspx");
        }
    }

    protected void AddGender_Click(object sender, EventArgs e)
    {
        try {
            if (Gendername.Text != null)
            {
                string Name = Gendername.Text;
                SqlConnection con = new SqlConnection(Connection);

                SqlCommand cmd = new SqlCommand(@"INSERT INTO Gender
               ([Gender_Name])
         VALUES
               ('" + Name + "')", con);

                con.Open();
                cmd.ExecuteNonQuery();
                Response.Write(Label2.Text = "Gender " + Name + " Added Successfully");
                Gendername.Text = string.Empty;
                con.Close();
                Gendername.Text = null;
                BindGenderRepeater();
            }
            else
            {
                err.Text = "*Enter the Gender Name";
            }
        }
        catch(Exception ex)
        {
            Response.Redirect("error.aspx");
        }
    }
}