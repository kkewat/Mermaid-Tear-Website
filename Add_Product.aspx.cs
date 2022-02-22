﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Add_Product : System.Web.UI.Page
{
    public static String Connection = "Data Source=DESKTOP-SGG9TB4;Initial Catalog=Gold_Shop;Integrated Security=True";
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack) {
            BindBrand();
            BindCategory();
            Sub_Category.Enabled = false;
            Bind_ProductType();
            Sub_type.Enabled = false;
            Bind_Gender();
            CheckBoxSize.Enabled = false;
            CheckBoxWeight.Enabled = false;
        }
    }

    private void Bind_Gender()
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

    private void Bind_ProductType()
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
                ProductType.DataSource = dt;
                ProductType.DataTextField = "Product_Type_Name";
                ProductType.DataValueField = "ProductType_id";
                ProductType.DataBind();
                ProductType.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }
    }

    private void BindCategory()
    {
        using (SqlConnection con = new SqlConnection(Connection))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from Category", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                Product_Category.DataSource = dt;
                Product_Category.DataTextField = "Category_Name";
                Product_Category.DataValueField = "Category_id";
                Product_Category.DataBind();
                Product_Category.Items.Insert(0, new ListItem("--Select--", "0"));
            }
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
            if(dt.Rows.Count != 0)
            {
                Product_Brand.DataSource = dt;
                Product_Brand.DataTextField = "Brand_name";
                Product_Brand.DataValueField = "Brand_id";
                Product_Brand.DataBind();
                Product_Brand.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }
    }

    protected void Product_Category_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(Product_Category.SelectedIndex !=0)
        {
            Sub_Category.Enabled = true;
        }
        else
        {
            Sub_Category.Enabled = false;
        }
        int catId = Convert.ToInt32(Product_Category.SelectedItem.Value);
        using (SqlConnection con = new SqlConnection(Connection))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from Sub_Category where Main_Category_id='"+Product_Category.SelectedItem.Value+"'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                Sub_Category.DataSource = dt;
                Sub_Category.DataTextField = "SubCategory_Name";
                Sub_Category.DataValueField = "Sub_Category_id";
                Sub_Category.DataBind();
                Sub_Category.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }
    }

    protected void Product_Type_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ProductType.SelectedIndex != 0)
        {
            Sub_type.Enabled = true;
        }
        else 
        {
            Sub_type.Enabled = false;
        }
        int TypeId = Convert.ToInt32(ProductType.SelectedItem.Value);
        using (SqlConnection con = new SqlConnection(Connection))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from Product_SubType where ProductType_id='" + ProductType.SelectedItem.Value + "'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                Sub_type.DataSource = dt;
                Sub_type.DataTextField = "Product_Subtype_name";
                Sub_type.DataValueField = "Product_SubType_id";
                Sub_type.DataBind();
                Sub_type.Items.Insert(0, new ListItem("--Select--", "0"));
            }
        }
        
    }

    private void BindSize()
    {
        using (SqlConnection con = new SqlConnection(Connection))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from Product_Size where Brand_id='" + Product_Brand.SelectedItem.Value + "' and category_id='" + Product_Category.SelectedItem.Value + "' and subCategory_id='" + Sub_Category.SelectedItem.Value + "' and Gender_id='" + Gender.SelectedItem.Value + "' and productType_id='" + ProductType.SelectedItem.Value + "' and product_SubType_id='" + Sub_type.SelectedItem.Value + "'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                CheckBoxSize.DataSource = dt;
                CheckBoxSize.DataTextField = "Size_Name";
                CheckBoxSize.DataValueField = "Size_id";
                CheckBoxSize.DataBind();
            }
        }
    }

    private void BindWeight()
    {
        using (SqlConnection con = new SqlConnection(Connection))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select * from Gross_Weight where Brand_id='" + Product_Brand.SelectedItem.Value + "' and category_id='" + Product_Category.SelectedItem.Value + "' and subCategory_id='" + Sub_Category.SelectedItem.Value + "' and Gender_id='" + Gender.SelectedItem.Value + "' and productType_id='" + ProductType.SelectedItem.Value + "' and product_SubType_id='" + Sub_type.SelectedItem.Value + "'", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count != 0)
            {
                CheckBoxWeight.DataSource = dt;
                CheckBoxWeight.DataTextField = "Weight_Name";
                CheckBoxWeight.DataValueField = "Weight_id";
                CheckBoxWeight.DataBind();
            }
        }
    }

    protected void Sub_type_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Sub_type.SelectedIndex != 0)
        {
            CheckBoxSize.Enabled = true;
            CheckBoxWeight.Enabled = true;
            BindSize();
            BindWeight();
        }
        else
        {
            CheckBoxSize.Enabled = false;
            CheckBoxWeight.Enabled = false;
        }
        
    }
    // Main Program To add The Product Starts
    protected void AddProduct_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(Connection))
        {
            SqlCommand cmd = new SqlCommand("sp_insertProduct", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Product_Name", Productname.Text);
            cmd.Parameters.AddWithValue("@Product_ListPrice", Productprice.Text);
            cmd.Parameters.AddWithValue("@Product_SellingPrice", ProductSellingprice.Text);
            cmd.Parameters.AddWithValue("@Product_BrandId", Product_Brand.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@Product_CategoryId", Product_Category.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@Product_SubCategoryId", Sub_Category.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@Gender", Gender.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@Product_Description", Product_Description.Text);
            cmd.Parameters.AddWithValue("@Product_Detail", Product_detail.Text);
            cmd.Parameters.AddWithValue("@Product_Type", ProductType.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@Product_SubType", Sub_type.SelectedItem.Value);

            if (Return.Checked == true)
            {
                cmd.Parameters.AddWithValue("@Return_15_Days", 1.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("@Return_15_Days", 0.ToString());
            }
            if (Return.Checked == true)
            {
                cmd.Parameters.AddWithValue("@Shipping", 1.ToString());
            }
            else
            {
                cmd.Parameters.AddWithValue("Shipping", 0.ToString());
            }

            con.Open();
            Int64 PID = Convert.ToInt64(cmd.ExecuteScalar());

            //Insert Product Stock
            for (int i = 0; i < CheckBoxSize.Items.Count; i++)
            {
                if (CheckBoxSize.Items[i].Selected == true)
                {
                    Int64 SizeId = Convert.ToInt64(CheckBoxSize.Items[i].Value);
                    Int64 WeightId = Convert.ToInt64(CheckBoxSize.Items[i].Value);
                    int Quantity = Convert.ToInt32(Product_Stock.Text);

                    SqlCommand cmd1 = new SqlCommand("insert into Stocks values('" + PID + "','" + Quantity + "','" + SizeId + "','" + WeightId + "')", con);
                    cmd1.ExecuteNonQuery();
                }
            }

            // Insert Product Images
            if (product_image1.HasFile)
            {
                string SavePath = Server.MapPath("~/Images/Product_Images/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);
                }
                string extension = Path.GetExtension(product_image1.PostedFile.FileName);
                product_image1.SaveAs(SavePath + "\\" + Productname.Text.ToString().Trim() + "01" + extension);

                SqlCommand cmd2 = new SqlCommand("insert into Product_Images values('" + PID + "','" + Productname.Text.ToString().Trim() + "01" + "','" + extension + "')", con);
                cmd2.ExecuteNonQuery();
            }
            // 2nd Image upload
            if (product_image2.HasFile)
            {
                string SavePath = Server.MapPath("~/Images/Product_Images/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);
                }
                string extension = Path.GetExtension(product_image2.PostedFile.FileName);
                product_image2.SaveAs(SavePath + "\\" + Productname.Text.ToString().Trim() + "02" + extension);

                SqlCommand cmd3 = new SqlCommand("insert into Product_Images values('" + PID + "','" + Productname.Text.ToString().Trim() + "02" + "','" + extension + "')", con);
                cmd3.ExecuteNonQuery();
            }
            // Image upload 3
            if (product_image3.HasFile)
            {
                string SavePath = Server.MapPath("~/Images/Product_Images/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);
                }
                string extension = Path.GetExtension(product_image3.PostedFile.FileName);
                product_image3.SaveAs(SavePath + "\\" + Productname.Text.ToString().Trim() + "03" + extension);

                SqlCommand cmd4 = new SqlCommand("insert into Product_Images values('" + PID + "','" + Productname.Text.ToString().Trim() + "03" + "','" + extension + "')", con);
                cmd4.ExecuteNonQuery();
            }
            // Image upload 4
            if (product_image4.HasFile)
            {
                string SavePath = Server.MapPath("~/Images/Product_Images/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);
                }
                string extension = Path.GetExtension(product_image4.PostedFile.FileName);
                product_image4.SaveAs(SavePath + "\\" + Productname.Text.ToString().Trim() + "04" + extension);

                SqlCommand cmd5 = new SqlCommand("insert into Product_Images values('" + PID + "','" + Productname.Text.ToString().Trim() + "04" + "','" + extension + "')", con);
                cmd5.ExecuteNonQuery();
            }
            // Image upload 5
            if (product_image5.HasFile)
            {
                string SavePath = Server.MapPath("~/Images/Product_Images/") + PID;
                if (!Directory.Exists(SavePath))
                {
                    Directory.CreateDirectory(SavePath);
                }
                string extension = Path.GetExtension(product_image5.PostedFile.FileName);
                product_image5.SaveAs(SavePath + "\\" + Productname.Text.ToString().Trim() + "05" + extension);

                SqlCommand cmd6 = new SqlCommand("insert into Product_Images values('" + PID + "','" + Productname.Text.ToString().Trim() + "05" + "','" + extension + "')", con);
                cmd6.ExecuteNonQuery();
            }
            Response.Write("<script>alert('Product added Successfully')</script>");

        }
    }

}