using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    public static String Connection = ConfigurationManager.ConnectionStrings["Dbconnection"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        BindCartNum();
        Session["Username"] = null;
        if (!IsPostBack)
        {
            BindProdViewRepeater();
            BindImage();
        }
    }

    private void BindImage()
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
            throw ex;
        }
    }

    public void crtbutton() {
        Response.Write("<script>alert('login to use cart')</script>");
    }
    public void BindCartNum()
    {
       num.InnerText = 0.ToString();   
    }

    protected void Cart_Click(object sender, EventArgs e)
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