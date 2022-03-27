using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Add_Subcategory : System.Web.UI.Page
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            MainCategoryList();
            BindSubCategoryRepeater();
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
                using (SqlCommand cmd = new SqlCommand(" delete from Sub_Category Where Sub_Category_id = '" + bid.Text + "' ", con))
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    Response.Write("<Script>alert('Row Deleted Successfully')</Script>");
                }
            }
            BindSubCategoryRepeater();
        }
        catch (Exception ex)
        {
            Response.Redirect("error.aspx");
        }
    }
    private void BindSubCategoryRepeater()
    {
        try
        {
            SqlConnection con = new SqlConnection(Connection);
            using (SqlCommand cmd = new SqlCommand("Select A.*,B.* from Sub_Category A inner join Category B on B.Category_id =A.Main_Category_id", con))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    SubCatRepeater.DataSource = dt;
                    SubCatRepeater.DataBind();
                }
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("error.aspx");
        }
    }

    private void MainCategoryList()
    {
        try
        {
            SqlConnection con = new SqlConnection(Connection);
            SqlCommand cmd = new SqlCommand("Select * from Category", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                MainCat.DataSource = dt;
                MainCat.DataTextField = "Category_Name";
                MainCat.DataValueField = "category_id";
                MainCat.DataBind();
                MainCat.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("error.aspx");
        }
    }

    protected void SubCategory_Click(object sender, EventArgs e)
    {
        try
        {
            string Name = SubCat.Text;
            SqlConnection con = new SqlConnection(Connection);
            SqlCommand cmd = new SqlCommand(@"INSERT INTO Sub_Category
           ([SubCategory_Name]
           ,[Main_Category_id])
     VALUES
            ('" + Name + "','" + MainCat.SelectedItem.Value + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();

            Response.Write(Label2.Text = "Sub-Category " + Name + " Added Successfully");
            SubCat.Text = string.Empty;
            con.Close();
            MainCat.ClearSelection();
            MainCat.Items.FindByValue("0").Selected = true;

            BindSubCategoryRepeater();
        }
        catch (Exception ex)
        {
            Response.Redirect("error.aspx");
        }
    }
}