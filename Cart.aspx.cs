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

                decimal total = 0,checkboxPrice = 0;
                foreach(RepeaterItem item in CartDatarptr.Items)
                {
                    Label Price = (Label)item.FindControl("Label1");
                    string s = Price.Text;
                    total += Convert.ToDecimal(s);

                    var checkBox1 = (CheckBox)item.FindControl("selectid");
                    if (checkBox1.Checked == true)
                    {
                        //Label Price1 = (Label)item.FindControl("Label1");
                        //string s1 = Price1.Text;
                        checkboxPrice += Convert.ToDecimal(s);
                    }
                }
                GrandPrice.Text += total.ToString();
                Label2.Text += checkboxPrice.ToString();

            }
            else
            {
                Response.Write("<script>alert('Login To Add Product To Cart')</script>");
                Response.Redirect("Login.aspx");
             }

            //delEmpty();
        }
    }

    //private void delEmpty()
    //{
    //    String Name = Session["Username"].ToString();
    //    SqlConnection con = new SqlConnection(Connection);
    //    SqlCommand cmd = new SqlCommand("delete from Temp_Cart Where User_Name = '" + Name + "'", con);
    //    con.Open();
    //    cmd.ExecuteNonQuery();
    //    con.Close();
    //    Response.Redirect("UserHomePage.aspx");
    //}

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
                Response.Write("<Script>alert('Item Deleted Successfully')</Script>");
            }
        }
        BindProductDetail();
    }

    protected void Payment_Click(object sender, EventArgs e)
    {
        String Name = Session["Username"].ToString();
        List<int> ids = new List<int>();
        foreach (RepeaterItem item in CartDatarptr.Items)
        {
            if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
            {
                var checkBox = (CheckBox)item.FindControl("selectid");
                if(checkBox.Checked == true)
                 {
                    Label Cid = ((Label)item.FindControl("id1")) as Label;
                    ids.Add(Convert.ToInt32(Cid.Text));

                    Label PI = ((Label)item.FindControl("pi1")) as Label;
                    Label PN = ((Label)item.FindControl("pn1")) as Label;
                    Label UR = ((Label)item.FindControl("iu1")) as Label;
                    Label SZ = ((Label)item.FindControl("si1")) as Label;
                    Label WG = ((Label)item.FindControl("we1")) as Label;
                    Label PR = ((Label)item.FindControl("pr1")) as Label;
                    Label QN = ((Label)item.FindControl("qu1")) as Label;

                    SqlConnection con = new SqlConnection(Connection);
                    SqlCommand cmd = new SqlCommand(@"INSERT INTO Temp_Cart
           ([Cart_id]
           ,[User_name]
           ,[Product_id]
           ,[Product_Name]
           ,[Image_url]
           ,[Size]
           ,[Weight]
           ,[Price]
           ,[Quantity])
     VALUES
           ('" + Cid.Text + "','"+ Name +"','" + PI.Text + "','" + PN.Text + "','" + UR.Text + "','" + SZ.Text + "','" + WG.Text + "','" + PR.Text + "','" + QN.Text + "')", con);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                  }
            }
        }
        var array = ids.ToArray();
        Session["Cart"] = array;
        Response.Redirect("Payment.aspx");
    }
}