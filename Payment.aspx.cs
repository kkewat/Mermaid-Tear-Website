using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Payment : System.Web.UI.Page
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] != null)
        {
            String name = Session["Username"].ToString();
            BindProductDetail();

            decimal total = 0;
            foreach (RepeaterItem item in CartDatarptr.Items)
            {
                Label Price = (Label)item.FindControl("Label1");
                string s = Price.Text;
                total += Convert.ToDecimal(s);
            }
            GrandPrice.Text += total.ToString();

        }
        else
        {
            Response.Write("<script>alert('Login To Add Product To Cart')</script>");
        }
    }

    private void BindProductDetail()
    {
        String Name = Session["Username"].ToString();
        string id="";
        int[] a = Session["Cart"] as int[];
        int i=0;
        foreach(int n in a)
        {
            if(i>0 & i<a.Length)
            {
                id += ',';
            }
            id += n;
            i++;
        }
        using (SqlConnection con = new SqlConnection(Connection))
        {
            using (SqlCommand cmd = new SqlCommand("Select * from Temp_Cart Where User_Name='" + Name + "'", con))
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
            using (SqlCommand cmd = new SqlCommand("UPDATE Temp_Cart SET Quantity = Quantity + 1 where Cart_id ='" + Cid.Text + "' ", con))
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
            using (SqlCommand cmd = new SqlCommand("UPDATE Temp_Cart SET Quantity = Quantity - 1 where Cart_id ='" + Cid.Text + "' ", con))
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
            using (SqlCommand cmd = new SqlCommand(" delete from Temp_Cart Where Cart_id = '" + Cid.Text + "' ", con))
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Response.Write("<Script>alert('Item Deleted Successfully')</Script>");
            }
        }
        BindProductDetail();
    }



    protected void Buy_Click(object sender, EventArgs e)
    {
        String Name = Session["Username"].ToString();
        DateTime dt = DateTime.Now;                //assigns date and time
        string currentDate = dt.ToString("dd MMMM yyyy");
        string currentTime = dt.ToString("hh:mm:ss tt");

        string Payment_Type = string.Empty;
        string Status = string.Empty;

        foreach (RepeaterItem item in CartDatarptr.Items)
        {
            if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
            {
                Label PI = ((Label)item.FindControl("pi1")) as Label;
                Label PN = ((Label)item.FindControl("pn1")) as Label;
                Label UR = ((Label)item.FindControl("iu1")) as Label;
                Label SZ = ((Label)item.FindControl("si1")) as Label;
                Label WG = ((Label)item.FindControl("we1")) as Label;
                Label PR = ((Label)item.FindControl("pr1")) as Label;
                Label QN = ((Label)item.FindControl("qu1")) as Label;

                if(rbOffline.Checked)
                {
                    Payment_Type = "Offline";
                    Status = "Pending";
                }
                else if(rbOnline.Checked)
                {
                    Payment_Type = "Online";
                    Status = "Paid";
                }

                SqlConnection con = new SqlConnection(Connection);
                SqlCommand cmd = new SqlCommand(@"INSERT INTO [Order]
                   ([Product_id]
                   ,[User_Name]
                   ,[Product_Name]
                   ,[Size]
                   ,[Weight]
                   ,[Quantity]
                   ,[Price]
                   ,[Address]
                   ,[City]
                   ,[State]
                   ,[Pincode]
                   ,[Country]
                   ,[Payment_Type]
                   ,[Payment_Status]
                   ,[Date]
                   ,[Time]
                   ,[Order_Status])
                   VALUES
                   ('" + PI.Text + "','" + Name + "','" + PN.Text + "','" + SZ.Text + "','" + WG.Text + "','" + QN.Text + "','" + PR.Text + "','" + Address.Text + "','" + City.Text + "','" + State.Text + "','" + Pincode.Text + "','" + Country.Text + "','" + Payment_Type + "','"+ Status +"','" + currentDate + "','" + currentTime + "','Delivering')", con);

                con.Open();
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert(' Order Placed Successfully ')</script>");
                con.Close();              
            }
        }
        delEmpty();
    }

    private void delEmpty()
    {
        String Name = Session["Username"].ToString();
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmd = new SqlCommand("delete from Temp_Cart Where User_Name = '" + Name + "'", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("UserHomePage.aspx");
    }

    protected void emptyorder_Click(object sender, EventArgs e)
    {
        String Name = Session["Username"].ToString();
        SqlConnection con = new SqlConnection(Connection);
        SqlCommand cmd = new SqlCommand("delete from Temp_Cart Where User_Name = '" + Name + "'", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("UserHomePage.aspx");
    }
}