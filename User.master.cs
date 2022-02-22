using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User : System.Web.UI.MasterPage
{
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
            Response.Redirect("~/Default.aspx");
        }
    }
    public void BindCartNum()
    {
        if (Request.Cookies["CartPID"] != null)
        {
            string CookiePID = Request.Cookies["CartPID"].Value.Split('=')[1];
            string[] Product = CookiePID.Split(',');
            int Count = Product.Length;
            num.InnerText = Count.ToString();
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

    protected void loginbtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Login.aspx");
    }

    protected void Cart_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cart.aspx");
    }
}
