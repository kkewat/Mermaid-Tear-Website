using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminView_Product_aspx : System.Web.UI.Page
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Product_id"] != null)
        {
            if (!IsPostBack)
            {
                BindImage();
                BindProductDetail();
            }
        }
        else
        {
            Response.Redirect("Products.aspx");
        }
        if (Session["Username"] != null)
        {
            String name = Session["Username"].ToString();
        }
    }

    private void BindProductDetail()
    {
        try
        {
            int PID = Convert.ToInt32(Request.QueryString["Product_id"]); //int64 PID = Convert.ToInt64(Request.QueryString["Product_id"]);
            using (SqlConnection con = new SqlConnection(Connection))
            {
                using (SqlCommand cmd = new SqlCommand("Select * from Products_Detail where Product_id='" + PID + "'", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        ProDetailrptr.DataSource = dt;
                        ProDetailrptr.DataBind();
                    }
                }

                using (SqlCommand cmd1 = new SqlCommand("select * from Stocks where Product_id='" + PID + "'", con))
                {
                    foreach (RepeaterItem item in ProDetailrptr.Items)
                    {
                        Label stocks = (Label)item.FindControl("Stock");
                        con.Open();
                        SqlDataReader reader = cmd1.ExecuteReader();
                        reader.Read();
                        stocks.Text = reader["Quantity"].ToString();
                        reader.Close();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("error.aspx");
        }
    }

    private void BindImage()
    {
        try
        {
            int PID = Convert.ToInt32(Request.QueryString["Product_id"]); //int64 PID = Convert.ToInt64(Request.QueryString["Product_id"]);
            using (SqlConnection con = new SqlConnection(Connection))
            {
                using (SqlCommand cmd = new SqlCommand("Select A.Product_id,A.Product_BrandId,B.*,C.* from Products_Detail A inner join Product_Images B on B.Product_id = A.Product_id inner join Brand C on C.Brand_id = A.Product_BrandId Where A.Product_id = '" + PID + "'", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        Imagerptr.DataSource = dt;
                        Imagerptr.DataBind();
                    }
                }

            }
        }
        catch (Exception ex)
        {
            Response.Redirect("error.aspx");
        }
    }
    protected string GetActiveImage(int ItemIndex)
    {
        if (ItemIndex == 0)
        {
            return "active";
        }
        else
        {
            return "";
        }
    }

    protected void ProDetailrptr_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
            int PID = Convert.ToInt32(Request.QueryString["Product_id"]);
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string Brandid = (e.Item.FindControl("HiddenBrand") as HiddenField).Value;
                string Catid = (e.Item.FindControl("hiddenCatid") as HiddenField).Value;
                string SubCatid = (e.Item.FindControl("HiddenSubCatid") as HiddenField).Value;
                string Genderid = (e.Item.FindControl("HiddenGenderid") as HiddenField).Value;
                string PTypeid = (e.Item.FindControl("HiddenPTypeid") as HiddenField).Value;
                string PSubTypeid = (e.Item.FindControl("HiddenPSubTypeid") as HiddenField).Value;

                RadioButtonList rblSize = e.Item.FindControl("rblSize") as RadioButtonList;
                RadioButtonList rblWeight = e.Item.FindControl("rblWeight") as RadioButtonList;

                using (SqlConnection con = new SqlConnection(Connection))
                {
                    using (SqlCommand cmd = new SqlCommand("select A.*,B.*,C.* from viewSize A inner join Products_Detail B on A.product_id = B.Product_id inner join Product_Size C on A.size = C.Size_id where A.product_id='" + PID + "'", con))
                    {
                        cmd.CommandType = CommandType.Text;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            rblSize.DataSource = dt;
                            rblSize.DataTextField = "Size_Name";
                            rblSize.DataValueField = "Size_id";
                            rblSize.DataBind();
                        }
                    }
                    using (SqlCommand cmd = new SqlCommand("select A.*,B.*,C.* from viewWeight A inner join Products_Detail B on A.product_id = B.Product_id inner join Gross_Weight C on A.weight = C.Weight_id where A.product_id='" + PID + "'", con))
                    {
                        cmd.CommandType = CommandType.Text;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            rblWeight.DataSource = dt;
                            rblWeight.DataTextField = "Weight_Name";
                            rblWeight.DataValueField = "Weight_id";
                            rblWeight.DataBind();
                        }
                    }
                    rblSize.Items[0].Selected = true;
                    rblWeight.Items[0].Selected = true;
                }

            }
        }
        catch (Exception ex)
        {
            Response.Redirect("error.aspx");
        }
    }

    protected void AddToCartbtn_Click(object sender, EventArgs e)
    {
        try
        {
            String SelectedSize = string.Empty;
            String SelectedSizeName = string.Empty;
            String SelectedWeight = string.Empty;
            String SelectedWeightName = string.Empty;
            if (Session["Username"] != null)
            {
                string name = Session["Username"].ToString();


                foreach (RepeaterItem item in ProDetailrptr.Items)
                {
                    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    {
                        var rbList = item.FindControl("rblSize") as RadioButtonList;
                        SelectedSize = rbList.SelectedValue;
                        SelectedSizeName = rbList.SelectedItem.Text;

                        var rbList1 = item.FindControl("rblWeight") as RadioButtonList;
                        SelectedWeight = rbList1.SelectedValue;
                        SelectedWeightName = rbList1.SelectedItem.Text;

                        var lblerror = item.FindControl("Labelerror") as Label;
                        lblerror.Text = " ";
                    }
                }
                if (SelectedSize != "")
                {
                    int PID = Convert.ToInt32(Request.QueryString["Product_id"]);
                    String P_Name, Image, url, Price, extension, img;

                    SqlConnection con = new SqlConnection(Connection);
                    SqlCommand cmd1 = new SqlCommand("Select A.*,B.* from Products_Detail A inner join Product_Images B on B.Product_id = A.Product_id Where A.Product_id ='" + PID + "'", con);
                    con.Open();
                    SqlDataReader reader = cmd1.ExecuteReader();

                    reader.Read();
                    P_Name = reader["Product_Name"].ToString();
                    Image = reader["Name"].ToString();
                    extension = reader["Extension"].ToString();

                    img = @"Images\Product_Images\" + PID.ToString() + @"\";

                    url = String.Concat(img, Image, extension);

                    Price = reader["Product_SellingPrice"].ToString();
                    reader.Close();
                    con.Close();

                    SqlCommand cmd = new SqlCommand(@"INSERT INTO Cart
           ([User_Name]
           ,[Product_id]
           ,[Product_Name]
           ,[Image_Url]
           ,[Size]
           ,[Weight]
           ,[Price]
           ,[Quantity])
     VALUES
           ('" + name + "','" + PID + "','" + P_Name + "','" + url + "','" + SelectedSizeName + "','" + SelectedWeightName + "','" + Price + "','1')", con);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Added to Cart Successfully')</script>");
                    con.Close();

                }
            }
            else if (Session["Username"] == null)
            {
                Response.Write("<script>alert('Unable to Add product. Login First to add to cart')</script>");
                Response.Redirect("Login.aspx");
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("error.aspx");
        }
    }

    protected void fedbacck_Click(object sender, EventArgs e)
    {
        try
        {
            int PID = Convert.ToInt32(Request.QueryString["Product_id"]);
            if (Session["Username"] != null)
            {
                String Name = Session["Username"].ToString();
                SqlConnection con = new SqlConnection(Connection);
                SqlCommand cmd = new SqlCommand("insert into Feedback values ('" + Name + "','" + PID + "','" + feedback.Text + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Feedback Submitted Successfully')</script>");
                feedback.Text = null;
            }
            else if (Session["Username"] == null)
            {
                Response.Write("<script>alert('Unable to Send Feedback. Login First.')</script>");
                Response.Redirect("Login.aspx");
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("error.aspx");
        }
    }
}