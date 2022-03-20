using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User : System.Web.UI.MasterPage
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        BindCartNum();
        if (Session["Username"] != null)
        {
            //LblSuccess.Text = "Login Success, Welcome" + Session["Username"].ToString();
            logoutbtn.Visible = true;
            loginbtn.Visible = false;
        }
        else
        {
            logoutbtn.Visible = false;
            loginbtn.Visible = true;
            //Response.Redirect("~/Default.aspx");
        }
    }
    public void BindCartNum()
    {
        if (Session["Username"] != null)
        {
            String name = Session["Username"].ToString();
            string stmt = "SELECT COUNT(*) FROM Cart  where User_Name = '" + name + "'";
            int count = 0;

            using (SqlConnection con = new SqlConnection(Connection))
            {
                using (SqlCommand cmdCount = new SqlCommand(stmt, con))
                {
                    con.Open();
                    count = (int)cmdCount.ExecuteScalar();
                }
            }
            num.InnerText = count.ToString();
        }
        else
        {
            num.InnerText = 0.ToString();
        }
    }
    protected void logoutbtn_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/Default.aspx");
        Session["Username"] = null;
    }

    protected void searchbtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewCats.aspx?searchProduct=" + search.Text);
    }
    protected void loginbtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }

    protected void Cart_Click(object sender, EventArgs e)
    {
        if (Session["Username"] != null)
        {
            Response.Redirect("Cart.aspx");
        }
        else if (Session["Username"] == null)
        {
            Response.Write("alert('Login First to add to cart')");
            Response.Redirect("~Login.aspx");
        }
    }
}
