using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Order : System.Web.UI.Page
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindOrders();
            ChangeSelection();
        }
        if (Session["Username"] != null)
        {
            String Name = Session["Username"].ToString();
        }
    }

    private void ChangeSelection()
    {
        try
        {
            foreach (RepeaterItem item in OrderRepeater.Items)
            {
                Label status = (Label)item.FindControl("Label2");
                Label showCancelled = (Label)item.FindControl("Label3");
                LinkButton cancel = (LinkButton)item.FindControl("DeleteOrder");

                string st = status.Text;
                if (st == "Cancelled")
                {
                    cancel.Visible = false;
                    showCancelled.Visible = true;
                }
            }
        }
        catch (Exception)
        {
            Response.Redirect("error.aspx");
        }
    }

    private void BindOrders()
    {
        try
        {
            if (Session["Username"] != null)
            {
                String Name = Session["Username"].ToString();

                //String Name = Session["Username"].ToString();
                SqlConnection con = new SqlConnection(Connection);
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM [Order] where User_Name ='" + Name + "' ORDER BY Order_id DESC", con))   // We write Order as [Order] because Order is an Command in sql and our table is also named order
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        OrderRepeater.DataSource = dt;
                        OrderRepeater.DataBind();

                    }
                }
            }
        }
        catch (Exception)
        {
            Response.Redirect("error.aspx");
        }
    }

    protected void DeleteOrder_Click(object sender, EventArgs e)
    {
        try
        {
            RepeaterItem row = (sender as LinkButton).Parent as RepeaterItem;
            Label oid = ((Label)row.FindControl("Label1")) as Label;
            using (SqlConnection con = new SqlConnection(Connection))
            {
                using (SqlCommand cmd = new SqlCommand(" update [Order] set Order_Status ='Cancelled' Where Order_id = '" + oid.Text + "' ", con))
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    Response.Write("<Script>alert('Item Deleted Successfully')</Script>");
                }
            }
            BindOrders();
            Response.Redirect("User_Order.aspx");
        }
        catch (Exception)
        {
            Response.Redirect("error.aspx");
        }
    }
}