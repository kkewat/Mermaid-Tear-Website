using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Orders : System.Web.UI.Page
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindOrders();
        }
        if (Session["Username"] == null)
        {
            Response.Write("alert('Only Register User Can view Orders')");
            Response.Redirect("~Login.aspx");
        }
    }

    private void BindOrders()
    {
        try
        {
            SqlConnection con = new SqlConnection(Connection);
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM [Order] ORDER BY Order_id DESC", con))   // We write Order as [Order] because Order is an Command in sql and our table is also named order
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
        catch (Exception)
        {

            Response.Redirect("error.aspx");
        }
    }
}