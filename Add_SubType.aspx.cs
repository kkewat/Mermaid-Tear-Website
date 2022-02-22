using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Add_SubType : System.Web.UI.Page
{
    String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MainTypeList();
            BindSubTypeRepeater();
        }
    }

    private void BindSubTypeRepeater()
    {
        SqlConnection con = new SqlConnection(Connection);
        using (SqlCommand cmd = new SqlCommand("Select A.*,B.* from Product_SubType A inner join Product_Type B on B.ProductType_id =A.ProductType_id", con))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                SubTypeRepeater.DataSource = dt;
                SubTypeRepeater.DataBind();
            }
        }
    }

    private void MainTypeList()
    {
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmd = new SqlCommand("Select * from Product_Type", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        if (dt.Rows.Count != 0)
        {
            Maintype.DataSource = dt;
            Maintype.DataTextField = "Product_Type_Name";
            Maintype.DataValueField = "ProductType_id";
            Maintype.DataBind();
            Maintype.Items.Insert(0, new ListItem("--Select--", "0"));
        }
    }

    protected void SubTypebut_Click(object sender, EventArgs e)
    {
        string Name = SubType.Text;
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmd = new SqlCommand(@"INSERT INTO Product_SubType
           ([Product_Subtype_name]
           ,[ProductType_id])
     VALUES
            ('" + Name + "','" + Maintype.SelectedItem.Value + "')", con);
        con.Open();
        cmd.ExecuteNonQuery();

        Response.Write(Label2.Text = "Sub-Type " + Name + " Added Successfully");
        SubType.Text = string.Empty;
        con.Close();
        Maintype.ClearSelection();
        Maintype.Items.FindByValue("0").Selected = true;

        BindSubTypeRepeater();
    }
    protected void Delete_Click(object sender, EventArgs e)
    {
        RepeaterItem row = (sender as LinkButton).Parent as RepeaterItem;
        Label bid = ((Label)row.FindControl("id")) as Label;
        using (SqlConnection con = new SqlConnection(Connection))
        {
            using (SqlCommand cmd = new SqlCommand(" delete from Product_SubType Where Product_SubType_id = '" + bid.Text + "' ", con))
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Response.Write("<Script>alert('Row Deleted Successfully')</Script>");
            }
        }
        BindSubTypeRepeater();
    }
}