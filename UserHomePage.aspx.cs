using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserHomePage : System.Web.UI.Page
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        BindCartNum();
        if (Session["Username"]!= null) 
        {
            logoutbtn.Visible = true;
            loginbtn.Visible = false;
            LblSuccess.Text = "Login Success, Welcome "+Session["Username"].ToString();
         }
         else 
         {
            logoutbtn.Visible = false;
            loginbtn.Visible = true;
            //Response.Redirect("~/Login.aspx");
        }
        if (!IsPostBack)
        {
            BindProdViewRepeater();
            BindImage();
        }

    }

    private void BindImage()
    {
        try
        {
            using (SqlConnection con = new SqlConnection(Connection))
            {
                using (SqlCommand cmd = new SqlCommand("Select * from Slider Where Status='Active'", con))
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
        catch (Exception)
        {
            Response.Redirect("error.aspx");
        }
    }
    protected void searchbtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("ViewCats.aspx?searchProduct=" + search.Text);
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
    private void BindProdViewRepeater()
    {
        // Show All Products
        try
        {
            using (SqlConnection con = new SqlConnection(Connection))
            {
                using (SqlCommand cmd = new SqlCommand("BindAllProducts", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrProducts.DataSource = dt;
                        rptrProducts.DataBind();
                    }
                }
            }
        }
        catch (Exception ex)
        {

            //Console.WriteLine("Exception occurr: " + ex);
            Response.Redirect("error.aspx");
        }
    }
    protected void Cart_Click()
    {
        if (Session["Username"] != null)
        {
            Response.Redirect("Cart.aspx");
        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
    }
    public void BindCartNum()
    {
        try
        {
            //String name = Session["Username"].ToString();
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
        catch (Exception)
        {
            Response.Redirect("error.aspx");
        }
    }
    protected void logoutbtn_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Session["Username"] = null;
        Response.Redirect("~/Default.aspx");
        
    }

    protected void loginbtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }

    protected void Cart_Click1(object sender, EventArgs e)
    {
        if (Session["Username"] != null)
        {
            Response.Redirect("Cart.aspx");
        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}