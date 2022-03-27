using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Add_Size : System.Web.UI.Page
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try {
                Bindcategory();
                BindBrand();
                BindGender();
                BindType();
                BindSizeRepeater();
                SubCat.Enabled = false;
                SubType.Enabled = false;
            }
            catch(Exception ex)
            {
                Response.Redirect("error.aspx");
            }
        }
    }

    private void BindSizeRepeater()
    {
        SqlConnection con = new SqlConnection(Connection);
        using (SqlCommand cmd = new SqlCommand("Select A.*,B.*,C.*,D.*,E.*,F.*,G.* from Product_Size A inner join Category B on B.Category_id =A.category_id inner join Brand C on C.Brand_id=A.Brand_id inner join Sub_Category D on D.Sub_Category_id=A.subCategory_id inner join Gender E on E.Gender_id=A.Gender_id inner join Product_Type F on F.ProductType_id=A.productType_id inner join Product_SubType G on G.Product_SubType_id=A.product_SubType_id ", con))
        {
            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
            {
                DataTable dt = new DataTable();
                sda.Fill(dt);
                SizeRepeater.DataSource = dt;
                SizeRepeater.DataBind();
            }
        }
    }

    private void BindType()
    {
        using (SqlConnection con = new SqlConnection(Connection))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from Product_Type", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                Type.DataSource = dt;
                Type.DataTextField = "Product_Type_Name";
                Type.DataValueField = "ProductType_id";
                Type.DataBind();
                Type.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }
    }

    private void BindGender()
    {
        using (SqlConnection con = new SqlConnection(Connection))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from Gender", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                Gender.DataSource = dt;
                Gender.DataTextField = "Gender_Name";
                Gender.DataValueField = "Gender_id";
                Gender.DataBind();
                Gender.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }
    }

    private void Bindcategory()
    {
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmd = new SqlCommand("Select * from Category", con);
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);
        if (dt.Rows.Count != 0)
        {
            Category.DataSource = dt;
            Category.DataTextField = "Category_Name";
            Category.DataValueField = "category_id";
            Category.DataBind();
            Category.Items.Insert(0, new ListItem("--Select--", "0"));
        }
    }

    private void BindBrand()
    {
        using (SqlConnection con = new SqlConnection(Connection))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from Brand", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                brand.DataSource = dt;
                brand.DataTextField = "Brand_name";
                brand.DataValueField = "Brand_id";
                brand.DataBind();
                brand.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }
    }

    protected void Category_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (Category.SelectedIndex != 0)
            {
                SubCat.Enabled = true;
            }
            else
            {
                SubCat.Enabled = false;
            }
            int catId = Convert.ToInt32(Category.SelectedItem.Value);
            using (SqlConnection con = new SqlConnection(Connection))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from Sub_Category where Main_Category_id='" + Category.SelectedItem.Value + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    SubCat.DataSource = dt;
                    SubCat.DataTextField = "SubCategory_Name";
                    SubCat.DataValueField = "Sub_Category_id";
                    SubCat.DataBind();
                    SubCat.Items.Insert(0, new ListItem("--Select--", "0"));
                }
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("error.aspx");
        }
    }

    protected void Type_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            if (Type.SelectedIndex != 0)
            {
                SubType.Enabled = true;
            }
            else
            {
                SubType.Enabled = false;
            }
            int TypeId = Convert.ToInt32(Type.SelectedItem.Value);
            using (SqlConnection con = new SqlConnection(Connection))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from Product_SubType where ProductType_id='" + Type.SelectedItem.Value + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    SubType.DataSource = dt;
                    SubType.DataTextField = "Product_Subtype_name";
                    SubType.DataValueField = "Product_SubType_id";
                    SubType.DataBind();
                    SubType.Items.Insert(0, new ListItem("--Select--", "0"));
                }
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("error.aspx");
        }
    }

    protected void Size_enter_Click(object sender, EventArgs e)
    {
        try
        {
            string Name = Size.Text, bran = brand.SelectedItem.Value, cat = Category.SelectedItem.Value, scat = SubCat.SelectedItem.Value,
            Gen = Gender.SelectedItem.Value, typ = Type.SelectedItem.Value, stype = SubType.SelectedItem.Value;
            SqlConnection con = new SqlConnection(Connection);
            SqlCommand cmd = new SqlCommand(@"INSERT INTO [Gold_Shop].[dbo].[Product_Size]
            ([Size_Name]
           ,[Brand_id]
           ,[category_id]
           ,[subCategory_id]
           ,[Gender_id]
           ,[productType_id]
           ,[product_SubType_id]) 
            VALUES
            ('" + Name + "','" + bran + "','" + cat + "','" + scat + "','" + Gen + "','" + typ + "','" + stype + "')", con);
            con.Open();
            cmd.ExecuteNonQuery();

            Response.Write("<script>alert('Size added Successfully')</script>");
            Size.Text = string.Empty;
            con.Close();
            brand.ClearSelection();
            brand.Items.FindByValue("0").Selected = true;

            Category.ClearSelection();
            Category.Items.FindByValue("0").Selected = true;

            SubCat.ClearSelection();
            SubCat.Items.FindByValue("0").Selected = true;

            Gender.ClearSelection();
            Gender.Items.FindByValue("0").Selected = true;

            Type.ClearSelection();
            Type.Items.FindByValue("0").Selected = true;

            SubType.ClearSelection();
            SubType.Items.FindByValue("0").Selected = true;

            BindSizeRepeater();
        }
        catch (Exception ex)
        {
            Response.Redirect("error.aspx");
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
                using (SqlCommand cmd = new SqlCommand(" delete from Product_Size Where Size_id = '" + bid.Text + "' ", con))
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    Response.Write("<Script>alert('Row Deleted Successfully')</Script>");
                }
            }
            BindSizeRepeater();
        }
        catch (Exception ex)
        {
            Response.Redirect("error.aspx");
        }
    }
}